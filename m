From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 30 May 2017 11:40:50 +1000
Message-ID: <20170530114050.2b702cc1@canb.auug.org.au>
References: <20170529160209.5230c05b@canb.auug.org.au>
        <20170529211505.GP3956@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49735 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750798AbdE3Bkx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 21:40:53 -0400
In-Reply-To: <20170529211505.GP3956@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>

Hi Paul,

On Mon, 29 May 2017 14:15:05 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
>
> Anyone see any other options?

I will add the following to linux-next today.  If the Blackfin guys
agree (or come up with something better), you should get their acks and
then add it to your tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 30 May 2017 09:21:05 +1000
Subject: [PATCH] Revert "Blackfin: use more standard pr_fmt in the module loader"

This reverts commit b75a9e6bfba5c7343391ac1bacd44d6652dde8da.

It turns out (after all this time) that referencing a function parameter
from a global macro was a bit fragile.

This could probably be done better, but this fixes a build failure due
to a commit that adds a use of pr_alert in an include file.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/blackfin/kernel/module.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/blackfin/kernel/module.c b/arch/blackfin/kernel/module.c
index 0188c933b155..adbbccc91fa1 100644
--- a/arch/blackfin/kernel/module.c
+++ b/arch/blackfin/kernel/module.c
@@ -4,7 +4,7 @@
  * Licensed under the GPL-2 or later
  */
 
-#define pr_fmt(fmt) "module %s: " fmt, mod->name
+#define pr_fmt(fmt) "module %s: " fmt
 
 #include <linux/moduleloader.h>
 #include <linux/elf.h>
@@ -44,7 +44,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_inst_sram_alloc(s->sh_size);
 			mod->arch.text_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 inst memory allocation failed\n");
+				pr_err("L1 inst memory allocation failed\n",
+					mod->name);
 				return -1;
 			}
 			dma_memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -56,7 +57,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_sram_alloc(s->sh_size);
 			mod->arch.data_a_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				pr_err("L1 data memory allocation failed\n",
+					mod->name);
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -68,7 +70,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_sram_zalloc(s->sh_size);
 			mod->arch.bss_a_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				pr_err("L1 data memory allocation failed\n",
+					mod->name);
 				return -1;
 			}
 
@@ -77,7 +80,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_B_sram_alloc(s->sh_size);
 			mod->arch.data_b_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				pr_err("L1 data memory allocation failed\n",
+					mod->name);
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -87,7 +91,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_B_sram_alloc(s->sh_size);
 			mod->arch.bss_b_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				pr_err("L1 data memory allocation failed\n",
+					mod->name);
 				return -1;
 			}
 			memset(dest, 0, s->sh_size);
@@ -99,7 +104,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l2_sram_alloc(s->sh_size);
 			mod->arch.text_l2 = dest;
 			if (dest == NULL) {
-				pr_err("L2 SRAM allocation failed\n");
+				pr_err("L2 SRAM allocation failed\n",
+					mod->name);
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -111,7 +117,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l2_sram_alloc(s->sh_size);
 			mod->arch.data_l2 = dest;
 			if (dest == NULL) {
-				pr_err("L2 SRAM allocation failed\n");
+				pr_err("L2 SRAM allocation failed\n",
+					mod->name);
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -123,7 +130,8 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l2_sram_zalloc(s->sh_size);
 			mod->arch.bss_l2 = dest;
 			if (dest == NULL) {
-				pr_err("L2 SRAM allocation failed\n");
+				pr_err("L2 SRAM allocation failed\n",
+					mod->name);
 				return -1;
 			}
 
@@ -157,7 +165,7 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	Elf32_Sym *sym;
 	unsigned long location, value, size;
 
-	pr_debug("applying relocate section %u to %u\n",
+	pr_debug("applying relocate section %u to %u\n", mod->name,
 		relsec, sechdrs[relsec].sh_info);
 
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
@@ -174,14 +182,14 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 #ifdef CONFIG_SMP
 		if (location >= COREB_L1_DATA_A_START) {
-			pr_err("cannot relocate in L1: %u (SMP kernel)\n",
-				ELF32_R_TYPE(rel[i].r_info));
+			pr_err("cannot relocate in L1: %u (SMP kernel)",
+				mod->name, ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 		}
 #endif
 
 		pr_debug("location is %lx, value is %lx type is %d\n",
-			location, value, ELF32_R_TYPE(rel[i].r_info));
+			mod->name, location, value, ELF32_R_TYPE(rel[i].r_info));
 
 		switch (ELF32_R_TYPE(rel[i].r_info)) {
 
@@ -201,11 +209,11 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		case R_BFIN_PCREL12_JUMP_S:
 		case R_BFIN_PCREL10:
 			pr_err("unsupported relocation: %u (no -mlong-calls?)\n",
-				ELF32_R_TYPE(rel[i].r_info));
+				mod->name, ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 
 		default:
-			pr_err("unknown relocation: %u\n",
+			pr_err("unknown relocation: %u\n", mod->name,
 				ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 		}
@@ -222,7 +230,8 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			isram_memcpy((void *)location, &value, size);
 			break;
 		default:
-			pr_err("invalid relocation for %#lx\n", location);
+			pr_err("invalid relocation for %#lx\n",
+				mod->name, location);
 			return -ENOEXEC;
 		}
 	}
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
