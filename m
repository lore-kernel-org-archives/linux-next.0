From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 18 Jan 2018 12:09:18 +1100
Message-ID: <20180118120918.576deeb9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>, Jason Wang <jasowang@redhat.com>, Jesper Dangaard Brouer <brouer@redhat.com>, Alexei Starovoitov <ast@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/tun.c

between commit:

  4df0bfc79904 ("tun: fix a memory leak for tfile->tx_array")

from the net tree and commits:

  8bf5c4ee1889 ("tun: setup xdp_rxq_info")
  5990a30510ed ("tun/tap: use ptr_ring instead of skb_array")
  fc72d1d54dd9 ("tuntap: XDP transmission")

from the net-next tree.

I have no idea how to clean this up, so I effectively reverted the net
tree commit.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
