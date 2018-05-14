From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build warning after merge of the rdma tree
Date: Mon, 14 May 2018 12:03:26 -0600
Message-ID: <20180514180326.GM21517@mellanox.com>
References: <20180507094454.4a71f8a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180507094454.4a71f8a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Wise <swise@opengridcomputing.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 07, 2018 at 09:44:54AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/infiniband/hw/cxgb4/restrack.c: In function 'fill_res_qp_entry':
> drivers/infiniband/hw/cxgb4/restrack.c:140:6: warning: 'last_rq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   if (rdma_nl_put_driver_u32(msg, "idx", idx))
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/restrack.c:180:20: note: 'last_rq_idx' was declared here
>   u16 first_rq_idx, last_rq_idx;
>                     ^~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/restrack.c:140:6: warning: 'first_rq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   if (rdma_nl_put_driver_u32(msg, "idx", idx))
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/restrack.c:180:6: note: 'first_rq_idx' was declared here
>   u16 first_rq_idx, last_rq_idx;
>       ^~~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/restrack.c:228:6: warning: 'last_sq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   if (fill_swsqes(msg, &wq.sq, first_sq_idx, fsp, last_sq_idx, lsp))
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/infiniband/hw/cxgb4/restrack.c:228:6: warning: 'first_sq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> Introduced by commit
> 
>   056f9c7f39bf ("iw_cxgb4: dump detailed driver-specific QP information")
> 

SteveW, is there a patch to fix this that I'm missing?

Thanks,
Jason
