<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Model_Inventory extends CI_Model
{
    private $_tableUser = 'tbl_user';
    private $_tableInventory = 'tbl_inventory';
    private $_tableInventoryCategory = 'tbl_inventory_category';

    public function __construct()
    {
        parent::__construct();
        date_default_timezone_set('Asia/Jakarta');
    }

    public function addInventory()
    {
    	$warranty = '';
    	if($this->input->post('LifetimeWarranty')) $warranty = $this->input->post('LifetimeWarranty');
    	else
    	{
	    	$warrantyInMonth = $this->input->post('WarrantyInMonth');
	    	$warrantyInYear = $this->input->post('WarrantyInYear');
	    	if((!isset($warrantyInYear) && !isset($warrantyInMonth)) || ($warrantyInYear === 'Year' && $warrantyInMonth === 'Month'))
			{
	    		$warranty .= 'No Warranty';
	    	}
	    	else
	   		{
	    		if(isset($warrantyInYear) && $warrantyInYear !== 'Year')
	    		{
	    			if($warrantyInYear === '1')
	    			{
	    				$warranty .= $warrantyInYear . ' Year';
	    			}
	    			else $warranty .= $warrantyInYear . ' Years';
	    		}
	    		if(isset($warrantyInMonth) && $warrantyInMonth !== 'Month')
	    		{
	    			if($warranty != '') $warranty .= ' and ';
	    			if($warrantyInMonth === '1')
	    			{
	    				$warranty .= $warrantyInMonth . ' Month';
	    			}
	    			else $warranty .= $warrantyInMonth . ' Months';
	    		}
	    	}
    	}

        $Quantity = $this->input->post('Quantity');
        $UnitPrice = $this->input->post('UnitPrice');

        // echo "Hello World";

        $PriceCategory = '';
        if (($UnitPrice >= 1) && ($UnitPrice <= 499999))
        {
            $PriceCategory = 'regular';
        }
        elseif (($UnitPrice >= 500000) && ($UnitPrice <= 2599999))
        {
            $PriceCategory = 'brown';
        }
        elseif (($UnitPrice >= 2600000) && ($UnitPrice <= 5999999))
        {
            $PriceCategory = 'silver';
        }
        elseif (($UnitPrice >= 6000000) && ($UnitPrice <= 12599999))
        {
            $PriceCategory = 'gold';
        }
        elseif ($UnitPrice >= 12600000)
        {
            $PriceCategory = 'platinum';
        }


    	$insert = array (
    		'Title'      		=> $this->input->post('Title'),
    		'CategoryID'   		=> ($this->input->post('CategoryID')) ? $this->input->post('CategoryID') : 1,
    		'Description'   	=> $this->input->post('Description'),
    		'Quantity'      	=> $this->input->post('Quantity'),
    		'Warranty'    		=> $warranty,
    		'UnitPrice'     	=> $this->input->post('UnitPrice'),
            'PriceCategory'     => $this->input->post('PriceCategory'),
            'PriceCategory'     => $PriceCategory,
    		'Status'   			=> ($Quantity > 0) ? 'Yes' : 'No',
    		'CreatedBy'     	=> $this->session->userdata('userId'),
    		'ModifiedBy'    	=> $this->session->userdata('userId'),
            'CreatedDate'       => date("d F, Y"),
            'ModifiedDate'      => date("d F, Y | g:i a")
    	);

    	return $this->Model_DB->create($this->_tableInventory, $insert);
    }

    public function editInventory($id)
    {
        $UnitPrice = $this->input->post('UnitPrice');

        $PriceCategory = '';
        if (($UnitPrice >= 1) && ($UnitPrice <= 499999))
        {
            $PriceCategory = 'regular';
        }
        elseif (($UnitPrice >= 500000) && ($UnitPrice <= 2599999))
        {
            $PriceCategory = 'brown';
        }
        elseif (($UnitPrice >= 2600000) && ($UnitPrice <= 5999999))
        {
            $PriceCategory = 'silver';
        }
        elseif (($UnitPrice >= 6000000) && ($UnitPrice <= 12599999))
        {
            $PriceCategory = 'gold';
        }
        elseif ($UnitPrice >= 12600000)
        {
            $PriceCategory = 'platinum';
        }

    	$data = array (
    		'Title'      		=> $this->input->post('Title'),
    		'CategoryID'   		=> $this->input->post('CategoryID'),
    		'Description'   	=> $this->input->post('Description'),
    		'Quantity'      	=> $this->input->post('Quantity'),
    		'Warranty'    		=> $this->input->post('Warranty'),
    		'UnitPrice'     	=> $this->input->post('UnitPrice'),
            'PriceCategory'     => $PriceCategory,
    		'Status'   			=> $this->input->post('Status'),
    		'ModifiedBy'    	=> $this->session->userdata('userId'),
            'ModifiedDate'      => date("d F, Y | g:i a")
    	);
    	return $this->Model_DB->update($this->_tableInventory, $data, array('ID' => $id));
    }

    public function someMethod($cid) {
        return "Wuhuw";
    }

    public function getInventory($categoryId)
    {
        $columns = array(
                $this->_tableInventory.'.ID',
                'CategoryID',
                'Title',
                'Description',
                'Quantity',
                'UnitPrice',
                'PriceCategory',
                'Warranty',
                'Status',
                $this->_tableInventory.'.CreatedBy',
                $this->_tableInventory.'.CreatedDate',
                $this->_tableUser.'.Name AS CreatorName',
                $this->_tableUser.'.UserName AS CreatorUserName'
        );

        $where = array('CategoryID' => $categoryId);

        $this->db->select($columns);
        $this->db->join($this->_tableUser, 'tbl_user.ID = tbl_inventory.CreatedBy');
        $this->db->where($where);
        $this->db->order_by($this->_tableInventory.'.ID', 'desc');

        $query = $this->db->get($this->_tableInventory);

        if($query->num_rows() > 0)
        {
            return $query->result();
        }
        return FALSE;
    }

    public function getInventoryById($id)
    {
        $columns1 = array(
            'ID', 'CategoryID', 'Title', 'Description',
            'Quantity', 'UnitPrice', 'PriceCategory', 'Warranty', 'Status'
        );

        return $this->Model_DB->read($this->_tableInventory, $columns1, array('ID' => $id));
    }

    public function getInventoryChart()
    {
    	$this->db->select(array('tbl_inventory_category.CategoryName'));

    	$this->db->select_sum('tbl_inventory.Quantity', 'Quantity');
    	$this->db->join($this->_tableInventoryCategory, 'tbl_inventory.CategoryID = tbl_inventory_category.ID', 'RIGHT');
    	$this->db->group_by($this->_tableInventoryCategory.'.ID');

    	$query = $this->db->get($this->_tableInventory);
    	
    	if ($query->num_rows() > 0)
    	{
    		return $query->result();
    	}
        return FALSE;
    }

    public function deleteInventory($inventoryId)
    {
    	return $this->Model_DB->delete($this->_tableInventory, array('ID' => $inventoryId));
    }
}

/* End of file model_inventory.php */
/* Location: ./application/models/model_inventory.php */