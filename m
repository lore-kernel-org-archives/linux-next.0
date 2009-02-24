From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of i2c tree with  tree
Date: Tue, 24 Feb 2009 16:36:32 +1100
Message-ID: <20090224163632.243a1dd6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34051 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752338AbZBXFgh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2009 00:36:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, Timur Tabi <timur@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

Hi Jean,

Today's linux-next merge of the i2c tree got a conflict in
drivers/i2c/busses/i2c-mpc.c between commit
33b6d96528e8f5d5e878b02f4a79b0d25e1773ab ("i2c-mpc: do not allow
interruptions when waiting for I2C to complete") from the galak tree and
commit f967df6fc099e5a775740bc1791a772f4cd61342 ("i2c: Adapter timeout is
in jiffies") from the i2c tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell

diff --cc drivers/i2c/busses/i2c-mpc.c
index 3163eab,2b847d8..0000000
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@@ -115,10 -115,13 +115,10 @@@ static int i2c_wait(struct mpc_i2c *i2c
  		writeb(0, i2c->base + MPC_I2C_SR);
  	} else {
  		/* Interrupt mode */
 -		result = wait_event_interruptible_timeout(i2c->queue,
 +		result = wait_event_timeout(i2c->queue,
- 			(i2c->interrupt & CSR_MIF), timeout * HZ);
+ 			(i2c->interrupt & CSR_MIF), timeout);
  
 -		if (unlikely(result < 0)) {
 -			pr_debug("I2C: wait interrupted\n");
 -			writeccr(i2c, 0);
 -		} else if (unlikely(!(i2c->interrupt & CSR_MIF))) {
 +		if (unlikely(!(i2c->interrupt & CSR_MIF))) {
  			pr_debug("I2C: wait timeout\n");
  			writeccr(i2c, 0);
  			result = -ETIMEDOUT;
