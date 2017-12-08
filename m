From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the vfs tree
Date: Fri, 8 Dec 2017 11:33:21 +1100
Message-ID: <20171208113321.71dc45b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58877 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750993AbdLHAdY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Dec 2017 19:33:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ursula Braun <ubraun@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/smc/smc_clc.c

between commit:

  d63d271ce2b5 ("smc: switch to sock_recvmsg()")

from the vfs tree and commit:

  e7b7a64a8493 ("smc: support variable CLC proposal messages")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/smc/smc_clc.c
index 511548085d16,abf7ceb6690b..000000000000
--- a/net/smc/smc_clc.c
+++ b/net/smc/smc_clc.c
@@@ -86,12 -129,13 +132,12 @@@ int smc_clc_wait_msg(struct smc_sock *s
  	}
  
  	/* receive the complete CLC message */
 -	vec.iov_base = buf;
 -	vec.iov_len = buflen;
  	memset(&msg, 0, sizeof(struct msghdr));
 +	iov_iter_kvec(&msg.msg_iter, READ | ITER_KVEC, &vec, 1, buflen);
  	krflags = MSG_WAITALL;
  	smc->clcsock->sk->sk_rcvtimeo = CLC_WAIT_TIME;
 -	len = kernel_recvmsg(smc->clcsock, &msg, &vec, 1, datlen, krflags);
 +	len = sock_recvmsg(smc->clcsock, &msg, krflags);
- 	if (len < datlen) {
+ 	if (len < datlen || !smc_clc_msg_hdr_valid(clcm)) {
  		smc->sk.sk_err = EPROTO;
  		reason_code = -EPROTO;
  		goto out;
