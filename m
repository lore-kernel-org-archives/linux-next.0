From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xfs tree with Linus' tree
Date: Thu, 21 Jul 2016 11:07:56 +1000
Message-ID: <20160721110756.7a905ee8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41797 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752694AbcGUBH6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 21:07:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jann Horn <jann@thejh.net>

Hi all,

Today's linux-next merge of the xfs tree got a conflict in:

  fs/xfs/xfs_ioctl.c

between commit:

  3e0a39654645 ("xfs: fix type confusion in xfs_ioc_swapext")

from Linus' tree and commit:

  7f1b62457b58 ("xfs: fix type confusion in xfs_ioc_swapext")

from the xfs tree.

These are not quite the same patch :-(

I fixed it up (I used the version in the xfs tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
