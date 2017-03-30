From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Thu, 30 Mar 2017 11:07:40 +1100
Message-ID: <20170330110740.36c39581@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50279 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932757AbdC3AHo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 20:07:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josef Bacik <jbacik@fb.com>, Jens Axboe <axboe@fb.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  drivers/block/nbd.c

between commit:

  9dd5d3ab49f7 ("nbd: handle ERESTARTSYS properly")

from Linus' tree and commit:

  7c09d0a53c27 ("backmerge of nbd.c changes, resolving conflicts")

from the vfs tree.

I fixed it up (I used the former change) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

Its probably time that the vfs tree was cleaned up after the last merge
window.
-- 
Cheers,
Stephen Rothwell
