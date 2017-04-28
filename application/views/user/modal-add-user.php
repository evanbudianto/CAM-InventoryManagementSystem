<form action="#" class="form-horizontal user-add-form">
	<input type="hidden" name="<?=$this->security->get_csrf_token_name()?>" value="<?=$this->security->get_csrf_hash();?>" />

	<div class="modal-header">
    	<h3>Add Administrator</h3>
    </div>

    <div id="notification-user-add"></div>

    <div class="modal-body">
	    <div class="control-group">
	        <label class="control-label" for="Name" data-required=1>Full Name</label>
	        <div class="controls">
	            <input type="text" name="Name" class="input-xlarge" />
	        </div>
	    </div>

	    <div class="control-group">
	        <label class="control-label" for="Username" data-required=1>Username</label>
	        <div class="controls">
	            <input type="text" name="UserName" class="input-xlarge" />
	            <label class="error UserName"></label>
	        </div>
	    </div>

	    <div class="control-group">
	        <label class="control-label" for="Password" data-required=1>Password</label>
	        <div class="controls">
	            <input type="password" name="Password" class="input-xlarge" />
	        </div>
	    </div>

	    <div class="control-group">
	        <label class="control-label" for="Contact" data-required=1>Contact</label>
	        <div class="controls">
	            <input type="text" name="Contact" maxlength="20" class="input-xlarge" />
	        </div>
	    </div>

	    <div class="control-group">
	        <label class="control-label" for="Address" data-required=1>Department</label>
	        <div class="controls">
	            <input type="text" name="Address" maxlength="20" class="input-xlarge" />
	        </div>
	    </div>

	    <!--
	    <div class="control-group">
	        <label class="control-label" for="Address" data-required=1>Address</label>
	        <div class="controls">
	        	<textarea name="Address" rows="10" style="width:80%;"></textarea>
	        </div>
	    </div>
	    -->

	    <div class="control-group">
	        <label class="control-label" for="AdminType">Admin Type</label>
	        <div class="controls">
	        	<select class="AdminType">
						<option value="General Admin">General Admin</option>
						<option value="Approval Admin">Approval Admin</option>
				</select>
	            <!-- <input type="text" name="AdminType" maxlength="20" class="input-xlarge" /> -->
	        </div>
	    </div>

	</div>

	<div class="modal-footer">
	    <button type="button" class="btn-add-user btn btn-success btn-ajax">
	    	<i class="icon-plus icon-white"></i> Add Administrator
	    </button>
	    <button type="button" class="btn btn-success btn-loading hide"><i class="icon-spinner icon-spin"></i> loading...</button>
		<button type="reset" class="btn">Reset</button>
    </div>
</form>

<script>
	$(function () {
		$(document).on('click', '.btn-add-user', function () {
			$.buttonIndicator('on');
			$.postRemoteData('user', 'add', $('.user-add-form').serialize()).then(function (data) {
				if(data.status === 'success') {
					$(document).trigger('event/userAdded');
				}
				showNotification(data, '#notification-user-add');
				$.buttonIndicator('off');
			});
		});
	});
</script>