From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 5 Aug 2016 11:05:11 +1000
Message-ID: <20160805110511.7c9e9298@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Hu <xavier.huwei@huawei.com>, Nenglong Zhao <zhaonenglong@hisilicon.com>, Lijun Ou <oulijun@huawei.com>, Sheng Li <lisheng011@huawei.com>, Daode Huang <huangdaode@hisilicon.com>, Yisen Zhuang <Yisen.Zhuang@huawei.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/net/ethernet/hisilicon/hns/hns_dsaf_reg.h

between commit:

  8ae7b8a59938 ("net: hns: fix sbm default parameters config error")

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

diff --cc drivers/net/ethernet/hisilicon/hns/hns_dsaf_reg.h
index 235f74444b1d,750ab4b4d154..000000000000
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_reg.h
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_reg.h
@@@ -796,18 -800,10 +805,22 @@@
  #define DSAFV2_SBM_CFG4_RESET_BUF_NUM_NO_PFC_S 9
  #define DSAFV2_SBM_CFG4_RESET_BUF_NUM_NO_PFC_M (((1ULL << 9) - 1) << 9)
  
 +#define DSAFV2_SBM_CFG2_ROCEE_SET_BUF_NUM_S 0
 +#define DSAFV2_SBM_CFG2_ROCEE_SET_BUF_NUM_M (((1ULL << 8) - 1) << 0)
 +#define DSAFV2_SBM_CFG2_ROCEE_RESET_BUF_NUM_S 8
 +#define DSAFV2_SBM_CFG2_ROCEE_RESET_BUF_NUM_M (((1ULL << 8) - 1) << 8)
 +
 +#define DSAFV2_SBM_CFG2_PPE_SET_BUF_NUM_S (0)
 +#define DSAFV2_SBM_CFG2_PPE_SET_BUF_NUM_M (((1ULL << 6) - 1) << 0)
 +#define DSAFV2_SBM_CFG2_PPE_RESET_BUF_NUM_S (6)
 +#define DSAFV2_SBM_CFG2_PPE_RESET_BUF_NUM_M (((1ULL << 6) - 1) << 6)
 +#define DSAFV2_SBM_CFG2_PPE_CFG_USEFUL_NUM_S (12)
 +#define DSAFV2_SBM_CFG2_PPE_CFG_USEFUL_NUM_M (((1ULL << 6) - 1) << 12)
 +
+ #define DSAF_CHNS_MASK			0x3f000
+ #define DSAF_SBM_ROCEE_CFG_CRD_EN_B	2
+ #define SRST_TIME_INTERVAL		20
+ 
  #define DSAF_TBL_TCAM_ADDR_S 0
  #define DSAF_TBL_TCAM_ADDR_M ((1ULL << 9) - 1)
  
