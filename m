From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the vfs tree
Date: Wed, 10 Jan 2018 10:34:24 +1100
Message-ID: <20180110103424.5312334f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jon Maloy <jon.maloy@ericsson.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/tipc/socket.c

between commit:

  ade994f4f6c8 ("net: annotate ->poll() instances")

from the vfs tree and commit:

  eb929a91b213 ("tipc: improve poll() for group member socket")

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
index 2aa46e8cd8fe,1f236271766c..000000000000
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@@ -715,8 -715,8 +715,8 @@@ static __poll_t tipc_poll(struct file *
  {
  	struct sock *sk = sock->sk;
  	struct tipc_sock *tsk = tipc_sk(sk);
- 	struct tipc_group *grp = tsk->group;
+ 	struct tipc_group *grp;
 -	u32 revents = 0;
 +	__poll_t revents = 0;
  
  	sock_poll_wait(file, sk_sleep(sk), wait);
  
