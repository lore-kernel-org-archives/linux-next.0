From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb-next tree with the vfs tree
Date: Mon, 11 Dec 2017 11:25:40 +1100
Message-ID: <20171211112540.4c2adc43@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56785 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751637AbdLKAZm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Dec 2017 19:25:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>

Hi Mauro,

Today's linux-next merge of the v4l-dvb-next tree got a conflict in:

  include/media/lirc_dev.h

between commit:

  c23e0cb81e40 ("media: annotate ->poll() instances")

from the vfs tree and various commits from the v4l-dvb-next tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
