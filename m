From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 10 Oct 2016 11:20:24 +1100
Message-ID: <20161010112024.4690d480@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, Seth Forshee <seth.forshee@canonical.com>, Jan Kara <jack@suse.cz>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/fuse/dir.c

between commits:

  5e2b8828ff3d ("fuse: invalidate dir dentry after chmod")
  a09f99eddef4 ("fuse: fix killing s[ug]id in setattr")
  5e940c1dd3c1 ("fuse: handle killpriv in userspace fs")
  60bcc88ad185 ("fuse: Add posix ACL support")

from Linus' tree and commit:

  62490330769c ("fuse: Propagate dentry down to inode_change_ok()")
  fd50ecaddf83 ("vfs: Remove {get,set,remove}xattr inode operations")

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

diff --cc fs/fuse/dir.c
index f7c84ab835ca,009f68e979e2..000000000000
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@@ -1618,10 -1607,10 +1619,10 @@@ int fuse_do_setattr(struct dentry *dent
  	int err;
  	bool trust_local_cmtime = is_wb && S_ISREG(inode->i_mode);
  
 -	if (!(fc->flags & FUSE_DEFAULT_PERMISSIONS))
 +	if (!fc->default_permissions)
  		attr->ia_valid |= ATTR_FORCE;
  
- 	err = inode_change_ok(inode, attr);
+ 	err = setattr_prepare(dentry, attr);
  	if (err)
  		return err;
  
@@@ -1722,56 -1708,10 +1723,56 @@@ static int fuse_setattr(struct dentry *
  	if (!fuse_allow_current_process(get_fuse_conn(inode)))
  		return -EACCES;
  
 -	if (attr->ia_valid & ATTR_FILE)
 -		return fuse_do_setattr(entry, attr, attr->ia_file);
 -	else
 -		return fuse_do_setattr(entry, attr, NULL);
 +	if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
 +		attr->ia_valid &= ~(ATTR_KILL_SUID | ATTR_KILL_SGID |
 +				    ATTR_MODE);
 +
 +		/*
 +		 * The only sane way to reliably kill suid/sgid is to do it in
 +		 * the userspace filesystem
 +		 *
 +		 * This should be done on write(), truncate() and chown().
 +		 */
 +		if (!fc->handle_killpriv) {
 +			int kill;
 +
 +			/*
 +			 * ia_mode calculation may have used stale i_mode.
 +			 * Refresh and recalculate.
 +			 */
 +			ret = fuse_do_getattr(inode, NULL, file);
 +			if (ret)
 +				return ret;
 +
 +			attr->ia_mode = inode->i_mode;
 +			kill = should_remove_suid(entry);
 +			if (kill & ATTR_KILL_SUID) {
 +				attr->ia_valid |= ATTR_MODE;
 +				attr->ia_mode &= ~S_ISUID;
 +			}
 +			if (kill & ATTR_KILL_SGID) {
 +				attr->ia_valid |= ATTR_MODE;
 +				attr->ia_mode &= ~S_ISGID;
 +			}
 +		}
 +	}
 +	if (!attr->ia_valid)
 +		return 0;
 +
- 	ret = fuse_do_setattr(inode, attr, file);
++	ret = fuse_do_setattr(entry, attr, file);
 +	if (!ret) {
 +		/*
 +		 * If filesystem supports acls it may have updated acl xattrs in
 +		 * the filesystem, so forget cached acls for the inode.
 +		 */
 +		if (fc->posix_acl)
 +			forget_all_cached_acls(inode);
 +
 +		/* Directory mode changed, may need to revalidate access */
 +		if (d_is_dir(entry) && (attr->ia_valid & ATTR_MODE))
 +			fuse_invalidate_entry_cache(entry);
 +	}
 +	return ret;
  }
  
  static int fuse_getattr(struct vfsmount *mnt, struct dentry *entry,
@@@ -1800,12 -1740,7 +1801,9 @@@ static const struct inode_operations fu
  	.mknod		= fuse_mknod,
  	.permission	= fuse_permission,
  	.getattr	= fuse_getattr,
- 	.setxattr	= generic_setxattr,
- 	.getxattr	= generic_getxattr,
  	.listxattr	= fuse_listxattr,
- 	.removexattr	= generic_removexattr,
 +	.get_acl	= fuse_get_acl,
 +	.set_acl	= fuse_set_acl,
  };
  
  static const struct file_operations fuse_dir_operations = {
@@@ -1823,12 -1758,7 +1821,9 @@@ static const struct inode_operations fu
  	.setattr	= fuse_setattr,
  	.permission	= fuse_permission,
  	.getattr	= fuse_getattr,
- 	.setxattr	= generic_setxattr,
- 	.getxattr	= generic_getxattr,
  	.listxattr	= fuse_listxattr,
- 	.removexattr	= generic_removexattr,
 +	.get_acl	= fuse_get_acl,
 +	.set_acl	= fuse_set_acl,
  };
  
  static const struct inode_operations fuse_symlink_inode_operations = {
