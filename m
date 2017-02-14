From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the input tree
Date: Tue, 14 Feb 2017 13:10:06 +1100
Message-ID: <20170214131006.4c5ab762@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40035 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751517AbdBNCKJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Feb 2017 21:10:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Douglas Anderson <dianders@chromium.org>

Hi Lee,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/input/keyboard/cros_ec_keyb.c

between commits:

  2057e15945a8 ("Input: cros_ec_keyb - drop unnecessary call to dev_set_drvdata and other changes")
  aef01aad89e4 ("Input: matrix-keypad - switch to using generic device properties")

from the input tree and commit:

  cdd7950e7aa4 ("input: cros_ec_keyb: Add non-matrix buttons and switches")

from the mfd tree.

It looks like the latter introduces a call to dev_get_drvdata(), so I
left the dev_set_drvdata() call in.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/input/keyboard/cros_ec_keyb.c
index 780977dcf92d,604c7ade8df2..000000000000
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@@ -213,24 -313,229 +313,229 @@@ static void cros_ec_keyb_compute_valid_
  	}
  }
  
- static int cros_ec_keyb_probe(struct platform_device *pdev)
+ /**
+  * cros_ec_keyb_info - Wrap the EC command EC_CMD_MKBP_INFO
+  *
+  * This wraps the EC_CMD_MKBP_INFO, abstracting out all of the marshalling and
+  * unmarshalling and different version nonsense into something simple.
+  *
+  * @ec_dev: The EC device
+  * @info_type: Either EC_MKBP_INFO_SUPPORTED or EC_MKBP_INFO_CURRENT.
+  * @event_type: Either EC_MKBP_EVENT_BUTTON or EC_MKBP_EVENT_SWITCH.  Actually
+  *              in some cases this could be EC_MKBP_EVENT_KEY_MATRIX or
+  *              EC_MKBP_EVENT_HOST_EVENT too but we don't use in this driver.
+  * @result: Where we'll store the result; a union
+  * @result_size: The size of the result.  Expected to be the size of one of
+  *               the elements in the union.
+  *
+  * Returns 0 if no error or -error upon error.
+  */
+ static int cros_ec_keyb_info(struct cros_ec_device *ec_dev,
+ 			     enum ec_mkbp_info_type info_type,
+ 			     enum ec_mkbp_event event_type,
+ 			     union ec_response_get_next_data *result,
+ 			     size_t result_size)
  {
- 	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
- 	struct device *dev = &pdev->dev;
- 	struct cros_ec_keyb *ckdev;
+ 	struct ec_params_mkbp_info *params;
+ 	struct cros_ec_command *msg;
+ 	int ret;
+ 
+ 	msg = kzalloc(sizeof(*msg) + max_t(size_t, result_size,
+ 					   sizeof(*params)), GFP_KERNEL);
+ 	if (!msg)
+ 		return -ENOMEM;
+ 
+ 	msg->command = EC_CMD_MKBP_INFO;
+ 	msg->version = 1;
+ 	msg->outsize = sizeof(*params);
+ 	msg->insize = result_size;
+ 	params = (struct ec_params_mkbp_info *)msg->data;
+ 	params->info_type = info_type;
+ 	params->event_type = event_type;
+ 
+ 	ret = cros_ec_cmd_xfer(ec_dev, msg);
+ 	if (ret < 0) {
+ 		dev_warn(ec_dev->dev, "Transfer error %d/%d: %d\n",
+ 			 (int)info_type, (int)event_type, ret);
+ 	} else if (msg->result == EC_RES_INVALID_VERSION) {
+ 		/* With older ECs we just return 0 for everything */
+ 		memset(result, 0, result_size);
+ 		ret = 0;
+ 	} else if (msg->result != EC_RES_SUCCESS) {
+ 		dev_warn(ec_dev->dev, "Error getting info %d/%d: %d\n",
+ 			 (int)info_type, (int)event_type, msg->result);
+ 		ret = -EPROTO;
+ 	} else if (ret != result_size) {
+ 		dev_warn(ec_dev->dev, "Wrong size %d/%d: %d != %zu\n",
+ 			 (int)info_type, (int)event_type,
+ 			 ret, result_size);
+ 		ret = -EPROTO;
+ 	} else {
+ 		memcpy(result, msg->data, result_size);
+ 		ret = 0;
+ 	}
+ 
+ 	kfree(msg);
+ 
+ 	return ret;
+ }
+ 
+ /**
+  * cros_ec_keyb_query_switches - Query the state of switches and report
+  *
+  * This will ask the EC about the current state of switches and report to the
+  * kernel.  Note that we don't query for buttons because they are more
+  * transitory and we'll get an update on the next release / press.
+  *
+  * @ckdev: The keyboard device
+  *
+  * Returns 0 if no error or -error upon error.
+  */
+ static int cros_ec_keyb_query_switches(struct cros_ec_keyb *ckdev)
+ {
+ 	struct cros_ec_device *ec_dev = ckdev->ec;
+ 	union ec_response_get_next_data event_data = {};
+ 	int ret;
+ 
+ 	ret = cros_ec_keyb_info(ec_dev, EC_MKBP_INFO_CURRENT,
+ 				EC_MKBP_EVENT_SWITCH, &event_data,
+ 				sizeof(event_data.switches));
+ 	if (ret)
+ 		return ret;
+ 
+ 	cros_ec_keyb_report_bs(ckdev, EV_SW,
+ 			       get_unaligned_le32(&event_data.switches));
+ 
+ 	return 0;
+ }
+ 
+ /**
+  * cros_ec_keyb_resume - Resume the keyboard
+  *
+  * We use the resume notification as a chance to query the EC for switches.
+  *
+  * @dev: The keyboard device
+  *
+  * Returns 0 if no error or -error upon error.
+  */
+ static __maybe_unused int cros_ec_keyb_resume(struct device *dev)
+ {
+ 	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
+ 
+ 	if (ckdev->bs_idev)
+ 		return cros_ec_keyb_query_switches(ckdev);
+ 
+ 	return 0;
+ }
+ 
+ /**
+  * cros_ec_keyb_register_bs - Register non-matrix buttons/switches
+  *
+  * Handles all the bits of the keyboard driver related to non-matrix buttons
+  * and switches, including asking the EC about which are present and telling
+  * the kernel to expect them.
+  *
+  * If this device has no support for buttons and switches we'll return no error
+  * but the ckdev->bs_idev will remain NULL when this function exits.
+  *
+  * @ckdev: The keyboard device
+  *
+  * Returns 0 if no error or -error upon error.
+  */
+ static int cros_ec_keyb_register_bs(struct cros_ec_keyb *ckdev)
+ {
+ 	struct cros_ec_device *ec_dev = ckdev->ec;
+ 	struct device *dev = ckdev->dev;
  	struct input_dev *idev;
- 	struct device_node *np;
- 	int err;
+ 	union ec_response_get_next_data event_data = {};
+ 	const char *phys;
+ 	u32 buttons;
+ 	u32 switches;
+ 	int ret;
+ 	int i;
+ 
+ 	ret = cros_ec_keyb_info(ec_dev, EC_MKBP_INFO_SUPPORTED,
+ 				EC_MKBP_EVENT_BUTTON, &event_data,
+ 				sizeof(event_data.buttons));
+ 	if (ret)
+ 		return ret;
+ 	buttons = get_unaligned_le32(&event_data.buttons);
+ 
+ 	ret = cros_ec_keyb_info(ec_dev, EC_MKBP_INFO_SUPPORTED,
+ 				EC_MKBP_EVENT_SWITCH, &event_data,
+ 				sizeof(event_data.switches));
+ 	if (ret)
+ 		return ret;
+ 	switches = get_unaligned_le32(&event_data.switches);
+ 
+ 	if (!buttons && !switches)
+ 		return 0;
  
- 	np = dev->of_node;
- 	if (!np)
- 		return -ENODEV;
+ 	/*
+ 	 * We call the non-matrix buttons/switches 'input1', if present.
+ 	 * Allocate phys before input dev, to ensure correct tear-down
+ 	 * ordering.
+ 	 */
+ 	phys = devm_kasprintf(dev, GFP_KERNEL, "%s/input1", ec_dev->phys_name);
+ 	if (!phys)
+ 		return -ENOMEM;
  
- 	ckdev = devm_kzalloc(dev, sizeof(*ckdev), GFP_KERNEL);
- 	if (!ckdev)
+ 	idev = devm_input_allocate_device(dev);
+ 	if (!idev)
  		return -ENOMEM;
  
+ 	idev->name = "cros_ec_buttons";
+ 	idev->phys = phys;
+ 	__set_bit(EV_REP, idev->evbit);
+ 
+ 	idev->id.bustype = BUS_VIRTUAL;
+ 	idev->id.version = 1;
+ 	idev->id.product = 0;
+ 	idev->dev.parent = dev;
+ 
+ 	input_set_drvdata(idev, ckdev);
+ 	ckdev->bs_idev = idev;
+ 
+ 	for (i = 0; i < ARRAY_SIZE(cros_ec_keyb_bs); i++) {
+ 		const struct cros_ec_bs_map *map = &cros_ec_keyb_bs[i];
+ 
+ 		if (buttons & BIT(map->bit))
+ 			input_set_capability(idev, map->ev_type, map->code);
+ 	}
+ 
+ 	ret = cros_ec_keyb_query_switches(ckdev);
+ 	if (ret) {
+ 		dev_err(dev, "cannot query switches\n");
+ 		return ret;
+ 	}
+ 
+ 	ret = input_register_device(ckdev->bs_idev);
+ 	if (ret) {
+ 		dev_err(dev, "cannot register input device\n");
+ 		return ret;
+ 	}
+ 
+ 	return 0;
+ }
+ 
+ /**
+  * cros_ec_keyb_register_bs - Register matrix keys
+  *
+  * Handles all the bits of the keyboard driver related to matrix keys.
+  *
+  * @ckdev: The keyboard device
+  *
+  * Returns 0 if no error or -error upon error.
+  */
+ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
+ {
+ 	struct cros_ec_device *ec_dev = ckdev->ec;
+ 	struct device *dev = ckdev->dev;
+ 	struct input_dev *idev;
+ 	const char *phys;
+ 	int err;
+ 
 -	err = matrix_keypad_parse_of_params(dev, &ckdev->rows, &ckdev->cols);
 +	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
  	if (err)
  		return err;
  
