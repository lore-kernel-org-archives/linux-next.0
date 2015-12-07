From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 7 Dec 2015 12:46:36 +1100
Message-ID: <20151207124636.6ba25cdd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60531 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754612AbbLGBqj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Dec 2015 20:46:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

fs/overlayfs/inode.c

between commit:

  0f7ff2dabbc9 ("ovl: get rid of the dead code left from broken (and disabled) optimizations")

from Linus' tree and commit:

  58809fadd08b ("broken permission checks in overlayfs ->setattr()")

from the vfs tree.

I fixed it up (I used the name ovl_copy_up_truncate from Linus' tree instead of ovl_copy_up_last) and can carry the fix as necessary (no action is required).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
