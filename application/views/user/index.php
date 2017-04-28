<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<ul class="nav nav-tabs">
	<li class="active"><a href="#user-list" data-toggle="tab">Administrator List</a></li>
    <li><a href="#user-add" data-toggle="tab">Add new administrator</a></li>
</ul>

<div class="tab-content">
	<div id="user-list" class="tab-pane fade active in">
		<table id="user-grid">
 			<thead>
				<tr>
	          		<th>Full Name</th>
	          		<th>Username</th>
	          		<th>Contact</th>
	          		<th>Department</th>
	          		<th>Created By</th>
	          		<th>Created Date</th>
	          		<th>Modified Date</th>
	          		<th>Admin Type</th>
	      		</tr>
	  		</thead>
	  		<tbody>
				<tr>
					<td colspan="7"></td>
				</tr>
			</tbody>
 		</table>
	</div>
	<div id="user-add" class="tab-pane fade form-container">
		<?=$this->load->view('user/modal-add-user')?>
	</div>
</div>

<script id="template-user" type="text/x-handlebars-template">
	<tr>
  		<td>{{Name}}</td>
		<td>{{UserName}}</td>
  		<td>{{Contact}}</td>
  		<td>{{{Address}}}</td>
  		<td>{{{CreatorName}}}</td>
  		<!-- <td><a href="<?=site_url('user/profile')?>/{{CreatedBy}}">{{CreatorName}}</a></td> -->
  		<td>{{CreatedDate}}</td>
  		<td>{{ModifiedDate}}</td>
  		<td>{{AdminType}}</td>
	</tr>
</script>

<script>
	function renderUserList() {
		$.fetchRemoteData('user', 'getUsers').then(function (data) {
			$.hideSpinner();
			var template = Handlebars.compile($('#template-user').html());
			var dataSource = new kendo.data.DataSource({
			     data: data,
			     pageSize: 10
			});

			var grid = $('#user-grid').data('kendoGrid');

			if(grid === undefined) {
				$('#user-grid').kendoGrid({
					filterable: false,
					sortable: false,
	     			scrollable: true,
	     			pageable: {
	     				info: true
	     			},
	     			scrollable: false,
	     			rowTemplate: function(data) {
		                return template(data);
		            },
		            dataSource: dataSource
				});
			}
			else {
				grid.setDataSource(dataSource);
				grid.refresh();
			}
		});
	}
	$(function () {
		renderUserList();
		$(document).on('event/userAdded', function () {
			renderUserList();
		});
		$('a[data-toggle="tab"]:last').on('shown', function () {
			clearInput();
		});
	});
</script>