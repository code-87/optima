<?php
/* All rights reserved belong to the module, the module developers http://opencartadmin.com */
// https://opencartadmin.com � 2011-2019 All Rights Reserved
// Distribution, without the author's consent is prohibited
// Commercial license
class ModelRecordComment extends Model
{
	public function addComment($record_id, $data, $data_get) {
		if (isset($data_get['parent'])) {
			$parent_id = (int)$data_get['parent'];
		} else {
			$parent_id = 0;
		}
		$sql = "
		SELECT r.*, p.*, pp.sorthex as sorthex_parent
		FROM " . DB_PREFIX . "comment r
		LEFT JOIN " . DB_PREFIX . "record p ON (r.record_id = p.record_id)
		LEFT JOIN " . DB_PREFIX . "record_description pd ON (p.record_id = pd.record_id)
		LEFT JOIN " . DB_PREFIX . "comment pp ON (r.parent_id = pp.comment_id)
		WHERE
		r.record_id = '" . (int) $record_id . "'
		AND
		p.record_id = '" . (int) $record_id . "'
		AND r.parent_id = '" . (int) $parent_id . "'
		AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "'
		ORDER BY r.sorthex DESC
		LIMIT 1";
		$query = $this->db->query($sql);
		if (count($query->rows) > 0) {
			foreach ($query->rows as $comment) {
				$sorthex        = $comment['sorthex'];
				$sorthex_parent = $comment['sorthex_parent'];
				$sorthex        = substr($sorthex, strlen($sorthex_parent), 4);
			}
			$sorthex = $sorthex_parent . (str_pad(dechex($sortdec = hexdec($sorthex) + 1), 4, "0", STR_PAD_LEFT));
		} else {
			if ($parent_id == 0) {
				$sorthex = '0000';
			} else {
				$queryparent = $this->db->query("
				SELECT c.sorthex
				FROM " . DB_PREFIX . "comment c
				WHERE c.comment_id = '" . (int) $parent_id . "'
				ORDER BY c.sorthex DESC
				LIMIT 1");
				if (count($queryparent->rows) > 0) {
					foreach ($queryparent->rows as $parent) {
						$sorthex = $parent['sorthex'];
					}
					$sorthex = $sorthex . "0000";
				}
			}
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "comment SET
		author = '" . $this->db->escape(strip_tags(html_entity_decode(str_replace('../', '', (string)$this->db->escape($data['name'])),  ENT_QUOTES, 'UTF-8'))) . "',
		customer_id = '" . (int) $this->customer->getId() . "',
		record_id = '" . (int) $record_id . "',
		sorthex   = '" . $this->db->escape(strip_tags(html_entity_decode(str_replace('../', '', (string)$this->db->escape($sorthex)),  ENT_QUOTES, 'UTF-8'))) . "',
		parent_id = '" . (int) $parent_id . "',
		text = '" . $this->db->escape(strip_tags(html_entity_decode(str_replace('../', '', (string)$this->db->escape($data['text'])),  ENT_QUOTES, 'UTF-8'))) . "',
		status = '" .(int)$data['status'] . "',
		rating = '" . (int) $data['rating'] . "', date_added = NOW()");

		$this->cache->delete('product');
		$this->cache->delete('blog');
	}


	public function checkRate($data = array()) {
		$sql = "SELECT * FROM  " . DB_PREFIX . "rate_comment rc
		WHERE
		customer_id = '" . (int)$data['customer_id'] . "'
		AND
		comment_id = '" . (int)$data['comment_id'] . "'
		LIMIT 1";
		$query = $this->db->query($sql);
		return $query->rows;
	}
	public function checkRateNum($data = array()) {
		$sql = "SELECT *,
        COUNT(c.record_id) as rating_num
		FROM  " . DB_PREFIX . "comment c
		LEFT JOIN " . DB_PREFIX . "rate_comment rc ON (rc.comment_id = c.comment_id)
		WHERE
		rc.customer_id = '" .(int) $data['customer_id'] . "'
		AND
		c.record_id = '" . (int)$data['record_id'] . "'
		GROUP BY c.record_id
		LIMIT 1";
		$query = $this->db->query($sql);
		$query->row['sql'] = $sql;
		return $query->row;
	}
	public function getRecordbyComment($data = array()) {
		$sql = "SELECT c.record_id as record_id
		FROM  " . DB_PREFIX . "comment c
		WHERE
		c.comment_id = '" . (int)$data['comment_id'] . "'
		LIMIT 1";
		$query = $this->db->query($sql);
		$query->row['sql'] = $sql;
		return $query->row;
	}
	public function addRate($data = array()) {
		$sql= "INSERT INTO " . DB_PREFIX . "rate_comment SET
		customer_id = '" . (int)$data['customer_id'] . "',
		comment_id = '" . (int)$data['comment_id'] . "',
		delta = '" . strip_tags(html_entity_decode(str_replace('../', '', (string)$this->db->escape($data['delta'])),  ENT_QUOTES, 'UTF-8')) . "' ";
		$query = $this->db->query($sql);
		return $sql;
	}
	public function getCommentsByRecordId($record_id, $start = 0, $limit = 20) {
		$sql   = "
		SELECT r.*, p.record_id, pd.name, p.price, p.image, r.date_added,  (r.sorthex) as hsort
		FROM " . DB_PREFIX . "comment r
		LEFT JOIN " . DB_PREFIX . "record p ON (r.record_id = p.record_id)
		LEFT JOIN " . DB_PREFIX . "record_description pd ON (p.record_id = pd.record_id)
		WHERE
		r.record_id = '" . (int) $record_id . "'
		AND
		p.record_id = '" . (int) $record_id . "'
		AND p.date_available <= NOW()
		AND p.status = '1'
		AND r.status = '1'
		AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "'
		";
		$query = $this->db->query($sql);
		return $query->rows;
	}
	public function getRecordTotalComments($record_id) {
		$sql   = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment comm
		WHERE
		comm.record_id = " . (int) $record_id . "
		AND
		comm.status = '1'
		GROUP BY comm.record_id";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function getCommentsByBlogsIN($data = array()) {
        /*
        if (SC_VERSION > 15) {
			$get_Customer_GroupId = 'getGroupId';
		} else {
			$get_Customer_GroupId = 'getCustomerGroupId';
		}
		if ($this->customer->isLogged()) {
			$customer_query = " AND (c.customer_group_id = '" . (int) $this->customer->$get_Customer_GroupId() . "' OR c.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "')";
		} else {
			$customer_query = " AND c.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "'";
		}

		$customer_query_in = "(".implode(',', $this->config->get('ascp_customer_groups')).")";
        $customer_query = " AND raccess.customer_group_id IN " . $customer_query_in . " ";
        */

         $customer_query = "";

            if (!$data['status_language']) {
                $language_query = " AND comm.language_id  = '" . (int) $this->config->get('config_language_id') . "' ";
                $language_query_avg = " AND r1.language_id  = '" . (int) $this->config->get('config_language_id') . "' ";
                $language_query_total = " AND r2.language_id  = '" . (int) $this->config->get('config_language_id') . "' ";
            } else {
            	$language_query = '';
            	$language_query_avg = "";
                $language_query_total = "";
            }
            if (isset($data['categories_join']) && $data['categories_join'] && isset($this->request->get['path'])) {
            	$data['categories'] = array();
            	$data['categories'][] = (int)$this->request->get['path'];
            }
            if (isset($data['blogs_join']) && $data['blogs_join'] && isset($this->request->get['blog_id'])) {
            	$data['blogs'] = array();
            	$data['blogs'][] = (int)$this->request->get['blog_id'];
            }

		$sql = "";
		if (isset($data['blogs'])) {
			$i = 1;

			$sql="
(SELECT DISTINCT  SQL_CALC_FOUND_ROWS
			cd.name as blog_name, rd.name as record_name,
            'record' as mark,
			comm.comment_id as comment_id,
			comm.record_id as record_id,
			comm.parent_id as parent_id,
			comm.customer_id as customer_id,
			comm.author as author,
			comm.text as text,
			comm.cmswidget as cmswidget,
			comm.rating as rating,
			comm.rating_mark as rating_mark,
			comm.status as status,
			comm.date_added as date_added,
			comm.date_modified as date_modified,
			comm.text as text, comm.author as author,
			comm.date_added as date_available,
			comm.comment_id as commentid,
			comm.rating_mark as rating_mark,
			rec.viewed as record_viewed, comm.rating as rating, c.blog_id, rec.image,
			(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "comment r1
				WHERE
				r1.record_id = rec.record_id
				AND
				r1.status = '1'
				AND
				r1.rating_mark = '0'
				".$language_query_avg."
				GROUP BY r1.record_id) AS rating_avg,
			(SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment r2
				WHERE
				r2.record_id = rec.record_id
				AND
				r2.status = '1'
				".$language_query_total."
				GROUP BY r2.record_id
				) AS record_comments,
				'blogs' as type
			FROM " . DB_PREFIX . "blog c
			LEFT JOIN " . DB_PREFIX . "blog_description cd ON (c.blog_id = cd.blog_id)
			LEFT JOIN " . DB_PREFIX . "blog_to_store c2s ON (c.blog_id = c2s.blog_id)
			LEFT JOIN " . DB_PREFIX . "record_to_blog r2b ON (c.blog_id = r2b.blog_id)
			LEFT JOIN " . DB_PREFIX . "record rec ON (rec.record_id = r2b.record_id)
			LEFT JOIN " . DB_PREFIX . "record_to_store r2s ON (r2s.record_id = rec.record_id)
			LEFT JOIN " . DB_PREFIX . "record_description rd ON (rec.record_id = rd.record_id)
			LEFT JOIN " . DB_PREFIX . "comment comm ON (rec.record_id = comm.record_id)

            WHERE
			cd.language_id = '" . (int) $this->config->get('config_language_id') . "'
			AND rd.language_id = '" . (int) $this->config->get('config_language_id') . "'
			AND c2s.store_id = '" . (int) $this->config->get('config_store_id') . "'
			AND r2s.store_id = '" . (int) $this->config->get('config_store_id') . "'
			-- AND c.status = '1'
			AND rec.status = '1'
			AND comm.status = '1'
			".$language_query."
			AND	c.blog_id IN (" . implode(',', $data['blogs']);

			$sql .= ") " . $customer_query . "	GROUP BY commentid) ";

		}

        $calc_rows = "";
		if (isset($data['categories']) && count($data['categories']) > 0 && isset($data['blogs'])) {
			$sql .= " UNION ";
		}
		else {
			$calc_rows = " SQL_CALC_FOUND_ROWS ";
		}

		if (isset($data['categories'])) {
			$i = 1;
			$sql .= "
			(SELECT DISTINCT ".$calc_rows."
			cd.name as blog_name, rd.name as record_name,
            'product' as mark,
			comm.review_id as review_id,
			comm.product_id as product_id,
			comm.parent_id as parent_id,
			comm.customer_id as customer_id,
			comm.author as author,
			comm.text as text,
			comm.cmswidget as cmswidget,
			comm.rating as rating,
			comm.rating_mark as rating_mark,
			comm.status as status,
			comm.date_added as date_added,
			comm.date_modified as date_modified,
			comm.text as text, comm.author as author,
			comm.date_added as date_available,
			comm.review_id as commentid,
			comm.rating_mark as rating_mark,
			rec.viewed as record_viewed, comm.rating as rating, c.category_id as blog_id, rec.image,
			(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1
				WHERE
				r1.product_id = rec.product_id
				AND
				r1.status = '1'
				AND
				r1.rating_mark = '0'
				".$language_query_avg."
				GROUP BY r1.product_id) AS rating_avg,

			(SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2
				WHERE
				r2.product_id = rec.product_id
				AND
				r2.status = '1'
				".$language_query_total."
				GROUP BY r2.product_id
				) AS record_comments,

				'categories' as type
			FROM " . DB_PREFIX . "category c
			LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id)
			LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id)
			LEFT JOIN " . DB_PREFIX . "product_to_category r2b ON (c.category_id = r2b.category_id)
			LEFT JOIN " . DB_PREFIX . "product rec ON (rec.product_id = r2b.product_id)
			LEFT JOIN " . DB_PREFIX . "product_to_store r2s ON (r2s.product_id = rec.product_id)
			LEFT JOIN " . DB_PREFIX . "product_description rd ON (rec.product_id = rd.product_id)
			LEFT JOIN " . DB_PREFIX . "review comm ON (rec.product_id = comm.product_id)

			WHERE
			cd.language_id = '" . (int) $this->config->get('config_language_id') . "'
			AND rd.language_id = '" . (int) $this->config->get('config_language_id') . "'
			AND c2s.store_id = '" . (int) $this->config->get('config_store_id') . "'
			AND r2s.store_id = '" . (int) $this->config->get('config_store_id') . "'
			-- AND c.status = '1'
			AND rec.status = '1'
			AND comm.status = '1'
			".$language_query."
            AND	c.category_id IN (" . implode(',', $data['categories']);

			 $sql .= " ) GROUP BY commentid )";
		}

		if ($sql!="") {

			$sort_data = array(
				'rating',
				'comments',
				'popular',
				'latest',
				'sort'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				if ($data['sort'] == 'rating') {
					$data['sort'] = 'rating_avg';
				}
				if ($data['sort'] == 'comments') {
					$data['sort'] = 'record_comments';
				}
				if ($data['sort'] == 'latest') {
					$data['sort'] = 'date_available';
				}
				if ($data['sort'] == 'sort') {
					$data['sort'] = 'commentid';
				}
				if ($data['sort'] == 'popular') {
					$data['sort'] = 'record_viewed';
				}
				$sql .= " ORDER BY " . $data['sort'];
			}
			else {
				$sql .= " ORDER BY date_available";
			}
			if (isset($data['order']) && (strtoupper($data['order']) == 'DESC')) {
				$sql .= " DESC";
			}
			else {
				$sql .= " ASC";
			}
			$data['start'] = 0;

			if (isset($data['paging']['start']) && $data['paging']['start'] != '') {
				$data['start'] = $data['paging']['start'];
			}

			if ($data['number_per_widget'] == '' || $data['number_per_widget'] < 1) {
				$data['number_per_widget'] = 20;
			}

  			$sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['number_per_widget']." ";

			$query = $this->db->query($sql);
			$rows  = $query->rows;

	        $query = $this->db->query("SELECT FOUND_ROWS() as total");
			$crows  = $query->rows;

			foreach ($crows as $num => $val) {
	         $total = $val['total'];
	        }

	        foreach ($rows as $num => $val) {
	         $rows[$num]['total'] = $total;
	        }

			return $rows;
		}
	}


public function getCommentByMark ($data, $mark) {
	$mark = strip_tags(html_entity_decode(str_replace('../', '', (string)$this->db->escape($mark)),  ENT_QUOTES, 'UTF-8'));
	if ($mark == 'product') {
		$table = 'review';
	}
	if ($mark == 'record') {
		$table = 'comment';
	}

	$sql_status = " (" . implode(',', $data['complete_status']) . ") ";

    $sql_product_select_order = '';
    $sql_product_join_order = '';
    $sql_product_select_manufacturer = '';
    $sql_product_join_manufacturer = '';
    $sql_product_join = '';

    if ($mark == 'product') {
     $sql_product_select_order = ", MAX(op.product_id) as buyproduct ";
     $sql_product_join_order = "LEFT JOIN `" . DB_PREFIX . "order_product` op ON (op.order_id = o.order_id AND o.customer_id <> 0 AND o.order_status_id IN ".$sql_status." AND op.product_id = '".(int)$data['record_id']."')";

     $sql_product_join = "LEFT JOIN `" . DB_PREFIX . "product` p ON (p.product_id = '".(int)$data['record_id']."')";

     $sql_product_select_manufacturer = ", mp.name as manufacturer_name, mp.manufacturer_id as manufacturer_id, mp.image as manufacturer_image ";
     $sql_product_join_manufacturer = "LEFT JOIN `" . DB_PREFIX . "manufacturer` mp ON (mp.manufacturer_id = p.manufacturer_id)";
    }

	 $sql = "SELECT
			cu.customer_id,
			cu.avatar as avatar,
			o.order_id as buy,

			SUM(rc.delta) as rate_delta,
			SUM(rc.delta > 0) as rate_delta_blog_plus,
			SUM(rc.delta < 0) as rate_delta_blog_minus

			" . $sql_product_select_order  . "
			" . $sql_product_select_manufacturer  . "

			FROM " . DB_PREFIX . $this->db->escape($table)." r
			LEFT JOIN `" .DB_PREFIX. "customer` cu ON (r.customer_id = cu.customer_id)
			LEFT JOIN `" .DB_PREFIX. "rate_".$this->db->escape($table)."` rc ON (r.".$this->db->escape($table)."_id = rc.".$this->db->escape($table)."_id)
			LEFT JOIN `".DB_PREFIX."order` o ON (r.customer_id = o.customer_id AND o.customer_id <> 0 AND o.order_status_id IN ".$sql_status." )
			" . $sql_product_join_order . "
			" . $sql_product_join . "
			" . $sql_product_join_manufacturer . "
			WHERE
				r.".$this->db->escape($table)."_id = '".(int)$data['comment_id']."'
			AND
				r.status = '1'
            LIMIT 1;
            ";

			$query = $this->db->query($sql);
			$rows  = $query->rows;
			return $rows[0];

}


	public function getRatesByRecordId($record_id, $customer_id) {
		$sql = "
			  SELECT
				rc.*,
				rc.comment_id as cid,
                IF ((SELECT urc.delta  FROM " . DB_PREFIX . "rate_comment urc WHERE urc.customer_id = '" . (int)$customer_id . "' AND urc.comment_id = rc.comment_id)  < 0, -1 ,  IF ((SELECT urc.delta  FROM " . DB_PREFIX . "rate_comment urc WHERE urc.customer_id = '" . (int)$customer_id . "' AND urc.comment_id = rc.comment_id)  > 0, 1 ,  0 ) ) as customer_delta ,
      			COUNT(rc.comment_id) as rate_count,
				SUM(rc.delta) as rate_delta,
				SUM(rc.delta > 0) as rate_delta_blog_plus,
				SUM(rc.delta < 0) as rate_delta_blog_minus
			   FROM
			     " . DB_PREFIX . "rate_comment rc
			   LEFT JOIN " . DB_PREFIX . "comment c on (rc.comment_id = c.comment_id)
			   LEFT JOIN " . DB_PREFIX . "record r on (r.record_id = c.record_id)
			   LEFT JOIN " . DB_PREFIX . "record_description pd ON (r.record_id = pd.record_id)
				   WHERE
			     r.record_id= " . (int) $record_id . "
				AND r.date_available <= NOW()
				AND r.status = '1'
				AND c.status = '1'

				AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "'
			    GROUP BY rc.comment_id
			   ";
		$query = $this->db->query($sql);
		if (count($query->rows) > 0) {
			foreach ($query->rows as $rates) {
				$rate[$rates['cid']] = $rates;
			}
			return $rate;
		}
	}

	public function getRatesByCommentId($comment_id) {
		$sql = "
			  SELECT
				rc.*,
				rc.comment_id as cid,
				COUNT(rc.comment_id) as rate_count,
				SUM(rc.delta) as rate_delta,
				SUM(rc.delta > 0) as rate_delta_blog_plus,
				SUM(rc.delta < 0) as rate_delta_blog_minus
			   FROM
			     " . DB_PREFIX . "rate_comment rc
			   WHERE
			     rc.comment_id= " . (int) $comment_id . "
			    GROUP BY rc.comment_id
			   ";
		$query = $this->db->query($sql);
		if (count($query->rows) > 0) {
			foreach ($query->rows as $rates) {
				$rate[$rates['cid']] = $rates;
			}
		}
		return $query->rows;
	}
	public function getAverageRating($record_id) {
		$query = $this->db->query("SELECT AVG(rating) AS total FROM " . DB_PREFIX . "comment
		WHERE status = '1' AND rating_mark = '0' AND record_id = '" . (int) $record_id . "' GROUP BY record_id");
		if (isset($query->row['total'])) {
			return round($query->row['total']);
		} else {
			return 0;
		}
	}
	public function getTotalComments() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment r
		LEFT JOIN " . DB_PREFIX . "record p ON (r.record_id = p.record_id)
		WHERE p.date_available <= NOW() AND p.status = '1' AND r.status = '1'");
		return $query->row['total'];
	}

	public function getTotalCommentsByRecordId($record_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment r
		LEFT JOIN " . DB_PREFIX . "record p ON (r.record_id = p.record_id)
		LEFT JOIN " . DB_PREFIX . "record_description pd ON (p.record_id = pd.record_id)
		WHERE p.record_id = '" . (int) $record_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1'
		AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "'");
		return $query->row['total'];
	}
}
