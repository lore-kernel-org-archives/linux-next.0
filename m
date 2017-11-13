From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 13 Nov 2017 16:42:06 +1100
Message-ID: <20171113164206.187a790d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43697 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751597AbdKMFmI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:42:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/linux/mmzone.h:17:0,
                 from include/linux/mempolicy.h:10,
                 from mm/mempolicy.c:70:
mm/mempolicy.c: In function 'mpol_to_str':
include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
 #define nodemask_pr_args(maskp) (maskp) ? MAX_NUMNODES : 0, (maskp) ? (maskp)->bits : NULL
                                         ^
mm/mempolicy.c:2817:11: note: in expansion of macro 'nodemask_pr_args'
           nodemask_pr_args(&nodes));
           ^
include/linux/nodemask.h:107:69: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
 #define nodemask_pr_args(maskp) (maskp) ? MAX_NUMNODES : 0, (maskp) ? (maskp)->bits : NULL
                                                                     ^
mm/mempolicy.c:2817:11: note: in expansion of macro 'nodemask_pr_args'
           nodemask_pr_args(&nodes));
           ^

Introduced by commit

  b2c1ed23bdc1 ("mm: simplify nodemask printing")

-- 
Cheers,
Stephen Rothwell
