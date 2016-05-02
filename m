From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 2 May 2016 10:59:43 +1000
Message-ID: <20160502105943.72202e80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/overlayfs/super.c

between commit:

  d478d6a8b8b7 ("ovl: ignore permissions on underlying lookup")

from the overlayfs tree and commit:

  5cf3e7fecb43 ("ovl_lookup_real(): use lookup_one_len_unlocked()")

from the vfs tree.

I fixed it up (I used the overlayfs version, since I don't know the
locking consequences of teh change from lookup_one_len() to lookup_hash())
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
