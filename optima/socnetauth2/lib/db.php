<?php

Class DB
{
	protected $db;
	
	public function __construct()
	{
		if( !file_exists(DIR_SYSTEM . 'library/db/'.DB_DRIVER.'.php') ) 
			exit('DB connecting error');
		
		include_once(DIR_SYSTEM . 'library/db/'.DB_DRIVER.'.php');
		$class = 'DB\\' . DB_DRIVER;

		if (class_exists($class)) {
			$this->db = new $class(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE, DB_PORT);
		} else {
			exit('Error: Could not load database driver ' . $driver . '!');
		}
	}

	public function query_row($query)
	{
		//echo $query."<hr>";
		
		$result = $this->db->query($query);
		
		return isset($result->row) ? $result->row : array();
	}
	
	
	public function query_rows($query)
	{
		$result = $this->db->query($query);
		
		return isset($result->rows) ? $result->rows : array();
    }
	
	public function query_run($query)
	{
		$this->db->query($query);
	}
	
	public function escape($text)
	{
		return $this->db->escape($text);
	}
	
	public function get_last_insert_id()
	{
		return $this->db->getLastId();
	}
}
?>