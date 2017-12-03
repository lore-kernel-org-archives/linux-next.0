From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 4 Dec 2017 10:05:27 +1100
Message-ID: <20171204100527.1366a333@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56679 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752074AbdLCXFa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 18:05:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  drivers/net/ethernet/via/via-rhine.c

between commit:

  a7e4fbbfdf79 ("net: via: via-rhine: use %p to format void * address instead of %x")

from Linus' tree and commit:

  68fef306c2a5 ("via: trivial sparse annotations")

from the vfs tree.

I fixed it up (I used the version of the netdev_info line change from
Linus' tree) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
