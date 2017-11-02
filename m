From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the ext4
 tree
Date: Thu, 2 Nov 2017 18:43:18 +1100
Message-ID: <20171102184318.736bac24@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60931 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750907AbdKBHnU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 03:43:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mel Gorman <mgorman@techsingularity.net>, Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/ext4/file.c

between commit:

  545052e9e35a ("ext4: Switch to iomap for SEEK_HOLE / SEEK_DATA")

from the ext4 tree and commit:

  f7d4010a3383 ("mm, pagevec: remove cold parameter for pagevecs")

from the akpm-current tree.

I fixed it up (the former removed the reference to pagevec_init that
was updated in the latter) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
