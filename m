From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Thu, 18 Feb 2016 10:33:03 +1100
Message-ID: <20160218103303.4cc2d25e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34991 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161139AbcBQXdG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Feb 2016 18:33:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi all,

Today's linux-next merge of the mvebu tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  efdda175c07f ("arm64: defconfig: add spmi and usb related configs")

from the arm-soc tree and commit:

  e772ca05cceb ("arm64: defconfig: enable Armada 3700 related config")

from the mvebu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index 91ae2634cae9,00a49b4e61c1..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -170,9 -169,9 +173,11 @@@ CONFIG_SND_SOC=
  CONFIG_SND_SOC_RCAR=y
  CONFIG_SND_SOC_AK4613=y
  CONFIG_USB=y
 +CONFIG_USB_OTG=y
+ CONFIG_USB_XHCI_HCD=y
+ CONFIG_USB_XHCI_PLATFORM=y
  CONFIG_USB_EHCI_HCD=y
 +CONFIG_USB_EHCI_MSM=y
  CONFIG_USB_EHCI_HCD_PLATFORM=y
  CONFIG_USB_OHCI_HCD=y
  CONFIG_USB_OHCI_HCD_PLATFORM=y
