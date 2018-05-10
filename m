From: Bruce Fields <bfields@fieldses.org>
Subject: Re: linux-next: build warning after merge of the nfsd tree
Date: Thu, 10 May 2018 11:24:10 -0400
Message-ID: <20180510152410.GB29678@fieldses.org>
References: <20180510104213.31c41377@canb.auug.org.au>
 <4A03C3E8-6DBA-4FDA-A5C3-46D9E678FC02@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A03C3E8-6DBA-4FDA-A5C3-46D9E678FC02@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, May 10, 2018 at 10:21:05AM -0400, Chuck Lever wrote:
> 
> 
> > On May 9, 2018, at 8:42 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Hi all,
> > 
> > After merging the nfsd tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > net/sunrpc/xprtrdma/svc_rdma_transport.c: In function 'rdma_listen_handler':
> > net/sunrpc/xprtrdma/svc_rdma_transport.c:299:23: warning: unused variable 'rdma' [-Wunused-variable]
> >  struct svcxprt_rdma *rdma = cma_id->context;
> >                       ^~~~
> 
> Needs to be wrapped with "#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)"
> Would you like me to send a patch?

Any objection to saving the #if and just going back to writing out
cma_id->context there?

I've done that in my tree.

--b.

diff --git a/net/sunrpc/xprtrdma/svc_rdma_transport.c b/net/sunrpc/xprtrdma/svc_rdma_transport.c
index ca9001d73456..05edb18f8ca3 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_transport.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_transport.c
@@ -544,7 +544,6 @@ static int rdma_listen_handler(struct rdma_cm_id *cma_id,
 			       struct rdma_cm_event *event)
 {
 	struct sockaddr *sap = (struct sockaddr *)&cma_id->route.addr.src_addr;
-	struct svcxprt_rdma *rdma = cma_id->context;
 	int ret = 0;
 
 	trace_svcrdma_cm_event(event, sap);
@@ -552,7 +551,7 @@ static int rdma_listen_handler(struct rdma_cm_id *cma_id,
 	switch (event->event) {
 	case RDMA_CM_EVENT_CONNECT_REQUEST:
 		dprintk("svcrdma: Connect request on cma_id=%p, xprt = %p, "
-			"event = %s (%d)\n", cma_id, rdma,
+			"event = %s (%d)\n", cma_id, cma_id->context,
 			rdma_event_msg(event->event), event->event);
 		handle_connect_req(cma_id, &event->param.conn);
 		break;
