From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the net-next
 tree
Date: Fri, 3 Nov 2017 19:07:29 +1100
Message-ID: <20171103190729.78f39937@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>, Mel Gorman <mgorman@techsingularity.net>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/net/ethernet/netronome/nfp/nfp_net_common.c

between commits:

  5f0ca2fb71e2 ("nfp: handle page allocation failures")
  790a39917183 ("nfp: switch to dev_alloc_page()")
  16f50cda06ae ("nfp: use a counter instead of log message for allocation failures")

from the net-next tree and commit:

  0432d14c45bb ("mm: remove __GFP_COLD")

from the akpm-current tree.

I fixed it up (the former series removes the use of alloc_page() from
nfp_net_napi_alloc_one()) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
