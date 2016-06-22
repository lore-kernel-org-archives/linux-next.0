From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Wed, 22 Jun 2016 14:58:16 +1000
Message-ID: <20160622145816.6451b896@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42848 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750748AbcFVFAe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jun 2016 01:00:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>, Vladimir Davydov <vdavydov@virtuozzo.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/page_alloc.c

between commit:

  0df42965deb7 ("latent_entropy: Add the extra_latent_entropy kernel parameter")

from the kspp tree and commit:

  6f4f5445297d ("mm: charge/uncharge kmemcg from generic page allocator paths")

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

diff --cc mm/page_alloc.c
index 02c7a0e6e66a,180f5afc5a1f..000000000000
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@@ -63,7 -63,7 +63,8 @@@
  #include <linux/sched/rt.h>
  #include <linux/page_owner.h>
  #include <linux/kthread.h>
 +#include <linux/random.h>
+ #include <linux/memcontrol.h>
  
  #include <asm/sections.h>
  #include <asm/tlbflush.h>
