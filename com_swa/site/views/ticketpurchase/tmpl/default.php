<?php

// no direct access
defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');

//Load admin language file
$lang = JFactory::getLanguage();
$lang->load('com_swa', JPATH_ADMINISTRATOR);
$doc = JFactory::getDocument();
$doc->addScript(JUri::base() . '/components/com_swa/assets/js/form.js');
?>

	<!--</style>-->
	<script type="text/javascript">
		getScript('//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', function() {
			jQuery(document).ready(function() {
				jQuery('#form-member').submit(function(event) {
				});
			});
		});
	</script>

	<h1>Ticket Purchasing</h1>

<?php
if ( empty( $this->items ) ) {
	echo "<p><b>There are currently no tickets that you can buy!</b></p>";
} else {
	?>
	<table>
		<tr>
			<th>Event</th>
			<th>Date</th>
			<th>Deadline</th>
			<th>Ticket</th>
			<th>Price</th>
			<th>Buy</th>
		</tr>

		<?php
		foreach( $this->items as $item ) {
			echo "<tr>\n";
			echo "<td>" . $item->event . "</td>\n";
			echo "<td>" . $item->event_date . "</td>\n";
			echo "<td>" . $item->event_close . "</td>\n";
			echo "<td>" . $item->ticket_name . "</td>\n";
			echo "<td>" . $item->price . "</td>\n";
			echo "<td>";
			?>

<form id="form-ticketpurchase-<?php echo $item->id ?>" method="POST" action="https://secure.nochex.com/">
	<input type="hidden" name ="merchant_id" value="swa.web@gmail.com" />
	<input type="hidden" name ="amount" value="<?php echo $item->price ?>" />
	<input type="hidden" name ="description" value="SWA Ticket for <?php echo $item->event; ?> - <?php echo $item->ticket_name; ?>" />
	<input type="hidden" name ="order_id" value="j3ticket:<?php echo $item->id . '-' . $this->member->id; ?>" />
	<input type="hidden" name ="callback_url" value="<?php echo JUri::root() . 'index.php?option=com_swa&task=ticketpurchase.callback' ?>" />
	<a href="javascript:{}" onclick="document.getElementById('form-ticketpurchase-<?php echo $item->id ?>').submit(); return false;">(buy)</a>
	<!-- test_transaction = 100 means TEST-->
	<input type="hidden" name ="test_transaction" value="0" />
</form>

			<?php
			echo "</td>\n";
			echo "</tr>\n";
		}
		?>

	</table>
<?php
}
?>