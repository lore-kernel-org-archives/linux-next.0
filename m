From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the vfs tree
Date: Thu, 25 Jan 2018 17:41:23 +1100
Message-ID: <20180125174123.55443421@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35263 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750769AbeAYGlc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 01:41:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jon Maloy <jon.maloy@ericsson.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/tipc/socket.c

between commit:

  ade994f4f6c8 ("net: annotate ->poll() instances")

from the vfs tree and commit:

  60c253069632 ("tipc: fix race between poll() and setsockopt()")

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

diff --cc net/tipc/socket.c
index 2aa46e8cd8fe,473a096b6fba..000000000000
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@@ -715,8 -716,7 +716,7 @@@ static __poll_t tipc_poll(struct file *
  {
  	struct sock *sk = sock->sk;
  	struct tipc_sock *tsk = tipc_sk(sk);
- 	struct tipc_group *grp = tsk->group;
 -	u32 revents = 0;
 +	__poll_t revents = 0;
  
  	sock_poll_wait(file, sk_sleep(sk), wait);
  
