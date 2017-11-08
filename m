From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext3 tree
Date: Thu, 9 Nov 2017 09:55:29 +1100
Message-ID: <20171109095529.18207bb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ext2/super.c

between commits:

  088519572ca8 ("ext2: Parse mount options into a dedicated structure")
  8af634ff9e5c ("ext2: Fix possible sleep in atomic during mount option parsing")

from the ext3 tree and commit:

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

diff --cc fs/ext2/super.c
index e2b6be03e69b,620dc029ca32..000000000000
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@@ -906,27 -905,23 +906,27 @@@ static int ext2_fill_super(struct super
  #endif
  	
  	if (le16_to_cpu(sbi->s_es->s_errors) == EXT2_ERRORS_PANIC)
 -		set_opt(sbi->s_mount_opt, ERRORS_PANIC);
 +		set_opt(opts.s_mount_opt, ERRORS_PANIC);
  	else if (le16_to_cpu(sbi->s_es->s_errors) == EXT2_ERRORS_CONTINUE)
 -		set_opt(sbi->s_mount_opt, ERRORS_CONT);
 +		set_opt(opts.s_mount_opt, ERRORS_CONT);
  	else
 -		set_opt(sbi->s_mount_opt, ERRORS_RO);
 +		set_opt(opts.s_mount_opt, ERRORS_RO);
  
 -	sbi->s_resuid = make_kuid(&init_user_ns, le16_to_cpu(es->s_def_resuid));
 -	sbi->s_resgid = make_kgid(&init_user_ns, le16_to_cpu(es->s_def_resgid));
 +	opts.s_resuid = make_kuid(&init_user_ns, le16_to_cpu(es->s_def_resuid));
 +	opts.s_resgid = make_kgid(&init_user_ns, le16_to_cpu(es->s_def_resgid));
  	
 -	set_opt(sbi->s_mount_opt, RESERVATION);
 +	set_opt(opts.s_mount_opt, RESERVATION);
  
 -	if (!parse_options((char *) data, sb))
 +	if (!parse_options((char *) data, sb, &opts))
  		goto failed_mount;
  
 +	sbi->s_mount_opt = opts.s_mount_opt;
 +	sbi->s_resuid = opts.s_resuid;
 +	sbi->s_resgid = opts.s_resgid;
 +
- 	sb->s_flags = (sb->s_flags & ~MS_POSIXACL) |
+ 	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
  		((EXT2_SB(sb)->s_mount_opt & EXT2_MOUNT_POSIX_ACL) ?
- 		 MS_POSIXACL : 0);
+ 		 SB_POSIXACL : 0);
  	sb->s_iflags |= SB_I_CGROUPWB;
  
  	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV &&
@@@ -1331,22 -1328,30 +1331,22 @@@ static int ext2_remount (struct super_b
  	/*
  	 * Allow the "check" option to be passed as a remount option.
  	 */
 -	if (!parse_options(data, sb)) {
 -		err = -EINVAL;
 -		goto restore_opts;
 -	}
 -
 -	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
 -		((sbi->s_mount_opt & EXT2_MOUNT_POSIX_ACL) ? SB_POSIXACL : 0);
 +	if (!parse_options(data, sb, &new_opts))
 +		return -EINVAL;
  
 +	spin_lock(&sbi->s_lock);
  	es = sbi->s_es;
 -	if ((sbi->s_mount_opt ^ old_opts.s_mount_opt) & EXT2_MOUNT_DAX) {
 +	if ((sbi->s_mount_opt ^ new_opts.s_mount_opt) & EXT2_MOUNT_DAX) {
  		ext2_msg(sb, KERN_WARNING, "warning: refusing change of "
  			 "dax flag with busy inodes while remounting");
 -		sbi->s_mount_opt ^= EXT2_MOUNT_DAX;
 -	}
 -	if ((bool)(*flags & SB_RDONLY) == sb_rdonly(sb)) {
 -		spin_unlock(&sbi->s_lock);
 -		return 0;
 +		new_opts.s_mount_opt ^= EXT2_MOUNT_DAX;
  	}
- 	if ((bool)(*flags & MS_RDONLY) == sb_rdonly(sb))
++	if ((bool)(*flags & SB_RDONLY) == sb_rdonly(sb))
 +		goto out_set;
- 	if (*flags & MS_RDONLY) {
+ 	if (*flags & SB_RDONLY) {
  		if (le16_to_cpu(es->s_state) & EXT2_VALID_FS ||
 -		    !(sbi->s_mount_state & EXT2_VALID_FS)) {
 -			spin_unlock(&sbi->s_lock);
 -			return 0;
 -		}
 +		    !(sbi->s_mount_state & EXT2_VALID_FS))
 +			goto out_set;
  
  		/*
  		 * OK, we are remounting a valid rw partition rdonly, so set
@@@ -1387,16 -1394,14 +1387,16 @@@
  		dquot_resume(sb, -1);
  	}
  
 -	return 0;
 -restore_opts:
 -	sbi->s_mount_opt = old_opts.s_mount_opt;
 -	sbi->s_resuid = old_opts.s_resuid;
 -	sbi->s_resgid = old_opts.s_resgid;
 -	sb->s_flags = old_sb_flags;
 +	spin_lock(&sbi->s_lock);
 +out_set:
 +	sbi->s_mount_opt = new_opts.s_mount_opt;
 +	sbi->s_resuid = new_opts.s_resuid;
 +	sbi->s_resgid = new_opts.s_resgid;
- 	sb->s_flags = (sb->s_flags & ~MS_POSIXACL) |
- 		((sbi->s_mount_opt & EXT2_MOUNT_POSIX_ACL) ? MS_POSIXACL : 0);
++	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
++		((sbi->s_mount_opt & EXT2_MOUNT_POSIX_ACL) ? SB_POSIXACL : 0);
  	spin_unlock(&sbi->s_lock);
 -	return err;
 +
 +	return 0;
  }
  
  static int ext2_statfs (struct dentry * dentry, struct kstatfs * buf)
