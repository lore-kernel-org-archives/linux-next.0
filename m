From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with Linus' tree
Date: Fri, 8 Jul 2016 16:13:13 +1000
Message-ID: <20160708161313.796f341a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42062 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751442AbcGHGNQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jul 2016 02:13:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>, "J. Bruce Fields" <bfields@redhat.com>

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  fs/posix_acl.c

between commit:

  485e71e8fb63 ("posix_acl: Add set_posix_acl")

from Linus' tree and commit:

  0d4d717f2583 ("vfs: Verify acls are valid within superblock's s_user_ns.")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/posix_acl.c
index edc452c2a563,647c28180675..000000000000
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@@ -833,24 -839,6 +833,24 @@@ set_posix_acl(struct inode *inode, int 
  	if (!inode_owner_or_capable(inode))
  		return -EPERM;
  
 +	if (acl) {
- 		int ret = posix_acl_valid(acl);
++		int ret = posix_acl_valid(inode->i_sb->s_user_ns, acl);
 +		if (ret)
 +			return ret;
 +	}
 +	return inode->i_op->set_acl(inode, acl, type);
 +}
 +EXPORT_SYMBOL(set_posix_acl);
 +
 +static int
 +posix_acl_xattr_set(const struct xattr_handler *handler,
 +		    struct dentry *unused, struct inode *inode,
 +		    const char *name, const void *value,
 +		    size_t size, int flags)
 +{
 +	struct posix_acl *acl = NULL;
 +	int ret;
 +
  	if (value) {
  		acl = posix_acl_from_xattr(&init_user_ns, value, size);
  		if (IS_ERR(acl))
