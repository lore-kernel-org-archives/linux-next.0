From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 2 Jun 2017 10:51:36 -0700
Message-ID: <20170602175136.GA3721@linux.vnet.ibm.com>
References: <20170529160209.5230c05b@canb.auug.org.au>
 <20170529211505.GP3956@linux.vnet.ibm.com>
 <874lw36l3h.fsf@concordia.ellerman.id.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <874lw36l3h.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, May 30, 2017 at 02:10:26PM +1000, Michael Ellerman wrote:
> "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> writes:
> 
> > On Mon, May 29, 2017 at 04:02:09PM +1000, Stephen Rothwell wrote:
> >> Hi Paul,
> >> 
> >> After merging the rcu tree, today's linux-next build (bfin
> >> BF526-EZBRD_defconfig and several other bfin configs) failed like this:
> >> 
> >> In file included from include/linux/srcu.h:60:0,
> >>                  from include/linux/notifier.h:15,
> >>                  from include/linux/memory_hotplug.h:6,
> >>                  from include/linux/mmzone.h:777,
> >>                  from include/linux/gfp.h:5,
> >>                  from include/linux/kmod.h:22,
> >>                  from include/linux/module.h:13,
> >>                  from include/linux/moduleloader.h:5,
> >>                  from arch/blackfin/kernel/module.c:9:
> >> include/linux/srcutiny.h: In function 'srcu_torture_stats_print':
> >> include/linux/srcutiny.h:96:2: error: 'mod' undeclared (first use in this function)
> >> 
> >> Caused by commit
> >> 
> >>   54ffb22bd841 ("rcutorture: Move SRCU status printing to SRCU implementations")
> >
> > And of course this is nothing but a printk().
> 
> Ah but it's not, it's a pr_alert():
> 
> +       pr_alert("%s%s Tiny SRCU per-CPU(idx=%d): (%hd,%hd)\n",
> +                tt, tf, idx,
> +                READ_ONCE(sp->srcu_lock_nesting[!idx]),
> +                READ_ONCE(sp->srcu_lock_nesting[idx]));
> 
> Where pr_alert() is:
> 
> #define pr_alert(fmt, ...) \
> 	printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
> 
> 
> So that's where pr_fmt() is coming into it.
> 
> And if any code in module.c called srcu_torture_stats_print(), it would
> actually claim to come from "module: ", which would be confusing.
> 
> I don't think you use pr_fmt() in the RCU code, so you could skip using
> pr_alert() and just use printk(KERN_ALERT "...") and get the same
> result, without any interactions with pr_fmt().

Does the following patch fix things for you?

							Thanx, Paul

------------------------------------------------------------------------

commit 7eb8d998d3f66851c0d25abcdb2d737edc6a21ed
Author: Joe Perches <joe@perches.com>
Date:   Tue May 30 15:20:37 2017 -0700

    module: Fix pr_fmt() bug for header use of printk
    
    This commit removes the pr_fmt() macro, replacing it with mod_err() and
    mod_debug() macros to avoid errors when using printk() from header files.
    
    Signed-off-by: Joe Perches <joe@perches.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/arch/blackfin/kernel/module.c b/arch/blackfin/kernel/module.c
index 0188c933b155..15af5768c403 100644
--- a/arch/blackfin/kernel/module.c
+++ b/arch/blackfin/kernel/module.c
@@ -4,8 +4,6 @@
  * Licensed under the GPL-2 or later
  */
 
-#define pr_fmt(fmt) "module %s: " fmt, mod->name
-
 #include <linux/moduleloader.h>
 #include <linux/elf.h>
 #include <linux/vmalloc.h>
@@ -16,6 +14,11 @@
 #include <asm/cacheflush.h>
 #include <linux/uaccess.h>
 
+#define mod_err(mod, fmt, ...)						\
+	pr_err("module %s: " fmt, (mod)->name, ##__VA_ARGS__)
+#define mod_debug(mod, fmt, ...)					\
+	pr_debug("module %s: " fmt, (mod)->name, ##__VA_ARGS__)
+
 /* Transfer the section to the L1 memory */
 int
 module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
@@ -44,7 +47,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_inst_sram_alloc(s->sh_size);
 			mod->arch.text_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 inst memory allocation failed\n");
+				mod_err(mod, "L1 inst memory allocation failed\n");
 				return -1;
 			}
 			dma_memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -56,7 +59,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_sram_alloc(s->sh_size);
 			mod->arch.data_a_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				mod_err(mod, "L1 data memory allocation failed\n");
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -68,7 +71,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_sram_zalloc(s->sh_size);
 			mod->arch.bss_a_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				mod_err(mod, "L1 data memory allocation failed\n");
 				return -1;
 			}
 
@@ -77,7 +80,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_B_sram_alloc(s->sh_size);
 			mod->arch.data_b_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				mod_err(mod, "L1 data memory allocation failed\n");
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -87,7 +90,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l1_data_B_sram_alloc(s->sh_size);
 			mod->arch.bss_b_l1 = dest;
 			if (dest == NULL) {
-				pr_err("L1 data memory allocation failed\n");
+				mod_err(mod, "L1 data memory allocation failed\n");
 				return -1;
 			}
 			memset(dest, 0, s->sh_size);
@@ -99,7 +102,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l2_sram_alloc(s->sh_size);
 			mod->arch.text_l2 = dest;
 			if (dest == NULL) {
-				pr_err("L2 SRAM allocation failed\n");
+				mod_err(mod, "L2 SRAM allocation failed\n");
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -111,7 +114,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l2_sram_alloc(s->sh_size);
 			mod->arch.data_l2 = dest;
 			if (dest == NULL) {
-				pr_err("L2 SRAM allocation failed\n");
+				mod_err(mod, "L2 SRAM allocation failed\n");
 				return -1;
 			}
 			memcpy(dest, (void *)s->sh_addr, s->sh_size);
@@ -123,7 +126,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			dest = l2_sram_zalloc(s->sh_size);
 			mod->arch.bss_l2 = dest;
 			if (dest == NULL) {
-				pr_err("L2 SRAM allocation failed\n");
+				mod_err(mod, "L2 SRAM allocation failed\n");
 				return -1;
 			}
 
@@ -157,8 +160,8 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	Elf32_Sym *sym;
 	unsigned long location, value, size;
 
-	pr_debug("applying relocate section %u to %u\n",
-		relsec, sechdrs[relsec].sh_info);
+	mod_debug(mod, "applying relocate section %u to %u\n",
+		  relsec, sechdrs[relsec].sh_info);
 
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -174,14 +177,14 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 #ifdef CONFIG_SMP
 		if (location >= COREB_L1_DATA_A_START) {
-			pr_err("cannot relocate in L1: %u (SMP kernel)\n",
+			mod_err(mod, "cannot relocate in L1: %u (SMP kernel)\n",
 				ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 		}
 #endif
 
-		pr_debug("location is %lx, value is %lx type is %d\n",
-			location, value, ELF32_R_TYPE(rel[i].r_info));
+		mod_debug(mod, "location is %lx, value is %lx type is %d\n",
+			  location, value, ELF32_R_TYPE(rel[i].r_info));
 
 		switch (ELF32_R_TYPE(rel[i].r_info)) {
 
@@ -200,12 +203,12 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		case R_BFIN_PCREL12_JUMP:
 		case R_BFIN_PCREL12_JUMP_S:
 		case R_BFIN_PCREL10:
-			pr_err("unsupported relocation: %u (no -mlong-calls?)\n",
+			mod_err(mod, "unsupported relocation: %u (no -mlong-calls?)\n",
 				ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 
 		default:
-			pr_err("unknown relocation: %u\n",
+			mod_err(mod, "unknown relocation: %u\n",
 				ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 		}
@@ -222,7 +225,7 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			isram_memcpy((void *)location, &value, size);
 			break;
 		default:
-			pr_err("invalid relocation for %#lx\n", location);
+			mod_err(mod, "invalid relocation for %#lx\n", location);
 			return -ENOEXEC;
 		}
 	}
