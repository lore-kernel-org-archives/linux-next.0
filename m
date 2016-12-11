From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 12 Dec 2016 10:08:51 +1100
Message-ID: <20161212100851.41831d05@canb.auug.org.au>
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

  fs/overlayfs/dir.c

between commits:

  659f95a46dd0 ("ovl: add ovl_dentry_is_whiteout()")
  ee2e4303d554 ("ovl: opaque cleanup")
  f7cd4e7b2743 ("ovl: clean up kstat usage")

from the overlayfs tree and commit:

  718324db4435 ("overlayfs: stop abusing kstat")

from the vfs tree.

It looks like commits f7cd4e7b2743 and 718324db4435 are essentially the
smae change (with some white space differences).

I fixed it up (I just took bits from each of teh above) and can carry
the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

Miklos, that overlayfs tree commit f7cd4e7b2743 has no Signed-off-by
from Al as its Author :-(

-- 
Cheers,
Stephen Rothwell
