From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 25 Jul 2016 10:24:53 +1000
Message-ID: <20160725102453.7fbe3ddd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/overlayfs/super.c

between commit:

  e2475b7276d0 ("ovl: check mounter creds on underlying lookup")

from the overlayfs tree and commit:

  b3ac9a85b31c ("qstr: constify instances in overlayfs")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/overlayfs/super.c
index 4c91d9ed4689,bc10c261a006..000000000000
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@@ -419,21 -423,12 +419,21 @@@ static bool ovl_dentry_weird(struct den
  				  DCACHE_OP_COMPARE);
  }
  
 -static inline struct dentry *ovl_lookup_real(struct dentry *dir,
 +static inline struct dentry *ovl_lookup_real(struct super_block *ovl_sb,
 +					     struct dentry *dir,
- 					     struct qstr *name)
+ 					     const struct qstr *name)
  {
 +	const struct cred *old_cred;
  	struct dentry *dentry;
 +	int err;
  
 -	dentry = lookup_hash(name, dir);
 +	old_cred = ovl_override_creds(ovl_sb);
 +	err = inode_permission(dir->d_inode, MAY_EXEC);
 +	if (err)
 +		dentry = ERR_PTR(err);
 +	else
 +		dentry = lookup_hash(name, dir);
 +	revert_creds(old_cred);
  
  	if (IS_ERR(dentry)) {
  		if (PTR_ERR(dentry) == -ENOENT)
