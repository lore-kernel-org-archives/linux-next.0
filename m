From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with the arm-current tree
Date: Mon, 27 Sep 2010 14:21:22 +1000
Message-ID: <20100927142122.ede9cf9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/mm/mmu.c between commit f1a2481c0ad3aebd94d11b317c488deaadc25002
("ARM: 6407/1: mmu: Setup MT_MEMORY and MT_MEMORY_NONCACHED L1 entries")
from the arm-current tree and commit
dc966984f44f16b8bb6b0644e501c7c2163ead69 ("ARM: Allow SMP kernels to boot
on UP systems") from the arm tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mm/mmu.c
index 6a3a2d0,a789320..0000000
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@@ -436,22 -423,21 +433,23 @@@ static void __init build_mem_type_table
  		mem_types[MT_MINICLEAN].prot_sect |= PMD_SECT_APX|PMD_SECT_AP_WRITE;
  		mem_types[MT_CACHECLEAN].prot_sect |= PMD_SECT_APX|PMD_SECT_AP_WRITE;
  
- #ifdef CONFIG_SMP
- 		/*
- 		 * Mark memory with the "shared" attribute for SMP systems
- 		 */
- 		user_pgprot |= L_PTE_SHARED;
- 		kern_pgprot |= L_PTE_SHARED;
- 		vecs_pgprot |= L_PTE_SHARED;
- 		mem_types[MT_DEVICE_WC].prot_sect |= PMD_SECT_S;
- 		mem_types[MT_DEVICE_WC].prot_pte |= L_PTE_SHARED;
- 		mem_types[MT_DEVICE_CACHED].prot_sect |= PMD_SECT_S;
- 		mem_types[MT_DEVICE_CACHED].prot_pte |= L_PTE_SHARED;
- 		mem_types[MT_MEMORY].prot_sect |= PMD_SECT_S;
- 		mem_types[MT_MEMORY].prot_pte |= L_PTE_SHARED;
- 		mem_types[MT_MEMORY_NONCACHED].prot_sect |= PMD_SECT_S;
- 		mem_types[MT_MEMORY_NONCACHED].prot_pte |= L_PTE_SHARED;
- #endif
+ 		if (is_smp()) {
+ 			/*
+ 			 * Mark memory with the "shared" attribute
+ 			 * for SMP systems
+ 			 */
+ 			user_pgprot |= L_PTE_SHARED;
+ 			kern_pgprot |= L_PTE_SHARED;
+ 			vecs_pgprot |= L_PTE_SHARED;
+ 			mem_types[MT_DEVICE_WC].prot_sect |= PMD_SECT_S;
+ 			mem_types[MT_DEVICE_WC].prot_pte |= L_PTE_SHARED;
+ 			mem_types[MT_DEVICE_CACHED].prot_sect |= PMD_SECT_S;
+ 			mem_types[MT_DEVICE_CACHED].prot_pte |= L_PTE_SHARED;
+ 			mem_types[MT_MEMORY].prot_sect |= PMD_SECT_S;
++			mem_types[MT_MEMORY].prot_pte |= L_PTE_SHARED;
+ 			mem_types[MT_MEMORY_NONCACHED].prot_sect |= PMD_SECT_S;
++			mem_types[MT_MEMORY_NONCACHED].prot_pte |= L_PTE_SHARED;
+ 		}
  	}
  
  	/*
