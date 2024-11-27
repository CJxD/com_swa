<?php

defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');

// Load admin language file
$lang = JFactory::getLanguage();
$lang->load('com_swa', JPATH_ADMINISTRATOR);
$doc = JFactory::getDocument();
$doc->addScript(JUri::base() . '/components/com_swa/assets/js/form.js');
?>

<!--</style>-->
<script type="text/javascript">
	getScript('//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', function () {
		jQuery(document).ready(function () {
			jQuery('#form-member').submit(function (event) {
			});
		});
	});
</script>

<h1>Membership Details</h1>

<p>If you need to make any changes on fields that are disabled please email <a href='mailto:webmaster@swa.co.uk'>webmaster@swa.co.uk</a>!</p>

<form id="form-member-details" method="post"
      action="<?php echo JRoute::_('index.php?option=com_swa&task=memberdetails'); ?>"
      class="form-validate form-horizontal" enctype="multipart/form-data">
	<table class="table">
		<thead></thead>
		<tbody>
		<tr>
			<td><label>Name</label></td>
			<td><?php echo $this->user->name; ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('id'); ?></td>
			<td><?php echo $this->form->getInput('id'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('gender'); ?></td>
			<td><?php echo $this->form->getInput('gender'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('pronouns'); ?></td>
			<td><?php echo $this->form->getInput('pronouns'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('ethnicity'); ?></td>
			<td><?php echo $this->form->getInput('ethnicity'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('dob'); ?></td>
			<td><?php echo $this->form->getInput('dob'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('tel'); ?></td>
			<td><?php echo $this->form->getInput('tel'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('university_id'); ?></td>
			<td><?php echo $this->form->getInput('university_id'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('level'); ?></td>
			<td><?php echo $this->form->getInput('level'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('race'); ?></td>
			<td><?php echo $this->form->getInput('race'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('econtact'); ?></td>
			<td><?php echo $this->form->getInput('econtact'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('enumber'); ?></td>
			<td><?php echo $this->form->getInput('enumber'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('dietary'); ?></td>
			<td><?php echo $this->form->getInput('dietary'); ?></td>
		</tr>
		<tr>
			<td><?php echo $this->form->getLabel('medical'); ?></td>
			<td><?php echo $this->form->getInput('medical'); ?></td>
		</tr>

		<tr>
			<td>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="validate btn btn-primary">
							<?php echo JText::_('JSUBMIT'); ?>
						</button>
						<a class="btn" href="<?php echo JRoute::_(
							'index.php?option=com_swa&task=memberdetails.cancel'); ?>"
						   title="<?php echo JText::_('JCANCEL'); ?>">
						<?php echo JText::_('JCANCEL'); ?></a>
					</div>
				</div>
			</td>
		</tr>
		</tbody>
	</table>

	<input type="hidden" name="option" value="com_swa"/>
	<input type="hidden" name="task" value="memberdetails.submit"/>
	<?php echo JHtml::_('form.token'); ?>
</form>
