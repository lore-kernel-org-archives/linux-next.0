From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the imx-mxs
 tree
Date: Wed, 29 Jun 2016 13:47:53 +1000
Message-ID: <20160629134753.2e340783@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58930 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752450AbcF2Drz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jun 2016 23:47:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Alexander Shiyan <shc_work@mail.ru>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  arch/arm/mach-imx/mach-imx51.c

between commit:

  463f90fa8a12 ("ARM: i.MX: Disable supervisor protect for i.MX51")

from the imx-mxs tree and commit:

  850bea2335e4 ("arm: Remove unnecessary of_platform_populate with default match table")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-imx/mach-imx51.c
index 0d9049825f0e,ec64de611d90..000000000000
--- a/arch/arm/mach-imx/mach-imx51.c
+++ b/arch/arm/mach-imx/mach-imx51.c
@@@ -52,10 -52,6 +52,8 @@@ static void __init imx51_dt_init(void
  {
  	imx51_ipu_mipi_setup();
  	imx_src_init();
 +
- 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
- 
 +	imx_aips_allow_unprivileged_access("fsl,imx51-aipstz");
  }
  
  static void __init imx51_init_late(void)
