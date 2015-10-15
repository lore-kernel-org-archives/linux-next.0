From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: [PATCH] compiler, READ_ONCE: Fix build failure with some older GCC
Date: Thu, 15 Oct 2015 13:19:51 +0300
Message-ID: <1444904391-18058-1-git-send-email-aryabinin@virtuozzo.com>
References: <20151015201834.350258bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.parallels.com ([199.115.105.18]:47088 "EHLO
	mx2.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866AbbJOKUB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 06:20:01 -0400
In-Reply-To: <20151015201834.350258bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Andrey Ryabinin <aryabinin@virtuozzo.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@amacapital.net>, Andrey Konovalov <andreyknvl@google.com>, Kostya Serebryany <kcc@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev <kasan-dev@googlegroups.com>, Borislav Petkov <bp@alien8.de>, Denys Vlasenko <dvlasenk@redhat.com>, Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Sasha Levin <sasha.levin@oracle.com>, Wolfram Gloger <wmglo@dent.med.uni-muenchen.de>

Some old versions of GCC doesn't handle __alias (or maybe a combination
of 'static __always_inline __alias') right.

GCC creates outline and unused copy of __read_once_size_check()
function in the object file which references memcpy and causes
the build failure:
	arch/x86/entry/vdso/vclock_gettime.o: In function `__read_once_size_check':
	vclock_gettime.c:(.text+0x5f): undefined reference to `memcpy'
	arch/x86/entry/vdso/vgetcpu.o: In function `__read_once_size_check':
	vgetcpu.c:(.text+0x2f): undefined reference to `memcpy'

We could avoid using alias to work around this problem.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
---
 include/linux/compiler.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index aa2ae4c..3436a4c 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -231,8 +231,11 @@ void __read_once_size_nocheck(const volatile void *p, void *res, int size)
 	__READ_ONCE_SIZE;
 }
 #else
-static __always_inline __alias(__read_once_size_check)
-void __read_once_size_nocheck(const volatile void *p, void *res, int size);
+static __always_inline
+void __read_once_size_nocheck(const volatile void *p, void *res, int size)
+{
+	__READ_ONCE_SIZE;
+}
 #endif
 
 static __always_inline void __write_once_size(volatile void *p, void *res, int size)
-- 
2.4.9
