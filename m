From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Feb 2 (trace/events/sunrpc.h)
Date: Wed, 08 Feb 2012 21:37:10 -0500
Message-ID: <1328755030.2200.133.camel@gandalf.stny.rr.com>
References: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
	 <4F2AD18D.9030904@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:57625 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755114Ab2BIChM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Feb 2012 21:37:12 -0500
In-Reply-To: <4F2AD18D.9030904@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Trond Myklebust <Trond.Myklebust@netapp.com>

[ Added the person responsible for this ]

On Thu, 2012-02-02 at 10:10 -0800, Randy Dunlap wrote:
> On 02/01/2012 07:45 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20120201:
> 
> 
> 
> include/trace/events/sunrpc.h:69:1: error: implicit declaration of function 'rpc_qname'
> include/trace/events/sunrpc.h:69:1: warning: format '%s' expects type 'char *', but argument 9 has type 'int'

This has actually nothing to do with the tracepoint itself. The bug is
with the rpc_qname().

The tracepoint references rpc_qname() and in
include/linux/sunrpc/sched.h:


#ifdef RPC_DEBUG
static inline const char * rpc_qname(const struct rpc_wait_queue *q)
{
	return ((q && q->name) ? q->name : "unknown");
}
#endif

Your config had RPC_DEBUG not set, thus the function was not defined.


The below patch fixes the problem with the side effect that the trace
data will contain "unknown" for all references to rcu_qname().

-- Steve

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>


diff --git a/include/linux/sunrpc/sched.h b/include/linux/sunrpc/sched.h
index f7b2df5..c89ba95 100644
--- a/include/linux/sunrpc/sched.h
+++ b/include/linux/sunrpc/sched.h
@@ -275,6 +275,11 @@ static inline const char * rpc_qname(const struct rpc_wait_queue *q)
 {
 	return ((q && q->name) ? q->name : "unknown");
 }
+#else
+static inline const char * rpc_qname(const struct rpc_wait_queue *q)
+{
+	return "unknown";
+}
 #endif
 
 #endif /* _LINUX_SUNRPC_SCHED_H_ */
