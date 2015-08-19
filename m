From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the cgroup
 tree
Date: Wed, 19 Aug 2015 18:43:55 +1000
Message-ID: <20150819184355.0cb8cbce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56692 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752144AbbHSIn5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Aug 2015 04:43:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/cgroup.c

between commit:

  d98817d4961b ("cgroup: don't print subsystems for the default hierarchy")
  3e1d2eed39d8 ("cgroup: introduce cgroup_subsys->legacy_name")

from the cgroup tree and commit:

  04b6d1bfdd24 ("fs: create and use seq_show_option for escaping")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/cgroup.c
index f3f5cd5e2c0d,c6c4240e7d28..000000000000
--- a/kernel/cgroup.c
+++ b/kernel/cgroup.c
@@@ -1339,10 -1332,9 +1339,10 @@@ static int cgroup_show_options(struct s
  	struct cgroup_subsys *ss;
  	int ssid;
  
 -	for_each_subsys(ss, ssid)
 -		if (root->subsys_mask & (1 << ssid))
 -			seq_show_option(seq, ss->name, NULL);
 +	if (root != &cgrp_dfl_root)
 +		for_each_subsys(ss, ssid)
 +			if (root->subsys_mask & (1 << ssid))
- 				seq_printf(seq, ",%s", ss->legacy_name);
++				seq_show_option(seq, ss->legacy_name, NULL);
  	if (root->flags & CGRP_ROOT_NOPREFIX)
  		seq_puts(seq, ",noprefix");
  	if (root->flags & CGRP_ROOT_XATTR)
