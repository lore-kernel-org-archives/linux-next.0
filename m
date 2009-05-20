From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next: x86/msr.h: build fails
Date: Wed, 20 May 2009 13:41:41 +0400
Message-ID: <20090520094141.GA16421@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.170]:41656 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752793AbZETJlv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2009 05:41:51 -0400
Received: by wf-out-1314.google.com with SMTP id 26so113950wfd.4
        for <linux-next@vger.kernel.org>; Wed, 20 May 2009 02:41:52 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

Hi Borislav,

What do you think about this fix?
I have no idea what value should be for the cpu variable.


>From 0a72854156436549ccb540fa90f59511470cd188 Mon Sep 17 00:00:00 2001
From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Wed, 20 May 2009 13:33:43 +0400
Subject: [PATCH] x86: msr.h: fix build error

Fix this build error:
.../asm/msr.h: In function 'rdmsr_on_cpus':
.../asm/msr.h:248: error: request for member 'l' in something not a structure or union
.../asm/msr.h:248: error: request for member 'h' in something not a structure or union
.../asm/msr.h:248: error: too few arguments to function 'rdmsr_on_cpu'
.../asm/msr.h: In function 'wrmsr_on_cpus':
.../asm/msr.h:253: error: request for member 'l' in something not a structure or union
.../asm/msr.h:253: error: request for member 'h' in something not a structure or union
.../asm/msr.h:253: error: too few arguments to function 'wrmsr_on_cpu'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 arch/x86/include/asm/msr.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index e49c14e..0b73f73 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -227,8 +227,8 @@ do {                                                            \
 #ifdef CONFIG_SMP
 int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
 int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
-int rdmsr_on_cpus(const cpumask_t *mask, u32 msr_no, struct msr *msrs);
-int wrmsr_on_cpus(const cpumask_t *mask, u32 msr_no, struct msr *msrs);
+int rdmsr_on_cpus(const cpumask_t *mask, u32 msr_no, struct msr **msrs);
+int wrmsr_on_cpus(const cpumask_t *mask, u32 msr_no, struct msr **msrs);
 int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
 int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
 #else  /*  CONFIG_SMP  */
@@ -245,12 +245,12 @@ static inline int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 static inline int rdmsr_on_cpus(const cpumask_t *m, u32 msr_no,
 				struct msr **msrs)
 {
-	return rdmsr_on_cpu(msr_no, &(msrs[0].l), &(msrs[0].h));
+	return rdmsr_on_cpu(0, msr_no, &(msrs[0]->l), &(msrs[0]->h));
 }
 static inline int wrmsr_on_cpus(const cpumask_t *m, u32 msr_no,
 				struct msr **msrs)
 {
-	return wrmsr_on_cpu(msr_no, msrs[0].l, msrs[0].h);
+	return wrmsr_on_cpu(0, msr_no, msrs[0]->l, msrs[0]->h);
 }
 static inline int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no,
 				    u32 *l, u32 *h)
-- 
1.6.3.1
