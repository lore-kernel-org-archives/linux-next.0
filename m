From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build warning after merge of the rdma tree
Date: Wed, 25 Jul 2018 21:05:03 -0600
Message-ID: <20180726030503.GA18170@mellanox.com>
References: <20180726105553.00a36e3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180726105553.00a36e3c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Chuck Lever <chuck.lever@oracle.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 26, 2018 at 10:55:53AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rdma tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> net/sunrpc/xprtrdma/svc_rdma_rw.c: In function 'svc_rdma_post_chunk_ctxt':
> net/sunrpc/xprtrdma/svc_rdma_rw.c:350:5: warning: 'bad_wr' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   if (bad_wr != first_wr)
>      ^

Huh. I'm quite surprised 0-day build service didn't warn on this.

> Introduced by commit
> 
>   ed288d74a9e5 ("net/xprtrdma: Simplify ib_post_(send|recv|srq_recv)() calls")
> 
> This is an actual problem.

Yes, for sure. Bart?

Thanks,
Jason
