From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 7 Mar 2016 10:48:59 +1100
Message-ID: <20160307104859.172a8ab9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/init.c

between commit:

  dfd55ad85e4a ("arm64: vmemmap: use virtual projection of linear region")

from Linus' tree and commit:

  c031a4213c11 ("arm64: kaslr: randomize the linear region")

from the arm64 tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/init.c
index 7802f216a67a,8c3d7dd91c25..000000000000
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@@ -317,11 -382,16 +382,16 @@@ void __init mem_init(void
  #ifdef CONFIG_KASAN
  		  MLG(KASAN_SHADOW_START, KASAN_SHADOW_END),
  #endif
+ 		  MLM(MODULES_VADDR, MODULES_END),
  		  MLG(VMALLOC_START, VMALLOC_END),
+ 		  MLK_ROUNDUP(_text, __start_rodata),
+ 		  MLK_ROUNDUP(__start_rodata, _etext),
+ 		  MLK_ROUNDUP(__init_begin, __init_end),
+ 		  MLK_ROUNDUP(_sdata, _edata),
  #ifdef CONFIG_SPARSEMEM_VMEMMAP
 -		  MLG((unsigned long)vmemmap,
 -		      (unsigned long)vmemmap + VMEMMAP_SIZE),
 +		  MLG(VMEMMAP_START,
 +		      VMEMMAP_START + VMEMMAP_SIZE),
- 		  MLM((unsigned long)virt_to_page(PAGE_OFFSET),
+ 		  MLM((unsigned long)phys_to_page(memblock_start_of_DRAM()),
  		      (unsigned long)virt_to_page(high_memory)),
  #endif
  		  MLK(FIXADDR_START, FIXADDR_TOP),
