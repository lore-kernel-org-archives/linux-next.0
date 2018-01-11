From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the i2c tree
Date: Fri, 12 Jan 2018 10:27:29 +1100
Message-ID: <20180112102729.1868451c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36837 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753715AbeAKX1c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Jan 2018 18:27:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Reid <preid@electromag.com.au>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/i2c/busses/i2c-designware-platdrv.c

between commit:

  0326f9f801b2 ("i2c: designware: rename i2c_dw_plat_prepare_clk to i2c_dw_prepare_clk")

from the i2c tree and commit:

  02e45646d53b ("PM: i2c-designware-platdrv: Optimize power management")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/i2c/busses/i2c-designware-platdrv.c
index 6e0fd94faba1,153b947702c5..000000000000
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@@ -430,16 -471,9 +448,9 @@@ static int dw_i2c_plat_suspend(struct d
  {
  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
  
- 	if (i_dev->suspended) {
- 		i_dev->skip_resume = true;
- 		return 0;
- 	}
- 
  	i_dev->disable(i_dev);
 -	i2c_dw_plat_prepare_clk(i_dev, false);
 +	i2c_dw_prepare_clk(i_dev, false);
  
- 	i_dev->suspended = true;
- 
  	return 0;
  }
  
@@@ -447,19 -481,9 +458,9 @@@ static int dw_i2c_plat_resume(struct de
  {
  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
  
- 	if (!i_dev->suspended)
- 		return 0;
- 
- 	if (i_dev->skip_resume) {
- 		i_dev->skip_resume = false;
- 		return 0;
- 	}
- 
 -	i2c_dw_plat_prepare_clk(i_dev, true);
 +	i2c_dw_prepare_clk(i_dev, true);
  	i_dev->init(i_dev);
  
- 	i_dev->suspended = false;
- 
  	return 0;
  }
  
