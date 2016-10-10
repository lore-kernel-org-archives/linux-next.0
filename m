From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Mon, 10 Oct 2016 11:54:01 +1100
Message-ID: <20161010115401.3ca0d3d3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hariprasad Shenai <hariprasad@chelsio.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c

between commit:

  0fbc81b3ad51 ("chcr/cxgb4i/cxgbit/RDMA/cxgb4: Allocate resources dynamically for all cxgb4 ULD's")

from Linus' tree and commit:

  086de575c142 ("cxgb4: advertise support for FR_NSMR_TPTE_WR")

from the rdma tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
