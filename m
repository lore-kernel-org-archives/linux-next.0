From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 10 Oct 2016 11:20:06 +1100
Message-ID: <20161010112006.7a638803@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/overlayfs/super.c

between commit:

  2b6bc7f48d34 ("ovl: lookup: do getxattr with mounter's permission")

from the overlayfs tree and commit:

  5d6c31910bc0 ("xattr: Add __vfs_{get,set,remove}xattr helpers")

from the vfs tree.

I fixed it up (I just used the overlayfs tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
