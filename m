From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the btrfs-kdave tree
Date: Thu, 9 Nov 2017 09:47:17 +1100
Message-ID: <20171109094717.011fe53a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752519AbdKHWrU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Nov 2017 17:47:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Tomohiro Misono <misono.tomohiro@jp.fujitsu.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/btrfs/super.c

between commit:

  c2a6acf1b800 ("btrfs: cleanup btrfs_mount() using mount_root()")

from the btrfs-kdave tree and commit:

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

diff --cc fs/btrfs/super.c
index 254e7422a69e,e56a93f3113e..000000000000
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@@ -1530,9 -1543,11 +1530,9 @@@ static struct dentry *mount_root(struc
  	struct btrfs_fs_info *fs_info = NULL;
  	struct security_mnt_opts new_sec_opts;
  	fmode_t mode = FMODE_READ;
 -	char *subvol_name = NULL;
 -	u64 subvol_objectid = 0;
  	int error = 0;
  
- 	if (!(flags & MS_RDONLY))
+ 	if (!(flags & SB_RDONLY))
  		mode |= FMODE_WRITE;
  
  	error = btrfs_parse_early_options(data, mode, fs_type,
@@@ -1624,84 -1647,6 +1624,84 @@@ error_sec_opts
  	return ERR_PTR(error);
  }
  
 +/*
 + * Mount function which is called by VFS layer.
 + *
 + * In order to allow mounting a subvolume directly, btrfs uses
 + * mount_subtree() which needs vfsmount* of device's root (/).
 + * This means device's root has to be mounted internally in any case.
 + *
 + * Operation flow:
 + *   1. Parse subvol id related options for later use in mount_subvol().
 + *
 + *   2. Mount device's root (/) by calling vfs_kern_mount().
 + *
 + *      NOTE: vfs_kern_mount() is used by VFS to call btrfs_mount() in the
 + *      first place. In order to avoid calling btrfs_mount() again, we use
 + *      different file_system_type which is not registered to VFS by
 + *      register_filesystem(). As a result, mount_root() is called.
 + *      The return value will be used by mount_subtree() in mount_subvol().
 + *
 + *   3. Call mount_subvol() to get the dentry of subvolume. Since there is
 + *      "btrfs subvolume set-default", mount_subvol() is called always.
 + */
 +static struct dentry *btrfs_mount(struct file_system_type *fs_type, int flags,
 +		const char *device_name, void *data)
 +{
 +	struct vfsmount *mnt_root;
 +	struct dentry *root;
 +	fmode_t mode = FMODE_READ;
 +	char *subvol_name = NULL;
 +	u64 subvol_objectid = 0;
 +	int error = 0;
 +
- 	if (!(flags & MS_RDONLY))
++	if (!(flags & SB_RDONLY))
 +		mode |= FMODE_WRITE;
 +
 +	error = btrfs_parse_subvol_options(data, mode, fs_type,
 +					  &subvol_name, &subvol_objectid);
 +	if (error) {
 +		kfree(subvol_name);
 +		return ERR_PTR(error);
 +	}
 +
 +	/* mount device's root (/) */
 +	mnt_root = vfs_kern_mount(&btrfs_root_fs_type, flags, device_name, data);
 +	if (PTR_ERR_OR_ZERO(mnt_root) == -EBUSY) {
- 		if (flags & MS_RDONLY) {
- 			mnt_root = vfs_kern_mount(&btrfs_root_fs_type, flags & ~MS_RDONLY,
++		if (flags & SB_RDONLY) {
++			mnt_root = vfs_kern_mount(&btrfs_root_fs_type, flags & ~SB_RDONLY,
 +					     device_name, data);
 +		} else {
- 			mnt_root = vfs_kern_mount(&btrfs_root_fs_type, flags | MS_RDONLY,
++			mnt_root = vfs_kern_mount(&btrfs_root_fs_type, flags | SB_RDONLY,
 +					     device_name, data);
 +			if (IS_ERR(mnt_root)) {
 +				root = ERR_CAST(mnt_root);
 +				goto out;
 +			}
 +
 +			down_write(&mnt_root->mnt_sb->s_umount);
 +			error = btrfs_remount(mnt_root->mnt_sb, &flags, NULL);
 +			up_write(&mnt_root->mnt_sb->s_umount);
 +			if (error < 0) {
 +				root = ERR_PTR(error);
 +				mntput(mnt_root);
 +				goto out;
 +			}
 +		}
 +	}
 +	if (IS_ERR(mnt_root)) {
 +		root = ERR_CAST(mnt_root);
 +		goto out;
 +	}
 +
 +	/* mount_subvol() will free subvol_name and mnt_root */
 +	root = mount_subvol(subvol_name, subvol_objectid, flags,
 +				    device_name, data, mnt_root);
 +
 +out:
 +	return root;
 +}
 +
  static void btrfs_resize_thread_pool(struct btrfs_fs_info *fs_info,
  				     int new_pool_size, int old_pool_size)
  {
