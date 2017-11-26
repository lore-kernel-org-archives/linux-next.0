From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with Linus' tree
Date: Mon, 27 Nov 2017 09:42:31 +1100
Message-ID: <20171127094231.2d906ff0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751858AbdKZWme (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Nov 2017 17:42:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, David Howells <dhowells@redhat.com>

Hi all,

Today's linux-next merge of the net tree got a conflict in:

  net/rxrpc/call_object.c

between commit:

  e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")

from Linus' tree and commit:

  9faaff593404 ("rxrpc: Provide a different lockdep key for call->user_mutex for kernel calls")

from the net tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/rxrpc/call_object.c
index 994dc2df57e4,7ee3d6ce5aa2..000000000000
--- a/net/rxrpc/call_object.c
+++ b/net/rxrpc/call_object.c
@@@ -114,7 -118,16 +118,15 @@@ struct rxrpc_call *rxrpc_alloc_call(str
  		goto nomem_2;
  
  	mutex_init(&call->user_mutex);
+ 
+ 	/* Prevent lockdep reporting a deadlock false positive between the afs
+ 	 * filesystem and sys_sendmsg() via the mmap sem.
+ 	 */
+ 	if (rx->sk.sk_kern_sock)
+ 		lockdep_set_class(&call->user_mutex,
+ 				  &rxrpc_call_user_mutex_lock_class_key);
+ 
 -	setup_timer(&call->timer, rxrpc_call_timer_expired,
 -		    (unsigned long)call);
 +	timer_setup(&call->timer, rxrpc_call_timer_expired, 0);
  	INIT_WORK(&call->processor, &rxrpc_process_call);
  	INIT_LIST_HEAD(&call->link);
  	INIT_LIST_HEAD(&call->chan_wait_link);
