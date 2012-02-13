From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Sun, 12 Feb 2012 22:45:08 -0800
Message-ID: <20120213064508.GD28617@kroah.com>
References: <20120213171949.262e0c12e8d8883e90216df1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120213171949.262e0c12e8d8883e90216df1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>, Seth Jennings <sjenning@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 13, 2012 at 05:19:49PM +1100, Stephen Rothwell wrote:
> Hi ,
> 
> After merging the final tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> drivers/staging/zsmalloc/zsmalloc-main.c: In function 'zs_cpu_notifier':
> drivers/staging/zsmalloc/zsmalloc-main.c:451:3: error: implicit declaration of function 'alloc_vm_area' [-Werror=implicit-function-declaration]
> drivers/staging/zsmalloc/zsmalloc-main.c:451:12: warning: assignment makes pointer from integer without a cast [enabled by default]
> drivers/staging/zsmalloc/zsmalloc-main.c:459:4: error: implicit declaration of function 'free_vm_area' [-Werror=implicit-function-declaration]
> drivers/staging/zsmalloc/zsmalloc-main.c: In function 'zs_map_object':
> drivers/staging/zsmalloc/zsmalloc-main.c:705:3: error: implicit declaration of function 'set_pte' [-Werror=implicit-function-declaration]
> drivers/staging/zsmalloc/zsmalloc-main.c:709:27: error: dereferencing pointer to incomplete type
> drivers/staging/zsmalloc/zsmalloc-main.c: In function 'zs_unmap_object':
> drivers/staging/zsmalloc/zsmalloc-main.c:739:3: error: implicit declaration of function '__flush_tlb_one' [-Werror=implicit-function-declaration]
> 
> Caused by commit 61989a80fb3a ("staging: zsmalloc: zsmalloc memory
> allocation library").  This needs to include linux/vmalloc.h at least.  I
> couldn't find set_pte at all or __flush_tlb_one for powerpc.
> 
> This was too hard to revert, so I have left powerpc allyesconfig broken
> for today.  I may revert it (and some dependent commits) tomorrow.

Nitin, please send me a patch to fix this as soon as possible.

greg k-h
