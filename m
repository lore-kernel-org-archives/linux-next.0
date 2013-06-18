From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] x86: fix build error and kconfig for ia32_emulation
 and binfmt
Date: Tue, 18 Jun 2013 12:33:40 -0700
Message-ID: <51C0B614.5000708@infradead.org>
References: <20130617185106.5950ffbf4b96acd9b2b2c834@canb.auug.org.au> <51BF4443.2040801@infradead.org> <20130618102411.258693d302bad332e920fd63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130618102411.258693d302bad332e920fd63@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix kconfig warning and build errors on x86_64 by selecting BINFMT_ELF
when COMPAT_BINFMT_ELF is being selected.

warning: (IA32_EMULATION) selects COMPAT_BINFMT_ELF which has unmet direct dependencies (COMPAT && BINFMT_ELF)

fs/built-in.o: In function `elf_core_dump':
compat_binfmt_elf.c:(.text+0x3e093): undefined reference to `elf_core_extra_phdrs'
compat_binfmt_elf.c:(.text+0x3ebcd): undefined reference to `elf_core_extra_data_size'
compat_binfmt_elf.c:(.text+0x3eddd): undefined reference to `elf_core_write_extra_phdrs'
compat_binfmt_elf.c:(.text+0x3f004): undefined reference to `elf_core_write_extra_data'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 arch/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20130618.orig/arch/x86/Kconfig
+++ linux-next-20130618/arch/x86/Kconfig
@@ -2273,6 +2273,7 @@ source "fs/Kconfig.binfmt"
 config IA32_EMULATION
 	bool "IA32 Emulation"
 	depends on X86_64
+	select BINFMT_ELF
 	select COMPAT_BINFMT_ELF
 	select HAVE_UID16
 	---help---
