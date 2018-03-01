From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Subject: Re: linux-next: build warnings after merge of the block tree
Date: Thu, 1 Mar 2018 09:32:20 +0530
Message-ID: <1f3b4275-b346-d768-681e-b180ec351140@linux.vnet.ibm.com>
References: <20180301112624.652612c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180301112624.652612c7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 03/01/2018 05:56 AM, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) produced these warning:
> 
> In file included from drivers/misc/cardreader/rts5209.c:24:0:
> include/linux/rtsx_pci.h:40:0: warning: "SG_END" redefined
>  #define   SG_END   0x02
>  
> In file included from include/linux/dmapool.h:14:0,
>                  from include/linux/pci.h:1311,
>                  from include/linux/rtsx_pci.h:26,
>                  from drivers/misc/cardreader/rts5209.c:24:
> include/linux/scatterlist.h:69:0: note: this is the location of the previous definition
>  #define SG_END  0x02UL
>  
> In file included from drivers/staging/rts5208/rtsx.h:180:0,
>                  from drivers/staging/rts5208/rtsx.c:28:
> drivers/staging/rts5208/rtsx_chip.h:343:0: warning: "SG_END" redefined
>  #define SG_END   0x02
>  
> In file included from include/linux/blkdev.h:28:0,
>                  from drivers/staging/rts5208/rtsx.c:23:
> include/linux/scatterlist.h:69:0: note: this is the location of the previous definition
>  #define SG_END  0x02UL
>  
> 
> and many more the same.
> 
> Introduced by commit
> 
>   723fbf563a6a ("lib/scatterlist: Add SG_CHAIN and SG_END macros for LSB encodings")

IIRC this was already detected and hence sent a new version changing
this to SG_LAST.

https://patchwork.kernel.org/patch/10227897/
