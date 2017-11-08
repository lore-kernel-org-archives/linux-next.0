From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Thu, 9 Nov 2017 10:18:01 +1100
Message-ID: <20171109101801.083cda82@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752534AbdKHXSD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Nov 2017 18:18:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/overlayfs/super.c

between commits:

  7c84d842e11e ("ovl: reduce the number of arguments for ovl_workdir_create()")
  17d554474412 ("ovl: rename ufs to ofs")

from the overlayfs tree and commit:

  c2c6773f9942 ("VFS: Roll out mount flag differentiation (MS_* -> SB_*) generally")

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
index fd11c0510906,458ba465191a..000000000000
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@@ -324,9 -308,9 +324,9 @@@ static int ovl_show_options(struct seq_
  
  static int ovl_remount(struct super_block *sb, int *flags, char *data)
  {
 -	struct ovl_fs *ufs = sb->s_fs_info;
 +	struct ovl_fs *ofs = sb->s_fs_info;
  
- 	if (!(*flags & MS_RDONLY) && ovl_force_readonly(ofs))
 -	if (!(*flags & SB_RDONLY) && ovl_force_readonly(ufs))
++	if (!(*flags & SB_RDONLY) && ovl_force_readonly(ofs))
  		return -EROFS;
  
  	return 0;
@@@ -1107,117 -954,152 +1107,117 @@@ static struct ovl_entry *ovl_get_lowers
  	sb->s_stack_depth++;
  	if (sb->s_stack_depth > FILESYSTEM_MAX_STACK_DEPTH) {
  		pr_err("overlayfs: maximum fs stacking depth exceeded\n");
 -		goto out_put_lowerpath;
 +		goto out_err;
  	}
  
 -	if (ufs->config.upperdir) {
 -		ufs->upper_mnt = clone_private_mount(&upperpath);
 -		err = PTR_ERR(ufs->upper_mnt);
 -		if (IS_ERR(ufs->upper_mnt)) {
 -			pr_err("overlayfs: failed to clone upperpath\n");
 -			goto out_put_lowerpath;
 -		}
 +	err = ovl_get_lower_layers(ofs, stack, numlower);
 +	if (err)
 +		goto out_err;
  
 -		/* Don't inherit atime flags */
 -		ufs->upper_mnt->mnt_flags &= ~(MNT_NOATIME | MNT_NODIRATIME | MNT_RELATIME);
 +	err = -ENOMEM;
 +	oe = ovl_alloc_entry(numlower);
 +	if (!oe)
 +		goto out_err;
  
 -		sb->s_time_gran = ufs->upper_mnt->mnt_sb->s_time_gran;
 +	for (i = 0; i < numlower; i++) {
 +		oe->lowerstack[i].dentry = dget(stack[i].dentry);
 +		oe->lowerstack[i].layer = &ofs->lower_layers[i];
 +	}
  
 -		ufs->workdir = ovl_workdir_create(sb, ufs, workpath.dentry,
 -						  OVL_WORKDIR_NAME, false);
 -		/*
 -		 * Upper should support d_type, else whiteouts are visible.
 -		 * Given workdir and upper are on same fs, we can do
 -		 * iterate_dir() on workdir. This check requires successful
 -		 * creation of workdir in previous step.
 -		 */
 -		if (ufs->workdir) {
 -			struct dentry *temp;
 -
 -			err = ovl_check_d_type_supported(&workpath);
 -			if (err < 0)
 -				goto out_put_workdir;
 -
 -			/*
 -			 * We allowed this configuration and don't want to
 -			 * break users over kernel upgrade. So warn instead
 -			 * of erroring out.
 -			 */
 -			if (!err)
 -				pr_warn("overlayfs: upper fs needs to support d_type.\n");
 -
 -			/* Check if upper/work fs supports O_TMPFILE */
 -			temp = ovl_do_tmpfile(ufs->workdir, S_IFREG | 0);
 -			ufs->tmpfile = !IS_ERR(temp);
 -			if (ufs->tmpfile)
 -				dput(temp);
 -			else
 -				pr_warn("overlayfs: upper fs does not support tmpfile.\n");
 -
 -			/*
 -			 * Check if upper/work fs supports trusted.overlay.*
 -			 * xattr
 -			 */
 -			err = ovl_do_setxattr(ufs->workdir, OVL_XATTR_OPAQUE,
 -					      "0", 1, 0);
 -			if (err) {
 -				ufs->noxattr = true;
 -				pr_warn("overlayfs: upper fs does not support xattr.\n");
 -			} else {
 -				vfs_removexattr(ufs->workdir, OVL_XATTR_OPAQUE);
 -			}
 +	if (remote)
 +		sb->s_d_op = &ovl_reval_dentry_operations;
 +	else
 +		sb->s_d_op = &ovl_dentry_operations;
  
 -			/* Check if upper/work fs supports file handles */
 -			if (ufs->config.index &&
 -			    !ovl_can_decode_fh(ufs->workdir->d_sb)) {
 -				ufs->config.index = false;
 -				pr_warn("overlayfs: upper fs does not support file handles, falling back to index=off.\n");
 -			}
 -		}
 -	}
 +out:
 +	for (i = 0; i < numlower; i++)
 +		path_put(&stack[i]);
 +	kfree(stack);
 +	kfree(lowertmp);
 +
 +	return oe;
 +
 +out_err:
 +	oe = ERR_PTR(err);
 +	goto out;
 +}
 +
 +static int ovl_fill_super(struct super_block *sb, void *data, int silent)
 +{
 +	struct path upperpath = { };
 +	struct dentry *root_dentry;
 +	struct ovl_entry *oe = NULL;
 +	struct ovl_fs *ofs;
 +	struct cred *cred;
 +	int err;
  
  	err = -ENOMEM;
 -	ufs->lower_mnt = kcalloc(numlower, sizeof(struct vfsmount *), GFP_KERNEL);
 -	if (ufs->lower_mnt == NULL)
 -		goto out_put_workdir;
 -	for (i = 0; i < numlower; i++) {
 -		struct vfsmount *mnt = clone_private_mount(&stack[i]);
 +	ofs = kzalloc(sizeof(struct ovl_fs), GFP_KERNEL);
 +	if (!ofs)
 +		goto out_err;
  
 -		err = PTR_ERR(mnt);
 -		if (IS_ERR(mnt)) {
 -			pr_err("overlayfs: failed to clone lowerpath\n");
 -			goto out_put_lower_mnt;
 -		}
 -		/*
 -		 * Make lower_mnt R/O.  That way fchmod/fchown on lower file
 -		 * will fail instead of modifying lower fs.
 -		 */
 -		mnt->mnt_flags |= MNT_READONLY | MNT_NOATIME;
 +	ofs->creator_cred = cred = prepare_creds();
 +	if (!cred)
 +		goto out_err;
  
 -		ufs->lower_mnt[ufs->numlower] = mnt;
 -		ufs->numlower++;
 +	ofs->config.redirect_dir = ovl_redirect_dir_def;
 +	ofs->config.index = ovl_index_def;
 +	err = ovl_parse_opt((char *) data, &ofs->config);
 +	if (err)
 +		goto out_err;
  
 -		/* Check if all lower layers are on same sb */
 -		if (i == 0)
 -			ufs->same_sb = mnt->mnt_sb;
 -		else if (ufs->same_sb != mnt->mnt_sb)
 -			ufs->same_sb = NULL;
 +	err = -EINVAL;
 +	if (!ofs->config.lowerdir) {
 +		if (!silent)
 +			pr_err("overlayfs: missing 'lowerdir'\n");
 +		goto out_err;
  	}
  
 -	/* If the upper fs is nonexistent, we mark overlayfs r/o too */
 -	if (!ufs->upper_mnt)
 -		sb->s_flags |= SB_RDONLY;
 -	else if (ufs->upper_mnt->mnt_sb != ufs->same_sb)
 -		ufs->same_sb = NULL;
 -
 -	if (!(ovl_force_readonly(ufs)) && ufs->config.index) {
 -		/* Verify lower root is upper root origin */
 -		err = ovl_verify_origin(upperpath.dentry, ufs->lower_mnt[0],
 -					stack[0].dentry, false, true);
 -		if (err) {
 -			pr_err("overlayfs: failed to verify upper root origin\n");
 -			goto out_put_lower_mnt;
 +	sb->s_stack_depth = 0;
 +	sb->s_maxbytes = MAX_LFS_FILESIZE;
 +	if (ofs->config.upperdir) {
 +		if (!ofs->config.workdir) {
 +			pr_err("overlayfs: missing 'workdir'\n");
 +			goto out_err;
  		}
  
 -		ufs->indexdir = ovl_workdir_create(sb, ufs, workpath.dentry,
 -						   OVL_INDEXDIR_NAME, true);
 -		if (ufs->indexdir) {
 -			/* Verify upper root is index dir origin */
 -			err = ovl_verify_origin(ufs->indexdir, ufs->upper_mnt,
 -						upperpath.dentry, true, true);
 -			if (err)
 -				pr_err("overlayfs: failed to verify index dir origin\n");
 +		err = ovl_get_upper(ofs, &upperpath);
 +		if (err)
 +			goto out_err;
  
 -			/* Cleanup bad/stale/orphan index entries */
 -			if (!err)
 -				err = ovl_indexdir_cleanup(ufs->indexdir,
 -							   ufs->upper_mnt,
 -							   stack, numlower);
 -		}
 -		if (err || !ufs->indexdir)
 -			pr_warn("overlayfs: try deleting index dir or mounting with '-o index=off' to disable inodes index.\n");
 +		err = ovl_get_workdir(ofs, &upperpath);
  		if (err)
 -			goto out_put_indexdir;
 +			goto out_err;
 +
 +		if (!ofs->workdir)
- 			sb->s_flags |= MS_RDONLY;
++			sb->s_flags |= SB_RDONLY;
 +
 +		sb->s_stack_depth = ofs->upper_mnt->mnt_sb->s_stack_depth;
 +		sb->s_time_gran = ofs->upper_mnt->mnt_sb->s_time_gran;
 +
  	}
 +	oe = ovl_get_lowerstack(sb, ofs);
 +	if (err)
 +		goto out_err;
  
 -	/* Show index=off/on in /proc/mounts for any of the reasons above */
 -	if (!ufs->indexdir)
 -		ufs->config.index = false;
 +	/* If the upper fs is nonexistent, we mark overlayfs r/o too */
 +	if (!ofs->upper_mnt)
- 		sb->s_flags |= MS_RDONLY;
++		sb->s_flags |= SB_RDONLY;
 +	else if (ofs->upper_mnt->mnt_sb != ofs->same_sb)
 +		ofs->same_sb = NULL;
  
 -	if (remote)
 -		sb->s_d_op = &ovl_reval_dentry_operations;
 -	else
 -		sb->s_d_op = &ovl_dentry_operations;
 +	if (!(ovl_force_readonly(ofs)) && ofs->config.index) {
 +		err = ovl_get_indexdir(ofs, oe, &upperpath);
 +		if (err)
 +			goto out_err;
  
 -	err = -ENOMEM;
 -	ufs->creator_cred = cred = prepare_creds();
 -	if (!cred)
 -		goto out_put_indexdir;
 +		if (!ofs->indexdir)
- 			sb->s_flags |= MS_RDONLY;
++			sb->s_flags |= SB_RDONLY;
 +	}
 +
 +	/* Show index=off/on in /proc/mounts for any of the reasons above */
 +	if (!ofs->indexdir)
 +		ofs->config.index = false;
  
  	/* Never override disk quota limits or use reserved space */
  	cap_lower(cred->cap_effective, CAP_SYS_RESOURCE);
@@@ -1225,8 -1107,13 +1225,8 @@@
  	sb->s_magic = OVERLAYFS_SUPER_MAGIC;
  	sb->s_op = &ovl_super_operations;
  	sb->s_xattr = ovl_xattr_handlers;
 -	sb->s_fs_info = ufs;
 +	sb->s_fs_info = ofs;
- 	sb->s_flags |= MS_POSIXACL | MS_NOREMOTELOCK;
+ 	sb->s_flags |= SB_POSIXACL | SB_NOREMOTELOCK;
  
  	root_dentry = d_make_root(ovl_new_inode(sb, S_IFDIR, 0));
  	if (!root_dentry)
