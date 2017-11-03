From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the gpio tree
Date: Fri, 3 Nov 2017 16:37:24 +1100
Message-ID: <20171103163724.73fe268e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58555 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750769AbdKCFh1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 01:37:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

After merging the gpio tree, yesterday's linux-next build (arm
multi_v7_defconfig) produced these warnings:

arch/arm/boot/dts/bcm2835-rpi-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2835-rpi-b-rev2.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2835-rpi-a.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2835-rpi-b-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2835-rpi-a-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2836-rpi-2-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2837-rpi-3-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2835-rpi-zero.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/bcm2835-rpi-zero-w.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property): Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000

and many, many more.

I have no idea what caused this.

-- 
Cheers,
Stephen Rothwell
