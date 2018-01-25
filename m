From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the net-next tree
Date: Thu, 25 Jan 2018 21:52:19 +1100
Message-ID: <20180125215219.3ec88466@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Atul Gupta <atul.gupta@chelsio.com>, Ganesh Goudar <ganeshgr@chelsio.com>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  drivers/net/ethernet/chelsio/cxgb4/cxgb4.h

between commit:

  9d5fd927d20b ("cxgb4/cxgb4vf: add support for ndo_set_vf_vlan")

from the net-next tree and commit:

  a6ec572bfa7d ("cxgb4: Add support for Inline IPSec Tx")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
index 429467364219,c48a7521d63e..000000000000
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
@@@ -1739,6 -1713,14 +1752,16 @@@ void free_rspq_fl(struct adapter *adap
  void free_tx_desc(struct adapter *adap, struct sge_txq *q,
  		  unsigned int n, bool unmap);
  void free_txq(struct adapter *adap, struct sge_txq *q);
 +int t4_set_vlan_acl(struct adapter *adap, unsigned int mbox, unsigned int vf,
 +		    u16 vlan);
+ void cxgb4_reclaim_completed_tx(struct adapter *adap,
+ 				struct sge_txq *q, bool unmap);
+ int cxgb4_map_skb(struct device *dev, const struct sk_buff *skb,
+ 		  dma_addr_t *addr);
+ void cxgb4_inline_tx_skb(const struct sk_buff *skb, const struct sge_txq *q,
+ 			 void *pos);
+ void cxgb4_write_sgl(const struct sk_buff *skb, struct sge_txq *q,
+ 		     struct ulptx_sgl *sgl, u64 *end, unsigned int start,
+ 		     const dma_addr_t *addr);
+ void cxgb4_ring_tx_db(struct adapter *adap, struct sge_txq *q, int n);
  #endif /* __CXGB4_H__ */
