From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs-jk tree with the fuse tree
Date: Tue, 27 Sep 2016 10:12:04 +1000
Message-ID: <20160927101204.19fdab82@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45391 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756254AbcI0AMH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Sep 2016 20:12:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jan,

Today's linux-next merge of the vfs-jk tree got a conflict in:

  fs/fuse/dir.c

between commits:

  3b3fb74935ce ("fuse: invalidate dir dentry after chmod")
  5f69e628df75 ("fuse: fix killing s[ug]id in setattr")

from the fuse tree and commit:

  62490330769c ("fuse: Propagate dentry down to inode_change_ok()")

from the vfs-jk tree.

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
index f7c84ab835ca,b23502174682..000000000000
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@@ -1618,10 -1606,10 +1619,10 @@@ int fuse_do_setattr(struct dentry *dent
  	int err;
  	bool trust_local_cmtime = is_wb && S_ISREG(inode->i_mode);
  
 -	if (!(fc->flags & FUSE_DEFAULT_PERMISSIONS))
 +	if (!fc->default_permissions)
  		attr->ia_valid |= ATTR_FORCE;
  
- 	err = inode_change_ok(inode, attr);
+ 	err = setattr_prepare(dentry, attr);
  	if (err)
  		return err;
  
@@@ -1715,61 -1703,101 +1716,61 @@@ error
  static int fuse_setattr(struct dentry *entry, struct iattr *attr)
  {
  	struct inode *inode = d_inode(entry);
 -
 -	if (!fuse_allow_current_process(get_fuse_conn(inode)))
 -		return -EACCES;
 -
 -	if (attr->ia_valid & ATTR_FILE)
 -		return fuse_do_setattr(entry, attr, attr->ia_file);
 -	else
 -		return fuse_do_setattr(entry, attr, NULL);
 -}
 -
 -static int fuse_getattr(struct vfsmount *mnt, struct dentry *entry,
 -			struct kstat *stat)
 -{
 -	struct inode *inode = d_inode(entry);
  	struct fuse_conn *fc = get_fuse_conn(inode);
 +	struct file *file = (attr->ia_valid & ATTR_FILE) ? attr->ia_file : NULL;
 +	int ret;
  
 -	if (!fuse_allow_current_process(fc))
 +	if (!fuse_allow_current_process(get_fuse_conn(inode)))
  		return -EACCES;
  
 -	return fuse_update_attributes(inode, stat, NULL, NULL);
 -}
 -
 -static int fuse_setxattr(struct dentry *unused, struct inode *inode,
 -			 const char *name, const void *value,
 -			 size_t size, int flags)
 -{
 -	struct fuse_conn *fc = get_fuse_conn(inode);
 -	FUSE_ARGS(args);
 -	struct fuse_setxattr_in inarg;
 -	int err;
 -
 -	if (fc->no_setxattr)
 -		return -EOPNOTSUPP;
 +	if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
 +		attr->ia_valid &= ~(ATTR_KILL_SUID | ATTR_KILL_SGID |
 +				    ATTR_MODE);
  
 -	memset(&inarg, 0, sizeof(inarg));
 -	inarg.size = size;
 -	inarg.flags = flags;
 -	args.in.h.opcode = FUSE_SETXATTR;
 -	args.in.h.nodeid = get_node_id(inode);
 -	args.in.numargs = 3;
 -	args.in.args[0].size = sizeof(inarg);
 -	args.in.args[0].value = &inarg;
 -	args.in.args[1].size = strlen(name) + 1;
 -	args.in.args[1].value = name;
 -	args.in.args[2].size = size;
 -	args.in.args[2].value = value;
 -	err = fuse_simple_request(fc, &args);
 -	if (err == -ENOSYS) {
 -		fc->no_setxattr = 1;
 -		err = -EOPNOTSUPP;
 -	}
 -	if (!err) {
 -		fuse_invalidate_attr(inode);
 -		fuse_update_ctime(inode);
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
  	}
 -	return err;
 -}
 -
 -static ssize_t fuse_getxattr(struct dentry *entry, struct inode *inode,
 -			     const char *name, void *value, size_t size)
 -{
 -	struct fuse_conn *fc = get_fuse_conn(inode);
 -	FUSE_ARGS(args);
 -	struct fuse_getxattr_in inarg;
 -	struct fuse_getxattr_out outarg;
 -	ssize_t ret;
 +	if (!attr->ia_valid)
 +		return 0;
  
- 	ret = fuse_do_setattr(inode, attr, file);
 -	if (fc->no_getxattr)
 -		return -EOPNOTSUPP;
++	ret = fuse_do_setattr(entry, attr, file);
 +	if (!ret) {
 +		/*
 +		 * If filesystem supports acls it may have updated acl xattrs in
 +		 * the filesystem, so forget cached acls for the inode.
 +		 */
 +		if (fc->posix_acl)
 +			forget_all_cached_acls(inode);
  
 -	memset(&inarg, 0, sizeof(inarg));
 -	inarg.size = size;
 -	args.in.h.opcode = FUSE_GETXATTR;
 -	args.in.h.nodeid = get_node_id(inode);
 -	args.in.numargs = 2;
 -	args.in.args[0].size = sizeof(inarg);
 -	args.in.args[0].value = &inarg;
 -	args.in.args[1].size = strlen(name) + 1;
 -	args.in.args[1].value = name;
 -	/* This is really two different operations rolled into one */
 -	args.out.numargs = 1;
 -	if (size) {
 -		args.out.argvar = 1;
 -		args.out.args[0].size = size;
 -		args.out.args[0].value = value;
 -	} else {
 -		args.out.args[0].size = sizeof(outarg);
 -		args.out.args[0].value = &outarg;
 -	}
 -	ret = fuse_simple_request(fc, &args);
 -	if (!ret && !size)
 -		ret = outarg.size;
 -	if (ret == -ENOSYS) {
 -		fc->no_getxattr = 1;
 -		ret = -EOPNOTSUPP;
 +		/* Directory mode changed, may need to revalidate access */
 +		if (d_is_dir(entry) && (attr->ia_valid & ATTR_MODE))
 +			fuse_invalidate_entry_cache(entry);
  	}
  	return ret;
  }
