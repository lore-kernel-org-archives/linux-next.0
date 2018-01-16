From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the net-next tree
Date: Tue, 16 Jan 2018 15:51:00 +1100
Message-ID: <20180116155100.3ac44bf1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ido Schimmel <idosch@mellanox.com>, Emil S Tantilov <emils.tantilov@gmail.com>, David Ahern <dsahern@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  net/ipv6/route.c

between commit:

  6802f3adcb3f ("ipv6: Fix build with gcc-4.4.5")

from the net-next tree and patch:

  "net/ipv6/route.c: work around gcc-4.4.4 anon union initializer issue"

from the akpm tree.

I fixed it up (I just used the net-next tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
