From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the net-next tree
Date: Fri, 23 Sep 2016 14:51:42 +1000
Message-ID: <20160923145142.61024775@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50752 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752652AbcIWEvp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Sep 2016 00:51:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  include/linux/sysctl.h

between commit:

  e79c6a4fc923 ("net: make net namespace sysctls belong to container's owner")

from the net-next tree and commit:

  13bcc6a28534 ("sysctl: Stop implicitly passing current into sysctl_table_root.lookup")

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

diff --cc include/linux/sysctl.h
index ecc3e07c6e63,f166ca0203e2..000000000000
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@@ -158,11 -155,7 +158,10 @@@ struct ctl_table_set 
  
  struct ctl_table_root {
  	struct ctl_table_set default_set;
- 	struct ctl_table_set *(*lookup)(struct ctl_table_root *root,
- 					   struct nsproxy *namespaces);
+ 	struct ctl_table_set *(*lookup)(struct ctl_table_root *root);
 +	void (*set_ownership)(struct ctl_table_header *head,
 +			      struct ctl_table *table,
 +			      kuid_t *uid, kgid_t *gid);
  	int (*permissions)(struct ctl_table_header *head, struct ctl_table *table);
  };
  
