From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma-leon tree with Linus' tree
Date: Mon, 13 Feb 2017 10:30:29 +1100
Message-ID: <20170213103029.60176142@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751000AbdBLXac (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Feb 2017 18:30:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Ledford <dledford@redhat.com>

Hi Leon,

Today's linux-next merge of the rdma-leon tree got a conflict in:

  include/uapi/rdma/ib_user_verbs.h

between commit:

  646ebd4166ca ("RDMA: Don't reference kernel private header from UAPI header")

from Linus' tree and commit:

  39bfb78f4acb ("RDMA: Remove kernel private defines and reference to header from UAPI")

from the rdma-leon tree.

More or less the same patch.

I fixed it up (I used the version from Linus' tree (as it contains
explanatory comments)) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
