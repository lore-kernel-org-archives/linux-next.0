From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the pinctrl tree
Date: Tue, 16 Feb 2016 14:37:28 +1100
Message-ID: <20160216143728.61372efa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59082 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753324AbcBPDh3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 22:37:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Adamski <krzysztof.adamski@tieto.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/pinctrl/sunxi/pinctrl-sunxi.c

between commit:

  be2d107f4433 ("pinctrl: sunxi: Use pin number when calling sunxi_pmx_set")

from the pinctrl tree and commit:

  6cee3821e4e4 ("gpio/pinctrl: sunxi: stop poking around in private vars")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 96f64a104a62,3e95bfe66a06..000000000000
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@@ -457,9 -457,8 +457,9 @@@ static int sunxi_pinctrl_gpio_get(struc
  	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
  	u32 reg = sunxi_data_reg(offset);
  	u8 index = sunxi_data_offset(offset);
- 	u32 set_mux = pctl->desc->irq_read_needs_mux &&
- 			test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
+ 	bool set_mux = pctl->desc->irq_read_needs_mux &&
+ 		gpiochip_line_is_irq(chip, offset);
 +	u32 pin = offset + chip->base;
  	u32 val;
  
  	if (set_mux)
