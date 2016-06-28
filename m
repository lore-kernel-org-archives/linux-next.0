From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the arm tree
Date: Tue, 28 Jun 2016 13:13:10 +1000
Message-ID: <20160628131310.5bf6ebd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58284 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751882AbcF1DNO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2016 23:13:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Honghui Zhang <honghui.zhang@mediatek.com>

Hi Joerg,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/iommu/mtk_iommu.c

between commit:

  d267804c8457 ("iommu: convert DT component matching to component_match_add_release()")

from the arm tree and commit:

  9ca340c98c0d ("iommu/mediatek: move the common struct into header file")

from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/iommu/mtk_iommu.c
index c036df1c49ca,b12c12d74c33..000000000000
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@@ -552,30 -524,6 +524,11 @@@ static int mtk_iommu_hw_init(const stru
  	return 0;
  }
  
- static int compare_of(struct device *dev, void *data)
- {
- 	return dev->of_node == data;
- }
- 
 +static void release_of(struct device *dev, void *data)
 +{
 +	of_node_put(data);
 +}
 +
- static int mtk_iommu_bind(struct device *dev)
- {
- 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
- 
- 	return component_bind_all(dev, &data->smi_imu);
- }
- 
- static void mtk_iommu_unbind(struct device *dev)
- {
- 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
- 
- 	component_unbind_all(dev, &data->smi_imu);
- }
- 
  static const struct component_master_ops mtk_iommu_com_ops = {
  	.bind		= mtk_iommu_bind,
  	.unbind		= mtk_iommu_unbind,
