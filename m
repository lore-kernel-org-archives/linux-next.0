From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Mon, 25 Jul 2016 10:21:28 +1000
Message-ID: <20160725102128.57c0bb9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59939 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751862AbcGYAVc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Jul 2016 20:21:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chao Yu <yuchao0@huawei.com>

Hi Al,

Today's linux-next merge of the vfs tree got conflicts in:

  fs/f2fs/dir.c
  fs/f2fs/f2fs.h

between commit:

  91246c21b859 ("f2fs: fix to report error number of f2fs_find_entry")

from the f2fs tree and commit:

  14bffd7c398a ("qstr: constify instances in f2fs")

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

diff --cc fs/f2fs/dir.c
index a485f68a76b1,3b095a35aa47..000000000000
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@@ -267,13 -259,25 +267,13 @@@ out
  
  struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct page **p)
  {
 -	struct page *page;
 -	struct f2fs_dir_entry *de;
 -	struct f2fs_dentry_block *dentry_blk;
 -
 -	if (f2fs_has_inline_dentry(dir))
 -		return f2fs_parent_inline_dir(dir, p);
 -
 -	page = get_lock_data_page(dir, 0, false);
 -	if (IS_ERR(page))
 -		return NULL;
 +	struct qstr dotdot = QSTR_INIT("..", 2);
  
 -	dentry_blk = kmap(page);
 -	de = &dentry_blk->dentry[1];
 -	*p = page;
 -	unlock_page(page);
 -	return de;
 +	return f2fs_find_entry(dir, &dotdot, p);
  }
  
- ino_t f2fs_inode_by_name(struct inode *dir, struct qstr *qstr,
 -ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr)
++ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr,
 +							struct page **page)
  {
  	ino_t res = 0;
  	struct f2fs_dir_entry *de;
diff --cc fs/f2fs/f2fs.h
index 30981094dff8,fd0a156d7561..000000000000
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@@ -1912,11 -1804,11 +1912,11 @@@ struct page *init_inode_metadata(struc
  			const struct qstr *, struct page *);
  void update_parent_metadata(struct inode *, struct inode *, unsigned int);
  int room_for_filename(const void *, int, int);
 -void f2fs_drop_nlink(struct inode *, struct inode *, struct page *);
 +void f2fs_drop_nlink(struct inode *, struct inode *);
- struct f2fs_dir_entry *f2fs_find_entry(struct inode *, struct qstr *,
+ struct f2fs_dir_entry *f2fs_find_entry(struct inode *, const struct qstr *,
  							struct page **);
  struct f2fs_dir_entry *f2fs_parent_dir(struct inode *, struct page **);
- ino_t f2fs_inode_by_name(struct inode *, struct qstr *, struct page **);
 -ino_t f2fs_inode_by_name(struct inode *, const struct qstr *);
++ino_t f2fs_inode_by_name(struct inode *, const struct qstr *, struct page **);
  void f2fs_set_link(struct inode *, struct f2fs_dir_entry *,
  				struct page *, struct inode *);
  int update_dent_inode(struct inode *, struct inode *, const struct qstr *);
