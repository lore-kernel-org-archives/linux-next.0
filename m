From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 2 May 2016 10:49:10 +1000
Message-ID: <20160502104910.4452ab9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51909 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752507AbcEBAtN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 May 2016 20:49:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/nfs/dir.c

between commit:

  09cbfeaf1a5a ("mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros")

from Linus' tree and commit:

  586cf0326586 ("nfs: switch to ->iterate_shared()")
  7d2dbb9faf05 ("fixups for PAGE_CACHE_SIZE/page_cache_release-induced conflicts")

from the vfs tree.

I fixed it up (the latter vfs tree patch repeated the relevant parts of
the patch in Linus' tree, so I just used the vfs tree version) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
