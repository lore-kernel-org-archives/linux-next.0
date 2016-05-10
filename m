From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Wed, 11 May 2016 09:20:49 +1000
Message-ID: <20160511092049.4d61264d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50914 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751406AbcEJXUw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 May 2016 19:20:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/overlayfs/super.c

between commit:

  420598d5bf9c ("ovl: ignore permissions on underlying lookup")

from the overlayfs tree and commit:

  b9e1d435fdf4 ("ovl_lookup_real(): use lookup_one_len_unlocked()")

from the vfs tree.

I fixed it up (I abitrarily chose the overlayfs version (using
lookup_hash() instead of lookup_one_len_unlocked())) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
