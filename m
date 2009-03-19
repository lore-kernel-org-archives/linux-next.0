From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: cpus4096 tree build failure
Date: Thu, 19 Mar 2009 22:03:22 +1100
Message-ID: <20090319220322.3baa4613.sfr@canb.auug.org.au>
References: <20090319215300.1833d28e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50679 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752928AbZCSLDZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 07:03:25 -0400
In-Reply-To: <20090319215300.1833d28e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, ppc-dev <linuxppc-dev@ozlabs.org>

Hi again,

On Thu, 19 Mar 2009 21:53:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> In file included from include/linux/mmzone.h:776,
>                  from include/linux/gfp.h:5,
>                  from include/linux/kmod.h:23,
>                  from include/linux/module.h:14,
>                  from init/version.c:11:
> arch/powerpc/include/asm/mmzone.h:32: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'numa_cpumask_lookup_table'
> 
> and many more.
> 
> Probably caused by commit 082edb7bf443eb8eda15b482d16ad9dd8137ad24 ("numa,
> cpumask: move numa_node_id default implementation to topology.h") from
> the cpus4096 tree which removed the include of linux/topology.h from
> linux/mmzone.h.

Same for sparc64 defconfig.

In file included from include/linux/mmzone.h:776,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:13,
                 from include/linux/percpu.h:6,
                 from include/linux/rcupdate.h:41,
                 from include/linux/rculist.h:11,
                 from include/linux/dcache.h:7,
                 from include/linux/fs.h:299,
                 from init/initramfs.c:3:
arch/sparc/include/asm/mmzone.h:13: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'numa_cpumask_lookup_table'

I have modified the patch as below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 Mar 2009 21:35:24 +1100
Subject: [PATCH] powerpc/sparc: mmzone.h needs cpumask_t to be defined

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/mmzone.h |    1 +
 arch/sparc/include/asm/mmzone.h   |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
index 19f299b..35acac9 100644
--- a/arch/powerpc/include/asm/mmzone.h
+++ b/arch/powerpc/include/asm/mmzone.h
@@ -8,6 +8,7 @@
 #define _ASM_MMZONE_H_
 #ifdef __KERNEL__
 
+#include <linux/cpumask.h>
 
 /*
  * generic non-linear memory support:
diff --git a/arch/sparc/include/asm/mmzone.h b/arch/sparc/include/asm/mmzone.h
index ebf5986..e8c6487 100644
--- a/arch/sparc/include/asm/mmzone.h
+++ b/arch/sparc/include/asm/mmzone.h
@@ -3,6 +3,8 @@
 
 #ifdef CONFIG_NEED_MULTIPLE_NODES
 
+#include <linux/cpumask.h>
+
 extern struct pglist_data *node_data[];
 
 #define NODE_DATA(nid)		(node_data[nid])
-- 
1.6.2.1
