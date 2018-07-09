From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: linux-next: build warning after merge of the nand tree
Date: Mon, 9 Jul 2018 08:16:32 +0200
Message-ID: <20180709081632.0ed241d6@bbrezillon>
References: <20180709115115.354d625f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709115115.354d625f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, 9 Jul 2018 11:51:15 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Boris,
> 
> After merging the nand tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_hwcontrol':
> drivers/mtd/nand/raw/davinci_nand.c:115:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>    nand->IO_ADDR_W = (void __iomem __force *)addr;
>                      ^
> drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_select_chip':
> drivers/mtd/nand/raw/davinci_nand.c:132:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>   info->chip.IO_ADDR_W = (void __iomem __force *)addr;
>                          ^
> In file included from arch/x86/include/asm/bug.h:83:0,
>                  from include/linux/bug.h:5,
>                  from include/linux/thread_info.h:12,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:81,
>                  from include/linux/spinlock.h:51,
>                  from include/linux/seqlock.h:36,
>                  from include/linux/time.h:6,
>                  from include/linux/stat.h:19,
>                  from include/linux/module.h:10,
>                  from drivers/mtd/nand/raw/davinci_nand.c:27:
> drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_correct_4bit':
> drivers/mtd/nand/raw/davinci_nand.c:322:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   if (WARN_ON(0x01 & (unsigned) ecc_code))
>                      ^
> include/asm-generic/bug.h:112:25: note: in definition of macro 'WARN_ON'
>   int __ret_warn_on = !!(condition);    \
>                          ^~~~~~~~~
> drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_read_buf':
> drivers/mtd/nand/raw/davinci_nand.c:444:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
>                ^
> drivers/mtd/nand/raw/davinci_nand.c:446:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   else if ((0x01 & ((unsigned)buf)) == 0 && (0x01 & len) == 0)
>                     ^
> drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_write_buf':
> drivers/mtd/nand/raw/davinci_nand.c:457:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
>                ^
> drivers/mtd/nand/raw/davinci_nand.c:459:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   else if ((0x01 & ((unsigned)buf)) == 0 && (0x01 & len) == 0)
>                     ^
> drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_probe':
> drivers/mtd/nand/raw/davinci_nand.c:683:18: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   info->ioaddr  = (uint32_t __force) vaddr;
>                   ^
> drivers/mtd/nand/raw/atmel/nand-controller.c: In function 'atmel_smc_nand_controller_init':
> drivers/mtd/nand/raw/atmel/nand-controller.c:2053:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   nc->ebi_csa_offs = (unsigned int)match->data;
>                      ^
> drivers/mtd/nand/raw/sunxi_nand.c: In function 'sunxi_nfc_hw_ecc_read_chunks_dma':
> drivers/mtd/nand/raw/sunxi_nand.c:130:22: warning: large integer implicitly truncated to unsigned type [-Woverflow]
>  #define NFC_PAGE_OP  (2 << 30)
>                       ^
> drivers/mtd/nand/raw/sunxi_nand.c:1040:9: note: in expansion of macro 'NFC_PAGE_OP'
>   writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
>          ^~~~~~~~~~~
> drivers/mtd/nand/raw/sunxi_nand.c: In function 'sunxi_nfc_hw_ecc_write_page_dma':
> drivers/mtd/nand/raw/sunxi_nand.c:130:22: warning: large integer implicitly truncated to unsigned type [-Woverflow]
>  #define NFC_PAGE_OP  (2 << 30)
>                       ^
> drivers/mtd/nand/raw/sunxi_nand.c:1406:9: note: in expansion of macro 'NFC_PAGE_OP'
>   writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
>          ^~~~~~~~~~~
> 
> Presumably exposed by commits
> 
>   347af8918e8a ("mtd: rawnand: davinci: Allow selection of this driver when COMPILE_TEST=y")
>   b3d926a3d6e0 ("mtd: rawnand: sunxi: Allow selection of this driver when COMPILE_TEST=y")
> 

Stephen, thanks for this report.

Miquel, can you drop those 2 commits from the nand tree? I'll resubmit a
series fixing that.

Thanks,

Boris
