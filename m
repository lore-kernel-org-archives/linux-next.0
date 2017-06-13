From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb-gadget tree with Linus' tree
Date: Tue, 13 Jun 2017 16:11:27 +1000
Message-ID: <20170613161127.7a374324@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752045AbdFMGL3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 02:11:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <balbi@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Alan Stern <stern@rowland.harvard.edu>

Hi Felipe,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  drivers/usb/gadget/function/f_mass_storage.c

between commit:

  dc9217b69dd6 ("usb: gadget: f_mass_storage: Serialize wake and sleep execution")

from Linus' tree and commit:

  225785aec726 ("USB: f_mass_storage: improve memory barriers and synchronization")

from the usb-gadget tree.

I fixed it up (I used the usb-gadget tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
