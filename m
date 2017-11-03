From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the gfs2 tree
Date: Fri, 3 Nov 2017 18:04:39 +1100
Message-ID: <20171103180439.491e3e38@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35429 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752196AbdKCHEm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 03:04:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Andreas Gruenbacher <agruenba@redhat.com>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  include/linux/iomap.h

between commit:

  3974320ca6aa ("GFS2: Implement iomap for block_map")

from the gfs2 tree and commit:

  2bc34066c0d4 ("dax, iomap: Add support for synchronous faults")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/iomap.h
index ca10767ab73d,73e3b7085dbe..000000000000
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@@ -22,8 -21,12 +22,13 @@@ struct vm_fault
  /*
   * Flags for all iomap mappings:
   */
 -#define IOMAP_F_NEW	0x01	/* blocks have been newly allocated */
 +#define IOMAP_F_NEW		0x01	/* blocks have been newly allocated */
 +#define IOMAP_F_BOUNDARY	0x02	/* mapping ends at metadata boundary */
+ /*
+  * IOMAP_F_DIRTY indicates the inode has uncommitted metadata needed to access
+  * written data and requires fdatasync to commit them to persistent storage.
+  */
 -#define IOMAP_F_DIRTY	0x02
++#define IOMAP_F_DIRTY		0x04
  
  /*
   * Flags that only need to be reported for IOMAP_REPORT requests:
