From: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH next-20090316] sunrpc: fix build breakage
Date: Mon, 16 Mar 2009 15:51:40 +0300
Message-ID: <20090316125140.GA3095@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org
List-Id: linux-next.vger.kernel.org

net/sunrpc/clnt.c: In function 'call_bind_status':
net/sunrpc/clnt.c:994: error: 'struct rpc_task' has no member named
'tk_pid'
net/sunrpc/clnt.c: In function 'call_connect_status':
net/sunrpc/clnt.c:1051: error: 'struct rpc_task' has no member named
'tk_pid'

rpc_task has tk_pid if RPC_DEBUG is defined.

Signed-off-by: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

 net/sunrpc/clnt.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index efd0c7b..68cb91a 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -990,7 +990,7 @@ call_bind_status(struct rpc_task *task)
 		return;
 	default:
 		if (net_ratelimit())
-			printk("RPC: %5u unrecognized rpcbind error (%d)\n",
+			dprintk("RPC: %5u unrecognized rpcbind error (%d)\n",
 					task->tk_pid, -task->tk_status);
 	}
 
@@ -1047,7 +1047,7 @@ call_connect_status(struct rpc_task *task)
 		break;
 	default:
 		if (net_ratelimit())
-			printk("RPC: %5u unrecognized connect error (%d)\n",
+			dprintk("RPC: %5u unrecognized connect error (%d)\n",
 					task->tk_pid, status);
 		rpc_exit(task, -EIO);
 	}
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
