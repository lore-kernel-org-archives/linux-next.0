From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security-testing tree with the vfs
 tree
Date: Mon, 8 Feb 2010 15:18:11 +1100
Message-ID: <20100208151811.039ca1cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42395 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751713Ab0BHESO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Feb 2010 23:18:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, etsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Al Viro <viro@zeniv.linux.org.uk>

Hi James,

Today's linux-next merge of the security-testing tree got a conflict in
security/tomoyo/realpath.c between commit
b0057bfb31624e95f5ea2cdd8f57c19fbc934ee1 ("get rid of ->mnt_parent in
tomoyo/realpath") from the vfs tree and commit
67fa4880c5e059428392ca6f7c2f9c38e8546fea ("TOMOYO: Compare filesystem by
magic number rather than by name") from the security-testing tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc security/tomoyo/realpath.c
index 455bc39,92460c7..0000000
--- a/security/tomoyo/realpath.c
+++ b/security/tomoyo/realpath.c
@@@ -89,15 -90,30 +90,15 @@@ int tomoyo_realpath_from_path2(struct p
  		sp = dentry->d_op->d_dname(dentry, newname + offset,
  					   newname_len - offset);
  	} else {
 -		/* Taken from d_namespace_path(). */
 -		struct path root;
 -		struct path ns_root = { };
 -		struct path tmp;
 +		struct path ns_root = {.mnt = NULL, .dentry = NULL};
  
 -		read_lock(&current->fs->lock);
 -		root = current->fs->root;
 -		path_get(&root);
 -		read_unlock(&current->fs->lock);
 -		spin_lock(&vfsmount_lock);
 -		if (root.mnt && root.mnt->mnt_ns)
 -			ns_root.mnt = mntget(root.mnt->mnt_ns->root);
 -		if (ns_root.mnt)
 -			ns_root.dentry = dget(ns_root.mnt->mnt_root);
 -		spin_unlock(&vfsmount_lock);
  		spin_lock(&dcache_lock);
 -		tmp = ns_root;
 -		sp = __d_path(path, &tmp, newname, newname_len);
 +		/* go to whatever namespace root we are under */
 +		sp = __d_path(path, &ns_root, newname, newname_len);
  		spin_unlock(&dcache_lock);
 -		path_put(&root);
 -		path_put(&ns_root);
  		/* Prepend "/proc" prefix if using internal proc vfs mount. */
 -		if (!IS_ERR(sp) && (path->mnt->mnt_parent == path->mnt) &&
 +		if (!IS_ERR(sp) && (path->mnt->mnt_flags & MNT_INTERNAL) &&
- 		    (strcmp(path->mnt->mnt_sb->s_type->name, "proc") == 0)) {
+ 		    (path->mnt->mnt_sb->s_magic == PROC_SUPER_MAGIC)) {
  			sp -= 5;
  			if (sp >= newname)
  				memcpy(sp, "/proc", 5);
