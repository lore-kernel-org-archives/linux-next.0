From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Mon, 6 Feb 2017 15:31:51 +1100
Message-ID: <20170206153151.3e999469@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751052AbdBFEby (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Feb 2017 23:31:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/lirc/lirc_parallel.c

between commit:

  2933974cbb03 ("[media] staging: lirc_parallel: remove")

from the v4l-dvb tree and commit:

  1c5fa1c7dbff ("staging: media: lirc: use new parport device model")

from the staging tree.

Unfortunate ...

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
