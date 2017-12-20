From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Date: Wed, 20 Dec 2017 13:09:49 +1100
Message-ID: <20171220130949.51553723@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752716AbdLTCJv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Dec 2017 21:09:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>, Colin Ian King <colin.king@canonical.com>

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/usbip/vhci_rx.c

between commit:

  8272d099d05f ("usbip: vhci: stop printing kernel pointer addresses in messages")

from the usb.current tree and commit:

  81d8a8eb0a97 ("USB: usbip: fix spelling mistake: "synchronuously" -> "synchronously"")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/usb/usbip/vhci_rx.c
index 112ebb90d8c9,a9813f1d507d..000000000000
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@@ -29,9 -30,9 +29,9 @@@ struct urb *pickup_urb_and_free_priv(st
  		case -ENOENT:
  			/* fall through */
  		case -ECONNRESET:
 -			dev_info(&urb->dev->dev,
 -				 "urb %p was unlinked %ssynchronously.\n", urb,
 -				 status == -ENOENT ? "" : "a");
 +			dev_dbg(&urb->dev->dev,
- 				 "urb seq# %u was unlinked %ssynchronuously\n",
++				 "urb seq# %u was unlinked %ssynchronously\n",
 +				 seqnum, status == -ENOENT ? "" : "a");
  			break;
  		case -EINPROGRESS:
  			/* no info output */
