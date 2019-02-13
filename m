From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 13 Feb 2019 14:29:11 -0800
Message-ID: <20190213142911.f4447df2b30cc8ced2a1bb82@linux-foundation.org>
References: <20190213172518.50d4fec7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213172518.50d4fec7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>
List-Id: linux-next.vger.kernel.org

On Wed, 13 Feb 2019 17:25:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> fs/io_uring.c: In function 'io_async_list_note':
> fs/io_uring.c:931:16: error: 'VM_MAX_READAHEAD' undeclared (first use in this function); did you mean 'VM_MAYREAD'?
>     max_pages = VM_MAX_READAHEAD >> (PAGE_SHIFT - 10);
>                 ^~~~~~~~~~~~~~~~
>                 VM_MAYREAD
> 
> Caused by commit
> 
>   4c416502dae2 ("mm: Refactor readahead defines in mm.h")
> 
> interacting with commit
> 
>   6eff5fa16a2e ("io_uring: allow workqueue item to handle multiple buffered requests")
> 
> from the block tree.
> 

Thanks.  I'll fix mm-refactor-readahead-defines-in-mmh.patch and shall
stage it after the block tree so everything lands nicely.
