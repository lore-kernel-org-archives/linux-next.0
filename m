From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH] mips/signal: In force_fcr31_sig return in the impossible case
Date: Tue, 08 Aug 2017 14:07:44 -0500
Message-ID: <873791g9of.fsf_-_@xmission.com>
References: <20170808151004.071d5a6d@canb.auug.org.au>
        <20170808055822.GI3509@linux-mips.org> <87wp6eezgl.fsf@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:48997 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752066AbdHHTQK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2017 15:16:10 -0400
In-Reply-To: <87wp6eezgl.fsf@xmission.com> (Eric W. Biederman's message of
        "Tue, 08 Aug 2017 12:33:46 -0500")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Hogan <james.hogan@imgtec.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Maciej W. Rozycki" <macro@linux-mips.org>


In a recent discussion Maciej Rozycki reported that this case is
impossible.

Handle the impossible case by just returning instead of trying to
handle it.  This makes static analysis simpler as it means nothing
needs to consider the impossible case after the return statement.

As the code no longer has to deal with this case remove FPE_FIXME from
the mips siginfo.h

Cc: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Link: http://lkml.kernel.org/r/20170718140651.15973-4-ebiederm@xmission.com
Ref: ea1b75cf9138 ("signal/mips: Document a conflict with SI_USER with SIGFPE")
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 arch/mips/include/uapi/asm/siginfo.h | 7 -------
 arch/mips/kernel/traps.c             | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

Ralf, unless someone objects this is the patch I plan on merging into my
tree, and building up.

diff --git a/arch/mips/include/uapi/asm/siginfo.h b/arch/mips/include/uapi/asm/siginfo.h
index 22a86d84a504..cf6113bbcb98 100644
--- a/arch/mips/include/uapi/asm/siginfo.h
+++ b/arch/mips/include/uapi/asm/siginfo.h
@@ -123,11 +123,4 @@ typedef struct siginfo {
 #define SI_TIMER	-3	/* sent by timer expiration */
 #define SI_MESGQ	-4	/* sent by real time mesq state change */
 
-/*
- * SIGFPE si_codes
- */
-#ifdef __KERNEL__
-#define FPE_FIXME	0	/* Broken dup of SI_USER */
-#endif /* __KERNEL__ */
-
 #endif /* _UAPI_ASM_SIGINFO_H */
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 6c9cca9c5341..2bf414993347 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -735,7 +735,7 @@ void force_fcr31_sig(unsigned long fcr31, void __user *fault_addr,
 	else if (fcr31 & FPU_CSR_INE_X)
 		si.si_code = FPE_FLTRES;
 	else
-		si.si_code = FPE_FIXME;
+		return; /* Broken hardware? */
 	force_sig_info(SIGFPE, &si, tsk);
 }
 
-- 
2.10.1
