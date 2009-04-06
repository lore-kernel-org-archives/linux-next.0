From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] percpu: __percpu_depopulate_mask can take a const mask
Date: Mon, 6 Apr 2009 15:08:29 +1000
Message-ID: <20090406150829.4cc5c024.sfr@canb.auug.org.au>
References: <20090331162234.1780e0a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49826 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750787AbZDFFIf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2009 01:08:35 -0400
In-Reply-To: <20090331162234.1780e0a4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

This eliminates a compiler warning:

mm/allocpercpu.c: In function 'free_percpu':
mm/allocpercpu.c:146: warning: passing argument 2 of '__percpu_depopulate_mask' discards qualifiers from pointer target type

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/allocpercpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

On Tue, 31 Mar 2009 16:22:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> mm/allocpercpu.c: In function 'free_percpu':
> mm/allocpercpu.c:146: warning: passing argument 2 of '__percpu_depopulate_mask' discards qualifiers from pointer target type
> 
> Caused by commit c36dd4785de7e87979e0c27aa53dff116ddf37c5
> ("cpumask:core-use-new-functions").
> 
> The "cpumask_t *" argument to __percpu_depopulate_mask() could be marked
> "const".

The above commit is now in mainline.

diff --git a/mm/allocpercpu.c b/mm/allocpercpu.c
index 139d5b7..dfdee6a 100644
--- a/mm/allocpercpu.c
+++ b/mm/allocpercpu.c
@@ -31,7 +31,7 @@ static void percpu_depopulate(void *__pdata, int cpu)
  * @__pdata: per-cpu data to depopulate
  * @mask: depopulate per-cpu data for cpu's selected through mask bits
  */
-static void __percpu_depopulate_mask(void *__pdata, cpumask_t *mask)
+static void __percpu_depopulate_mask(void *__pdata, const cpumask_t *mask)
 {
 	int cpu;
 	for_each_cpu_mask_nr(cpu, *mask)
-- 
1.6.2.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
