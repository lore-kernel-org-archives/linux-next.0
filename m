From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sched tree build warning
Date: Mon, 22 Dec 2008 08:04:26 +0100
Message-ID: <20081222070426.GD29160@elte.hu>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au> <b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:38514 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751960AbYLVHEr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 02:04:47 -0500
Content-Disposition: inline
In-Reply-To: <b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ken Chen <kenchen@google.com>, Paul Mackerras <paulus@samba.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Ken Chen <kenchen@google.com> wrote:

> On Sun, Dec 21, 2008 at 8:22 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next build (powerpc ppc64_defconfig) produced this new
> > warning:
> >
> > fs/proc/base.c: In function 'proc_pid_schedstat':
> > fs/proc/base.c:352: warning: format '%llu' expects type 'long long unsigned int',
> > but argument 3 has type 'u64'
> >
> > Introduced by commit 9c2c48020ec0dd6ecd27e5a1298f73b40d85a595
> > ("schedstat: consolidate per-task cpu runtime stats").
> 
> oh boy, this is the 2nd time that printing u64 bite me, I really need to 
> get hold of a machine that is non-x86_64.
> 
> Just saw Ingo's patch came in while I'm typing this email.  Thank you 
> Ingo for fixing this.

the real solution is something like the patch below. That generates new 
(but harmless) warnings within the powerpc code but those are a one-off 
effort to fix and are not reoccuring.

Cc:-ed Paul Mackerras - Paul, am i missing anything?

	Ingo

--------------->
>From 3d835af97da5b6cb755ca4f8464f8e636cc321da Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 22 Dec 2008 08:02:06 +0100
Subject: [PATCH] powerpc: fix u64

Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 arch/powerpc/include/asm/types.h |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/types.h b/arch/powerpc/include/asm/types.h
index c004c13..1cbfd7f 100644
--- a/arch/powerpc/include/asm/types.h
+++ b/arch/powerpc/include/asm/types.h
@@ -1,11 +1,7 @@
 #ifndef _ASM_POWERPC_TYPES_H
 #define _ASM_POWERPC_TYPES_H
 
-#ifdef __powerpc64__
-# include <asm-generic/int-l64.h>
-#else
-# include <asm-generic/int-ll64.h>
-#endif
+#include <asm-generic/int-ll64.h>
 
 #ifndef __ASSEMBLY__
 
