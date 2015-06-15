From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the rdma tree with the net-next tree
Date: Mon, 15 Jun 2015 18:11:12 +1000
Message-ID: <1434355872.19706.4.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Wise <swise@opengridcomputing.com>, Hariprasad Shenai <hariprasad@chelsio.com>Hariprasad Shenai <hariprasad@chelsio.com>
List-Id: linux-next.vger.kernel.org

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c and
drivers/net/ethernet/chelsio/cxgb4/sge.c between commit b26127227677
"cxgb4/cxgb4vf: function and argument name cleanup" from the net-next tree and
commit 66cf188eba52 "cxgb4: Support for user mode bar2 mappings with T4" from
the rdma tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index 0e27f2266e6b,a9355593e65e..000000000000
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@@ -2356,8 -2352,8 +2358,8 @@@ static void process_db_drop(struct work
  		unsigned int bar2_qid;
  		int ret;
  
 -		ret = cxgb4_t4_bar2_sge_qregs(adap, qid, T4_BAR2_QTYPE_EGRESS,
 -					      0, &bar2_qoffset, &bar2_qid);
 +		ret = t4_bar2_sge_qregs(adap, qid, T4_BAR2_QTYPE_EGRESS,
- 					&bar2_qoffset, &bar2_qid);
++					0, &bar2_qoffset, &bar2_qid);
  		if (ret)
  			dev_err(adap->pdev_dev, "doorbell drop recovery: "
  				"qid=%d, pidx_inc=%d\n", qid, pidx_inc);
diff --cc drivers/net/ethernet/chelsio/cxgb4/sge.c
index 6b7c37fd0252,1b99aecde736..000000000000
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@@ -2401,8 -2429,8 +2401,8 @@@ static void __iomem *bar2_address(struc
  	u64 bar2_qoffset;
  	int ret;
  
- 	ret = t4_bar2_sge_qregs(adapter, qid, qtype,
 -	ret = cxgb4_t4_bar2_sge_qregs(adapter, qid, qtype, 0,
 -				      &bar2_qoffset, pbar2_qid);
++	ret = t4_bar2_sge_qregs(adapter, qid, qtype, 0,
 +				&bar2_qoffset, pbar2_qid);
  	if (ret)
  		return NULL;
  
