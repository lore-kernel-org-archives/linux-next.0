From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Mon, 10 Jul 2017 14:41:36 +1000
Message-ID: <20170710144136.208402ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/hugetlbfs/inode.c

between commit:

  4a25220d4e43 ("hugetlbfs: Implement show_options")

from the vfs tree and commit:

  25153b1fbd8a ("mm: hwpoison: dissolve in-use hugepage in unrecoverable memory error")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/hugetlbfs/inode.c
index 99b3b9836575,52388611635e..000000000000
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@@ -851,46 -851,16 +851,56 @@@ static int hugetlbfs_migrate_page(struc
  	return MIGRATEPAGE_SUCCESS;
  }
  
 +/*
 + * Display the mount options in /proc/mounts.
 + */
 +static int hugetlbfs_show_options(struct seq_file *m, struct dentry *root)
 +{
 +	struct hugetlbfs_sb_info *sbinfo = HUGETLBFS_SB(root->d_sb);
 +	struct hugepage_subpool *spool = sbinfo->spool;
 +	unsigned long hpage_size = huge_page_size(sbinfo->hstate);
 +	unsigned hpage_shift = huge_page_shift(sbinfo->hstate);
 +	char mod;
 +
 +	if (!uid_eq(sbinfo->uid, GLOBAL_ROOT_UID))
 +		seq_printf(m, ",uid=%u",
 +			   from_kuid_munged(&init_user_ns, sbinfo->uid));
 +	if (!gid_eq(sbinfo->gid, GLOBAL_ROOT_GID))
 +		seq_printf(m, ",gid=%u",
 +			   from_kgid_munged(&init_user_ns, sbinfo->gid));
 +	if (sbinfo->mode != 0755)
 +		seq_printf(m, ",mode=%o", sbinfo->mode);
 +	if (sbinfo->max_inodes != -1)
 +		seq_printf(m, ",nr_inodes=%lu", sbinfo->max_inodes);
 +
 +	hpage_size /= 1024;
 +	mod = 'K';
 +	if (hpage_size >= 1024) {
 +		hpage_size /= 1024;
 +		mod = 'M';
 +	}
 +	seq_printf(m, ",pagesize=%lu%c", hpage_size, mod);
 +	if (spool) {
 +		if (spool->max_hpages != -1)
 +			seq_printf(m, ",size=%llu",
 +				   (unsigned long long)spool->max_hpages << hpage_shift);
 +		if (spool->min_hpages != -1)
 +			seq_printf(m, ",min_size=%llu",
 +				   (unsigned long long)spool->min_hpages << hpage_shift);
 +	}
 +	return 0;
 +}
 +
+ static int hugetlbfs_error_remove_page(struct address_space *mapping,
+ 				struct page *page)
+ {
+ 	struct inode *inode = mapping->host;
+ 
+ 	remove_huge_page(page);
+ 	hugetlb_fix_reserve_counts(inode);
+ 	return 0;
+ }
+ 
  static int hugetlbfs_statfs(struct dentry *dentry, struct kstatfs *buf)
  {
  	struct hugetlbfs_sb_info *sbinfo = HUGETLBFS_SB(dentry->d_sb);
