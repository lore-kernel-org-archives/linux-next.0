From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] edac: need to export cpu_llc_id
Date: Wed, 16 Sep 2009 09:39:35 +1000
Message-ID: <20090916093935.6bc2c91f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47629 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753120AbZIOXjh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2009 19:39:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "per_cpu__cpu_llc_id" [drivers/edac/edac_core.ko] undefined!

Caused by commit b69b29de65fe4078b125acc9dea34be82f7c362c ("EDAC, AMD:
carve out MCi_STATUS decoding").

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/smpboot.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index a25eeec..04c74b4 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -100,6 +100,7 @@ EXPORT_SYMBOL(smp_num_siblings);
 
 /* Last level cache ID of each logical CPU */
 DEFINE_PER_CPU(u16, cpu_llc_id) = BAD_APICID;
+EXPORT_PER_CPU_SYMBOL(cpu_llc_id);
 
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
-- 
1.6.3.3


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
