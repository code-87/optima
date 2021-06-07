<?php
class Pagination {
	public $total = 0;
	public $page = 1;
	public $limit = 20;
	public $num_links = 6;
	public $url = '';
	public $text_first = '|&lt;';
	public $text_last = '&gt;|';
	public $text_next = '<img src="img/next.svg" />';
	public $text_prev = '<img src="img/prev.svg" />';

	public function render() {
		$total = $this->total;

		if ($this->page < 1) {
			$page = 1;
		} else {
			$page = $this->page;
		}

		if (!(int)$this->limit) {
			$limit = 10;
		} else {
			$limit = $this->limit;
		}

		$num_links = $this->num_links;
		$num_pages = ceil($total / $limit);

		$this->url = str_replace('%7Bpage%7D', '{page}', $this->url);

		$output = '<div class="catalog__links">';

if ($page > 1) { //Если номер текущей страницы больше 1
 
    if ($page - 1 === 1) { //Если при этом предыдущая страница, относительно текущей, имеет номер 1
      $output .= '<a href="' . str_replace(array('&page={page}', '&page={page}'), '', $this->url) . '">' . $this->text_prev . '</a>'; //Выводится кнопка "назад" с ссылкой на 1ю страницу
    } else {
      $output .= '<a href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a>'; //Выводится кнопка "назад" с ссылкой на предыдущую страницу
    }
    
    if( $page >= ($num_links - 1) ){ //Если текущая страница больше или равна количеству выводимых ссылок - 1 (в данном случае >=5)
      $output .= '<a href="' . str_replace('{page}', '&page={page}', $this->url) . '">' . '1' . '</a>'; //Выводим ссылку на первую страницу
      $output .= '<span>' . '...' . '</span></a>'; //Выводим многоточие
    }
 
  }

		if ($num_pages > 1) {
			if ($num_pages <= $num_links) {
				$start = 1;
				$end = $num_pages;
			} else {
				$start = $page - floor($num_links / 2);
				$end = $page + floor($num_links / 2);

				if ($start < 1) {
					$end += abs($start) + 1;
					$start = 1;
				}

				if ($end > $num_pages) {
					$start -= ($end - $num_pages);
					$end = $num_pages;
				}
			}

			for ($i = $start; $i <= $end; $i++) {
				if ($page == $i) {
					$output .= '<a class="active">' . $i . '</a>';
				} else {
					if ($i === 1) {
                        $output .= '<a href="' . str_replace(array('&amp;page={page}', '?page={page}', '&page={page}'), '', $this->url) . '">' . $i . '</a>';
					} else {
						$output .= '<a href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a>';
					}
				}
			}
		}

if ($page < $num_pages) { // Если номер текущей страницы меньше, чем всего страниц
    if ( ($num_pages - $num_links + 1) < $page){ // Если (всего страниц - количество выводимых ссылок + 1) меньше, чем номер текущей страницы
      $output .= '<a href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a>'; //Выводим кнопку "далее"
    }
    else {
      $output .= '<span>' . '...' . '</span></a>'; //Выводим многоточие
      $output .= '<a href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $num_pages . '</a>'; //Выводим ссылку на последнюю страницу
      $output .= '<a href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a>'; //Выводим кнопку "далее"
    }
}

		$output .= '</div>';

		if ($num_pages > 1) {
			return $output;
		} else {
			return '';
		}
	}
}