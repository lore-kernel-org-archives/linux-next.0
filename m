From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 5 Aug 2016 10:52:11 +1000
Message-ID: <20160805105211.08fa5702@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daode Huang <huangdaode@hisilicon.com>, "David S. Miller" <davem@davemloft.net>, Wei Hu <xavier.huwei@huawei.com>, Lijun Ou <oulijun@huawei.com>
List-Id: linux-next.vger.kernel.org

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  MAINTAINERS

between commit:

  b30d74e42d78 ("MAINTAINERS: add maintainers for hns driver")

from Linus' tree and commit:

  dd778a9920a6 ("MAINTAINERS: Add maintainers for Hisilicon RoCE driver")

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

diff --cc MAINTAINERS
index 5a8cb5bd1f64,9d97badd2e09..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -5548,15 -5421,14 +5548,23 @@@ F:	include/uapi/linux/if_hippi.
  F:	net/802/hippi.c
  F:	drivers/net/hippi/
  
 +HISILICON NETWORK SUBSYSTEM DRIVER
 +M:	Yisen Zhuang <yisen.zhuang@huawei.com>
 +M:	Salil Mehta <salil.mehta@huawei.com>
 +L:	netdev@vger.kernel.org
 +W:	http://www.hisilicon.com
 +S:	Maintained
 +F:	drivers/net/ethernet/hisilicon/
 +F:	Documentation/devicetree/bindings/net/hisilicon*.txt
 +
+ HISILICON ROCE DRIVER
+ M:	Lijun Ou <oulijun@huawei.com>
+ M:	Wei Hu(Xavier) <xavier.huwei@huawei.com>
+ L:	linux-rdma@vger.kernel.org
+ S:	Maintained
+ F:	drivers/infiniband/hw/hns/
+ F:	Documentation/devicetree/bindings/infiniband/hisilicon-hns-roce.txt
+ 
  HISILICON SAS Controller
  M:	John Garry <john.garry@huawei.com>
  W:	http://www.hisilicon.com
