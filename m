From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Tue, 9 Feb 2016 15:50:24 +1100
Message-ID: <20160209155024.56b77932@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Elliott <elliott@hpe.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Matt Fleming <matt@codeblueprint.co.uk>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/x86/platform/efi/efi.c

between commit:

  1e82b9479070 ("x86/efi: Show actual ending addresses in efi_print_memmap")

from the tip tree and commit:

  e0532ef9f825 ("x86/efi: print size and base in binary units in efi_print_memmap")

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/platform/efi/efi.c
index e80826e6f3a9,122584ec27ef..000000000000
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@@ -232,14 -241,14 +241,14 @@@ void __init efi_print_memmap(void
  	for (p = memmap.map, i = 0;
  	     p < memmap.map_end;
  	     p += memmap.desc_size, i++) {
- 		char buf[64];
+ 		efi_memory_desc_t *md = p;
+ 		u64 size = md->num_pages << EFI_PAGE_SHIFT;
+ 		char buf[64], buf3[32];
  
- 		md = p;
- 		pr_info("mem%02u: %s range=[0x%016llx-0x%016llx] (%lluMB)\n",
+ 		pr_info("mem%02u: %s range=[0x%016llx-0x%016llx] (%s)\n",
  			i, efi_md_typeattr_format(buf, sizeof(buf), md),
- 			md->phys_addr,
- 			md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT) - 1,
- 			(md->num_pages >> (20 - EFI_PAGE_SHIFT)));
 -			md->phys_addr, md->phys_addr + size,
++			md->phys_addr, md->phys_addr + size -1,
+ 			efi_size_format(buf3, sizeof(buf3), size));
  	}
  #endif  /*  EFI_DEBUG  */
  }
