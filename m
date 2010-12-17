From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs-scale tree with the hfsplus
 tree
Date: Fri, 17 Dec 2010 11:24:52 +1100
Message-ID: <20101217112452.956ed361.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Piggin <npiggin@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Salikhmetov <alexo@tuxera.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Nick,

Today's linux-next merge of the vfs-scale tree got a conflict in
fs/hfsplus/hfsplus_fs.h fs/hfsplus/unicode.c between commit
2753cc281c9a0e8a0a45ee2b8110866a9fe63bdd ("hfsplus: over 80 character
lines clean-up") from the hfsplus tree and commits
aafad38382117d0e22b5ae36bc34337fdf20ed74 ("fs: change d_compare for
rcu-walk") and ab7e0cff7d85fd19a0c0740833f947533b851145 ("fs: change
d_hash for rcu-walk") from the vfs-scale tree.

I fixed it up (see below - I used the vfs-scale tree version of the
prototypes in unicode.c) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/hfsplus/hfsplus_fs.h
index f7cbdf8,a5308f4..0000000
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@@ -418,17 -375,16 +418,20 @@@ extern u16 hfsplus_decompose_table[]
  extern u16 hfsplus_compose_table[];
  
  /* unicode.c */
 -int hfsplus_strcasecmp(const struct hfsplus_unistr *, const struct hfsplus_unistr *);
 -int hfsplus_strcmp(const struct hfsplus_unistr *, const struct hfsplus_unistr *);
 -int hfsplus_uni2asc(struct super_block *, const struct hfsplus_unistr *, char *, int *);
 -int hfsplus_asc2uni(struct super_block *, struct hfsplus_unistr *, const char *, int);
 +int hfsplus_strcasecmp(const struct hfsplus_unistr *,
 +		const struct hfsplus_unistr *);
 +int hfsplus_strcmp(const struct hfsplus_unistr *,
 +		const struct hfsplus_unistr *);
 +int hfsplus_uni2asc(struct super_block *,
 +		const struct hfsplus_unistr *, char *, int *);
 +int hfsplus_asc2uni(struct super_block *,
 +		struct hfsplus_unistr *, const char *, int);
- int hfsplus_hash_dentry(struct dentry *dentry, struct qstr *str);
- int hfsplus_compare_dentry(struct dentry *dentry,
- 		struct qstr *s1, struct qstr *s2);
+ int hfsplus_hash_dentry(const struct dentry *dentry, const struct inode *inode,
+ 		struct qstr *str);
+ int hfsplus_compare_dentry(const struct dentry *parent,
+ 		const struct inode *pinode,
+ 		const struct dentry *dentry, const struct inode *inode,
+ 		unsigned int len, const char *str, const struct qstr *name);
  
  /* wrapper.c */
  int hfsplus_read_wrapper(struct super_block *);
