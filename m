From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 5 Aug 2016 11:01:07 +1000
Message-ID: <20160805110107.128554cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56957 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965351AbcHEBBK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Aug 2016 21:01:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, oulijun <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Nenglong Zhao <zhaonenglong@hisilicon.com>, Sheng Li <lisheng011@huawei.com>, Kejian Yan <yankejian@huawei.com>, Yisen Zhuang <Yisen.Zhuang@huawei.com>, "David S. Miller" <davem@davemloft.net>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c

between commits:

  a24274aa5c23 ("net: hns: add dsaf misc operation method")
  f00ef863da2b ("net: hns: implement the miscellaneous operation by asl")

from Linus' tree and commit:

  c80815c0b214 ("net: hns: Add reset function support for RoCE driver")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
index 611b67b6f450,da3061cf5070..000000000000
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
@@@ -231,16 -165,43 +231,52 @@@ static void hns_dsaf_xge_core_srst_by_p
  	dsaf_write_sub(dsaf_dev, reg_addr, reg_val);
  }
  
+ /**
+  * hns_dsaf_srst_chns - reset dsaf channels
+  * @dsaf_dev: dsaf device struct pointer
+  * @msk: xbar channels mask value:
+  * bit0-5 for xge0-5
+  * bit6-11 for ppe0-5
+  * bit12-17 for roce0-5
+  * bit18-19 for com/dfx
+  * @enable: false - request reset , true - drop reset
+  */
+ void hns_dsaf_srst_chns(struct dsaf_device *dsaf_dev, u32 msk, bool enable)
+ {
+ 	u32 reg_addr;
+ 
+ 	if (!enable)
+ 		reg_addr = DSAF_SUB_SC_DSAF_RESET_REQ_REG;
+ 	else
+ 		reg_addr = DSAF_SUB_SC_DSAF_RESET_DREQ_REG;
+ 
+ 	dsaf_write_sub(dsaf_dev, reg_addr, msk);
+ }
+ 
+ void hns_dsaf_roce_srst(struct dsaf_device *dsaf_dev, bool enable)
+ {
+ 	if (!enable) {
+ 		dsaf_write_sub(dsaf_dev, DSAF_SUB_SC_ROCEE_RESET_REQ_REG, 1);
+ 	} else {
+ 		dsaf_write_sub(dsaf_dev,
+ 			       DSAF_SUB_SC_ROCEE_CLK_DIS_REG, 1);
+ 		dsaf_write_sub(dsaf_dev,
+ 			       DSAF_SUB_SC_ROCEE_RESET_DREQ_REG, 1);
+ 		msleep(20);
+ 		dsaf_write_sub(dsaf_dev, DSAF_SUB_SC_ROCEE_CLK_EN_REG, 1);
+ 	}
+ }
+ 
 -void hns_dsaf_ge_srst_by_port(struct dsaf_device *dsaf_dev, u32 port, u32 val)
 +static void
 +hns_dsaf_xge_core_srst_by_port_acpi(struct dsaf_device *dsaf_dev,
 +				    u32 port, bool dereset)
 +{
 +	hns_dsaf_acpi_srst_by_port(dsaf_dev, HNS_OP_RESET_FUNC,
 +				   HNS_XGE_CORE_RESET_FUNC, port, dereset);
 +}
 +
 +static void hns_dsaf_ge_srst_by_port(struct dsaf_device *dsaf_dev, u32 port,
 +				     bool dereset)
  {
  	u32 reg_val_1;
  	u32 reg_val_2;
