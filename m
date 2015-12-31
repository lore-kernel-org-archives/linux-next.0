From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the jc_docs
 tree
Date: Thu, 31 Dec 2015 21:43:07 +1100
Message-ID: <20151231214307.53f62bd2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59140 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753516AbbLaKnI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 05:43:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Elliott <elliott@hpe.com>, Taku Izumi <izumi.taku@jp.fujitsu.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Documentation/kernel-parameters.txt

between commit:

  9daacf51b428 ("Documentation/kernel-parameters: update KMG units")

from the jc_docs tree and commit:

  f0a906868be1 ("mm/page_alloc.c: introduce kernelcore=mirror option")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/kernel-parameters.txt
index adf540032a9d,2cfb638d138b..000000000000
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@@ -1710,7 -1696,8 +1714,8 @@@ Such letter suffixes can also be entire
  
  	keepinitrd	[HW,ARM]
  
- 	kernelcore=nn[KMGTPE]	[KNL,X86,IA-64,PPC] This parameter
 -	kernelcore=	Format: nn[KMG] | "mirror"
++	kernelcore=	Format: nn[KMGTPE] | "mirror"
+ 			[KNL,X86,IA-64,PPC] This parameter
  			specifies the amount of memory usable by the kernel
  			for non-movable allocations.  The requested amount is
  			spread evenly throughout all nodes in the system. The
