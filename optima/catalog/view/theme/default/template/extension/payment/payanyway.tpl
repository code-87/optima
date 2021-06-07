<form action="<?php echo $action; ?>" method="post">
  <input type="hidden" name="MNT_ID" value="<?php echo $sid; ?>" />
  <input type="hidden" name="MNT_TRANSACTION_ID" value="<?php echo $cart_order_id; ?>" />
  <input type="hidden" name="MNT_AMOUNT" value="<?php echo $amount; ?>" />
  <input type="hidden" name="MNT_CURRENCY_CODE" value="<?php echo $currency_code; ?>" />
  <input type="hidden" name="MNT_TEST_MODE" value="<?php echo $payanyway_test; ?>" />
  <input type="hidden" name="MNT_SIGNATURE" value="<?php echo $MNT_SIGNATURE; ?>" />
  <input type="hidden" name="MNT_SUCCESS_URL" value="<?php echo $mnt_success_url; ?>" />
  <input type="hidden" name="MNT_FAIL_URL" value="<?php echo $mnt_fail_url; ?>" />
  <input type="hidden" name="MNT_RETURN_URL" value="<?php echo $mnt_return_url; ?>" />
  <input type="hidden" name="MNT_CUSTOM1" value="1">
  <input type="hidden" name="MNT_CUSTOM2" value="<?php echo $payanyway_kassa_data; ?>" />
  <div class="buttons">
    <div class="pull-right">
      <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
    </div>
  </div>
</form>