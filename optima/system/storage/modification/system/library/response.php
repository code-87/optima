<?php
class Response {
	private $headers = array();
	private $level = 0;
	private $output;

	//Jet Cache vars
	private $sc_registry = Array();
	//End of Jet Cache vars
    


 	public function seocms_setRegistry($registry) {
		$this->sc_registry = $registry;
	}

 	public function seocms_getHeaders() {
		return $this->headers;
	}
 	public function seocms_getOutput() {
		return $this->output;
	}
    
	public function addHeader($header) {
		$this->headers[] = $header;
	}

	public function redirect($url, $status = 302) {
		header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $url), true, $status);
		exit();
	}

	public function setCompression($level) {
		$this->level = $level;
	}

	public function getOutput() {
		return $this->output;
	}
	
	public function setOutput($output) {
		$this->output = $output;
	}

	private function compress($data, $level = 0) {
		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false)) {
			$encoding = 'gzip';
		}

		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip') !== false)) {
			$encoding = 'x-gzip';
		}

		if (!isset($encoding) || ($level < -1 || $level > 9)) {
			return $data;
		}

		if (!extension_loaded('zlib') || ini_get('zlib.output_compression')) {
			return $data;
		}

		if (headers_sent()) {
			return $data;
		}

		if (connection_status()) {
			return $data;
		}

		$this->addHeader('Content-Encoding: ' . $encoding);

		return gzencode($data, (int)$level);
	}

	public function output() {

			if (is_callable(array($this->sc_registry, 'get')) && $this->output) {
            	if (defined('DIR_CATALOG')) {
            	} else {
	           		if (function_exists('agoo_cont')) {
		           		agoo_cont('record/pagination', $this->sc_registry);
						$this->output = $this->sc_registry->get('controller_record_pagination')->setPagination($this->output);
						unset($this->controller_record_pagintation);

	            		if ($this->sc_registry->get('config')->get('google_sitemap_blog_status')) {
		            		if (isset($this->sc_registry) && $this->sc_registry) {
		            			agoo_cont('record/google_sitemap_blog', $this->sc_registry);
		                		$this->output = $this->sc_registry->get('controller_record_google_sitemap_blog')->setSitemap($this->output);
		                	}
	                	}
                	}
                }
			}
    
		if ($this->output) {
			$output = $this->level ? $this->compress($this->output, $this->level) : $this->output;
			if (!headers_sent()) {
				foreach ($this->headers as $header) {
					header($header, true);
				}
			}
			echo $output;
		}
	}
}
