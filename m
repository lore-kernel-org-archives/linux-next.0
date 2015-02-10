From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [PATCH] x86_64-add-kasan-support-fix
Date: Tue, 10 Feb 2015 13:34:53 +0300
Message-ID: <1423564493-14372-1-git-send-email-a.ryabinin@samsung.com>
References: <CA+r1Zhg+ktat+OrJoYeNAz=aV=H73fgni-jwU42EbB8WOKCq2w@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CA+r1Zhg+ktat+OrJoYeNAz=aV=H73fgni-jwU42EbB8WOKCq2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andrey Ryabinin <a.ryabinin@samsung.com>
List-Id: linux-next.vger.kernel.org

Combination of CONFIG_SPARSEMEM_VMEMMAP=n, CONFIG_KASAN=y
cause build error:
	arch/x86/built-in.o: In function `populate_zero_shadow':
	kasan_init_64.c:(.init.text+0xe2cc): undefined reference to
	`vmemmap_alloc_block'
	kasan_init_64.c:(.init.text+0xe3ab): undefined reference to
	`vmemmap_alloc_block'
	kasan_init_64.c:(.init.text+0xe483): undefined reference to
	`vmemmap_alloc_block'
	arch/x86/built-in.o: In function `kasan_init':
	(.init.text+0xe65d): undefined reference to `vmemmap_populate'
	arch/x86/built-in.o: In function `kasan_init':
	(.init.text+0xe6ea): undefined reference to `vmemmap_populate'
	make: *** [vmlinux] Error 1

x86_64-specific part of KASAN depends on SPARSEMEM_VMEMMAP.
Express this in Kconfig.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
Reported-by: Jim Davis <jim.epost@gmail.com>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1607c46..1e78e3c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -85,7 +85,7 @@ config X86
 	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_ARCH_KMEMCHECK
-	select HAVE_ARCH_KASAN if X86_64
+	select HAVE_ARCH_KASAN if X86_64 && SPARSEMEM_VMEMMAP
 	select HAVE_USER_RETURN_NOTIFIER
 	select ARCH_BINFMT_ELF_RANDOMIZE_PIE
 	select HAVE_ARCH_JUMP_LABEL
-- 
2.3.0
