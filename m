From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH] efi/libstub: Only disable stackleak plugin for arm64
Date: Mon, 30 Jul 2018 11:31:18 -0700
Message-ID: <20180730183118.25869-1-labbott@redhat.com>
References: <20180730163722.GD4276@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730163722.GD4276@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Laura Abbott <labbott@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: linux-next.vger.kernel.org

arm64 uses the full KBUILD_CFLAGS for building libstub as opposed
to x86 which doesn't. This means that x86 doesn't pick up
the gcc-plugins. We need to disable the stackleak plugin but
doing this unconditionally breaks x86 build since it doesn't
have any plugins. Switch to disabling the stackleak plugin for
arm64 only.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 drivers/firmware/efi/libstub/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 25dd2a14560d..88c322d7c71e 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -11,7 +11,10 @@ cflags-$(CONFIG_X86)		+= -m$(BITS) -D__KERNEL__ -O2 \
 				   -fPIC -fno-strict-aliasing -mno-red-zone \
 				   -mno-mmx -mno-sse -fshort-wchar
 
-cflags-$(CONFIG_ARM64)		:= $(subst -pg,,$(KBUILD_CFLAGS)) -fpie
+# arm64 uses the full KBUILD_CFLAGS so it's necessary to explicitly
+# disable the stackleak plugin
+cflags-$(CONFIG_ARM64)		:= $(subst -pg,,$(KBUILD_CFLAGS)) -fpie \
+				   $(DISABLE_STACKLEAK_PLUGIN)
 cflags-$(CONFIG_ARM)		:= $(subst -pg,,$(KBUILD_CFLAGS)) \
 				   -fno-builtin -fpic -mno-single-pic-base
 
@@ -21,7 +24,6 @@ KBUILD_CFLAGS			:= $(cflags-y) -DDISABLE_BRANCH_PROFILING \
 				   -D__NO_FORTIFY \
 				   $(call cc-option,-ffreestanding) \
 				   $(call cc-option,-fno-stack-protector) \
-				   $(DISABLE_STACKLEAK_PLUGIN)
 
 GCOV_PROFILE			:= n
 KASAN_SANITIZE			:= n
-- 
2.17.1
