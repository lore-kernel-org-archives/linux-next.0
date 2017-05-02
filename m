From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the metag tree with Linus' tree
Date: Wed, 3 May 2017 09:19:10 +1000
Message-ID: <20170503091910.156cbcf0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51849 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750769AbdEBXTN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 19:19:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>

Hi James,

Today's linux-next merge of the metag tree got a conflict in:

  arch/metag/include/asm/uaccess.h

between commit:

  db68ce10c4f0 ("new helper: uaccess_kernel(new helper: uaccess_kernel())")

from Linus' tree and commit:

  8a8b56638bca ("metag/uaccess: Fix access_ok()")

from the metag tree.

I fixed it up (I used the metag version (as suggested by James, thanks)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
