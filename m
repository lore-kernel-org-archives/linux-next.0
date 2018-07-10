From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build warnings after merge of the rdma tree
Date: Mon, 9 Jul 2018 21:41:57 -0600
Message-ID: <20180710034157.GA17400@mellanox.com>
References: <20180710113342.605e53e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710113342.605e53e8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 10, 2018 at 11:33:42AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> In file included from include/linux/printk.h:336:0,
>                  from include/linux/kernel.h:14,
>                  from arch/x86/include/asm/percpu.h:45,
>                  from arch/x86/include/asm/current.h:6,
>                  from include/linux/mutex.h:14,
>                  from drivers/infiniband/hw/cxgb4/iw_cxgb4.h:34,
>                  from drivers/infiniband/hw/cxgb4/cq.c:33:
> drivers/infiniband/hw/cxgb4/cq.c: In function '__c4iw_poll_cq_one':
> include/linux/dynamic_debug.h:127:3: warning: 'cqe.u.gen.wrid_hi' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    __dynamic_pr_debug(&descriptor, pr_fmt(fmt), \
>    ^~~~~~~~~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/cq.c:674:16: note: 'cqe.u.gen.wrid_hi' was declared here
>   struct t4_cqe cqe;
>                 ^~~
> In file included from include/linux/printk.h:336:0,
>                  from include/linux/kernel.h:14,
>                  from arch/x86/include/asm/percpu.h:45,
>                  from arch/x86/include/asm/current.h:6,
>                  from include/linux/mutex.h:14,
>                  from drivers/infiniband/hw/cxgb4/iw_cxgb4.h:34,
>                  from drivers/infiniband/hw/cxgb4/cq.c:33:
> include/linux/dynamic_debug.h:127:3: warning: 'cqe.u.gen.wrid_low' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    __dynamic_pr_debug(&descriptor, pr_fmt(fmt), \
>    ^~~~~~~~~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/cq.c:674:16: note: 'cqe.u.gen.wrid_low' was declared here
>   struct t4_cqe cqe;
>                 ^~~
> In file included from include/linux/printk.h:336:0,
>                  from include/linux/kernel.h:14,
>                  from arch/x86/include/asm/percpu.h:45,
>                  from arch/x86/include/asm/current.h:6,
>                  from include/linux/mutex.h:14,
>                  from drivers/infiniband/hw/cxgb4/iw_cxgb4.h:34,
>                  from drivers/infiniband/hw/cxgb4/cq.c:33:
> include/linux/dynamic_debug.h:127:3: warning: 'cqe.len' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    __dynamic_pr_debug(&descriptor, pr_fmt(fmt), \
>    ^~~~~~~~~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/cq.c:674:16: note: 'cqe.len' was declared here
>   struct t4_cqe cqe;
>                 ^~~
> 
> Introduced by commit
> 
>   4ab39e2f98f2 ("RDMA/cxgb4: Make c4iw_poll_cq_one() easier to analyze")
> 
> Again, I can't easily tell if these are false positives or not.

What compiler is producing these? I got nothing from 0-day build
service or my local gcc-7..

They are false positives and I guess we need to put the
uninitialized_var back that was hiding them.

Also curious that the powerpc compiler gets a different set..

Thanks,
Jason
