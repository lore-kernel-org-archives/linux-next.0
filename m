From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the input tree
Date: Mon, 20 Mar 2017 15:03:40 +1100
Message-ID: <20170320150340.6d73c179@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47655 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750704AbdCTEGF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Mar 2017 00:06:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/input/misc/soc_button_array.c

between commit:

  a01cd17000a4 ("Input: soc_button_array - use NULL for GPIO connection ID")

from the input tree and commit:

  c5097538c86a ("Input: soc_button_array - Propagate error from gpiod_count()")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/input/misc/soc_button_array.c
index 95b787a63560,c3b8e1fb4699..000000000000
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@@ -312,17 -167,12 +312,18 @@@ static int soc_button_probe(struct plat
  	if (!id)
  		return -ENODEV;
  
 -	button_info = (struct soc_button_info *)id->driver_data;
 +	if (!id->driver_data) {
 +		button_info = soc_button_get_button_info(dev);
 +		if (IS_ERR(button_info))
 +			return PTR_ERR(button_info);
 +	} else {
 +		button_info = (struct soc_button_info *)id->driver_data;
 +	}
  
- 	if (gpiod_count(dev, NULL) <= 0) {
+ 	error = gpiod_count(dev, NULL);
+ 	if (error < 0) {
  		dev_dbg(dev, "no GPIO attached, ignoring...\n");
- 		return -ENODEV;
+ 		return error;
  	}
  
  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
