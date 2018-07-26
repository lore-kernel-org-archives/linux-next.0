From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build warning after merge of the rdma tree
Date: Thu, 26 Jul 2018 11:38:06 -0600
Message-ID: <20180726173806.GG10178@mellanox.com>
References: <20180726105553.00a36e3c@canb.auug.org.au>
 <20180726030503.GA18170@mellanox.com>
 <36211fbe8a548742cf8e41a57f02f81e55c86794.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <36211fbe8a548742cf8e41a57f02f81e55c86794.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bart Van Assche <Bart.VanAssche@wdc.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "dledford@redhat.com" <dledford@redhat.com>, "chuck.lever@oracle.com" <chuck.lever@oracle.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 26, 2018 at 05:10:13AM +0000, Bart Van Assche wrote:
> On Wed, 2018-07-25 at 21:05 -0600, Jason Gunthorpe wrote:
> > On Thu, Jul 26, 2018 at 10:55:53AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the rdma tree, today's linux-next build (powerpc
> > > ppc64_defconfig) produced this warning:
> > > 
> > > net/sunrpc/xprtrdma/svc_rdma_rw.c: In function 'svc_rdma_post_chunk_ctxt':
> > > net/sunrpc/xprtrdma/svc_rdma_rw.c:350:5: warning: 'bad_wr' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >   if (bad_wr != first_wr)
> > >      ^
> > 
> > Huh. I'm quite surprised 0-day build service didn't warn on this.
> > 
> > > Introduced by commit
> > > 
> > >   ed288d74a9e5 ("net/xprtrdma: Simplify ib_post_(send|recv|srq_recv)() calls")
> > > 
> > > This is an actual problem.
> > 
> > Yes, for sure. Bart?
> 
> Thanks Stephen for having reported this. I propose to revert the changes in
> net/sunrpc/xprtrdma/svc_rdma_rw.c. Jason, do you want me to submit the below
> as a formal patch?

I applied the below.. Please let me know if there is an error.

Thanks,
Jason

commit 5d85a822fae2b484f26ddb09815063a88962a0cb
Author: Jason Gunthorpe <jgg@mellanox.com>
Date:   Thu Jul 26 11:36:50 2018 -0600

    net/xprtrdma: Restore needed argument to ib_post_send
    
    The call in svc_rdma_post_chunk_ctxt() does actually use bad_wr.
    
    Fixes: ed288d74a9e5 ("net/xprtrdma: Simplify ib_post_(send|recv|srq_recv)() calls")
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Bart Van Assche <bart.vanassche@wdc.com>
    Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

diff --git a/net/sunrpc/xprtrdma/svc_rdma_rw.c b/net/sunrpc/xprtrdma/svc_rdma_rw.c
index 80975427f5235f..ce3ea841970483 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_rw.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_rw.c
@@ -329,7 +329,7 @@ static int svc_rdma_post_chunk_ctxt(struct svc_rdma_chunk_ctxt *cc)
 	do {
 		if (atomic_sub_return(cc->cc_sqecount,
 				      &rdma->sc_sq_avail) > 0) {
-			ret = ib_post_send(rdma->sc_qp, first_wr, NULL);
+			ret = ib_post_send(rdma->sc_qp, first_wr, &bad_wr);
 			trace_svcrdma_post_rw(&cc->cc_cqe,
 					      cc->cc_sqecount, ret);
 			if (ret)
