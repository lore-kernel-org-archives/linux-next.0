From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the drm-panel
 tree
Date: Mon, 12 Dec 2016 13:18:58 +1100
Message-ID: <20161212131858.117b1484@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40361 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751646AbcLLCTA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 21:19:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>, Nathan Sullivan <nathan.sullivan@ni.com>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  05ec0e4501f7 ("drm/panel: simple: Add NVD9128 as a simple panel")

from the drm-panel tree and commit:

  1a85ff590440 ("devicetree: add vendor prefix for National Instruments")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

N.B. "nvd" was added in the wrong place, I think, so I moved it.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index 540cd9007be1,ffc8689abfd3..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -188,12 -190,11 +192,13 @@@ neonode		Neonode Inc
  netgear	NETGEAR
  netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
  netxeon		Shenzhen Netxeon Technology CO., LTD
 +nexbox	Nexbox
  newhaven	Newhaven Display International
- nvd	New Vision Display
+ ni	National Instruments
  nintendo	Nintendo
  nokia	Nokia
  nuvoton	Nuvoton Technology Corporation
++nvd	New Vision Display
  nvidia	NVIDIA
  nxp	NXP Semiconductors
  okaya	Okaya Electric America, Inc.
@@@ -234,9 -235,9 +240,10 @@@ realtek Realtek Semiconductor Corp
  renesas	Renesas Electronics Corporation
  richtek	Richtek Technology Corporation
  ricoh	Ricoh Co. Ltd.
 +rikomagic	Rikomagic Tech Corp. Ltd
  rockchip	Fuzhou Rockchip Electronics Co., Ltd
  samsung	Samsung Semiconductor
+ samtec	Samtec/Softing company
  sandisk	Sandisk Corporation
  sbs	Smart Battery System
  schindler	Schindler
