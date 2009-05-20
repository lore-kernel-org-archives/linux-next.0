From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: next: x86/msr.h: build fails
Date: Wed, 20 May 2009 14:14:46 +0400
Message-ID: <20090520101446.GA16517@orion>
References: <20090520094141.GA16421@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.179]:54741 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755695AbZETKVo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2009 06:21:44 -0400
Received: by wa-out-1112.google.com with SMTP id j5so79101wah.21
        for <linux-next@vger.kernel.org>; Wed, 20 May 2009 03:21:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20090520094141.GA16421@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

On Wed, May 20, 2009 at 01:41:41PM +0400, Alexander Beregalov wrote:
> Hi Borislav,
> 
> What do you think about this fix?
> I have no idea what value should be for the cpu variable.

This patch should be better.
This is !SMP code, then cpu=0 is ok.


From: Alexander Beregalov <a.beregalov@gmail.com>
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

This is !SMP code so `cpu` should be 0.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 arch/x86/include/asm/msr.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index e49c14e..fa082ba 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -243,14 +243,14 @@ static inline int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 	return 0;
 }
 static inline int rdmsr_on_cpus(const cpumask_t *m, u32 msr_no,
-				struct msr **msrs)
+				struct msr *msrs)
 {
-	return rdmsr_on_cpu(msr_no, &(msrs[0].l), &(msrs[0].h));
+	return rdmsr_on_cpu(0, msr_no, &(msrs[0].l), &(msrs[0].h));
 }
 static inline int wrmsr_on_cpus(const cpumask_t *m, u32 msr_no,
-				struct msr **msrs)
+				struct msr *msrs)
 {
-	return wrmsr_on_cpu(msr_no, msrs[0].l, msrs[0].h);
+	return wrmsr_on_cpu(0, msr_no, msrs[0].l, msrs[0].h);
 }
 static inline int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no,
 				    u32 *l, u32 *h)
