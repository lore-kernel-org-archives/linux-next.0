From: Amir Goldstein <amir73il@gmail.com>
Subject: linux-next: merge conflict between vfs for-next and overlayfs-next
Date: Fri, 26 Jan 2018 16:43:25 +0200
Message-ID: <CAOQ4uxhzWJxFBBaYDPS4DbyDvh9c5Ueg8vQr=Q3muM14YCyCGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f177.google.com ([209.85.161.177]:37846 "EHLO
        mail-yw0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752014AbeAZOn0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jan 2018 09:43:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Stephen, Al, Miklos,

I noticed that the vfs tree for-next branch is not yet in linux-next and
has a merge conflict with overlayfs-next branch, already in linux-next.

This is a trivial conflict due to the fact that commit f9c34674bc60 ("vfs:
factor out helpers d_instantiate_anon() and d_alloc_anon()") refactors
__d_obtain_alias() and changes the variable name from 'tmp' to 'dentry'.

Below is the patch to resolve the conflict when merging vfs for-next
onto overlayfs-next.
Probably best if Al picks up the re-factoring patch to his tree anyway.

Thanks,
Amir.

---

--- fs/dcache.c
+++ fs/dcache.c
@@ -1957,9 +1963,11 @@ static struct dentry
*__d_instantiate_anon(struct dentry *dentry,
  spin_lock(&dentry->d_lock);
  __d_set_inode_and_type(dentry, inode, add_flags);
  hlist_add_head(&dentry->d_u.d_alias, &inode->i_dentry);
- hlist_bl_lock(&dentry->d_sb->s_anon);
- hlist_bl_add_head(&dentry->d_hash, &dentry->d_sb->s_anon);
- hlist_bl_unlock(&dentry->d_sb->s_anon);
+ if (!disconnected) {
+ hlist_bl_lock(&dentry->d_sb->s_roots);
+ hlist_bl_add_head(&dentry->d_hash, &dentry->d_sb->s_roots);
+ hlist_bl_unlock(&dentry->d_sb->s_roots);
+ }
  spin_unlock(&dentry->d_lock);
  spin_unlock(&inode->i_lock);
