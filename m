From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the tty.current tree
Date: Mon, 20 Mar 2017 13:28:39 +1100
Message-ID: <20170320132839.72fac965@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752156AbdCTC2n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Mar 2017 22:28:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>, Michael Neuling <mikey@neuling.org>, Dmitry Vyukov <dvyukov@google.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/tty_ldisc.c

between commit:

  5362544bebe8 ("tty: don't panic on OOM in tty_set_ldisc()")

from the tty.current tree and commit:

  71472fa9c52b ("tty: Fix ldisc crash on reopened tty")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/tty/tty_ldisc.c
index b0500a0a87b8,4ee7742dced3..000000000000
--- a/drivers/tty/tty_ldisc.c
+++ b/drivers/tty/tty_ldisc.c
@@@ -621,14 -669,17 +621,15 @@@ int tty_ldisc_reinit(struct tty_struct 
  		tty_ldisc_put(tty->ldisc);
  	}
  
- 	/* switch the line discipline */
- 	tty->ldisc = ld;
  	tty_set_termios_ldisc(tty, disc);
- 	retval = tty_ldisc_open(tty, tty->ldisc);
+ 	retval = tty_ldisc_open(tty, ld);
  	if (retval) {
- 		tty_ldisc_put(tty->ldisc);
- 		tty->ldisc = NULL;
 -		if (!WARN_ON(disc == N_TTY)) {
 -			tty_ldisc_put(ld);
 -			ld = NULL;
 -		}
++		tty_ldisc_put(ld);
++		ld = NULL;
  	}
+ 
+ 	/* switch the line discipline */
+ 	smp_store_release(&tty->ldisc, ld);
  	return retval;
  }
  
