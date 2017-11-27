From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ipmi tree with Linus' tree
Date: Mon, 27 Nov 2017 11:28:25 +1100
Message-ID: <20171127112825.0a597b6a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752143AbdK0A21 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Nov 2017 19:28:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <cminyard@mvista.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Masamitsu Yamazaki <m-yamazaki@ah.jp.nec.com>

Hi Corey,

Today's linux-next merge of the ipmi tree got a conflict in:

  drivers/char/ipmi/ipmi_si_intf.c

between commit:

  e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")

from Linus' tree and commit:

  942e1563654c ("ipmi: Stop timers before cleaning up the module")

from the ipmi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/char/ipmi/ipmi_si_intf.c
index 779869ed32b1,99b0513bb55b..000000000000
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@@ -1166,7 -1165,8 +1165,8 @@@ static int smi_start_processing(voi
  	new_smi->intf = intf;
  
  	/* Set up the timer that drives the interface. */
 -	setup_timer(&new_smi->si_timer, smi_timeout, (long)new_smi);
 +	timer_setup(&new_smi->si_timer, smi_timeout, 0);
+ 	new_smi->timer_can_start = true;
  	smi_mod_timer(new_smi, jiffies + SI_TIMEOUT_JIFFIES);
  
  	/* Try to claim any interrupts. */
