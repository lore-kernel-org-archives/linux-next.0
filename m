From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the usb tree
Date: Thu, 2 Nov 2017 15:06:12 +1100
Message-ID: <20171102150612.7bbd4cf2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750722AbdKBEGO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 00:06:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Greg,

After merging the usb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/boot/dts/stih410-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
arch/arm/boot/dts/stih407-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
arch/arm/boot/dts/stih410-b2260.dtb: Warning (gpios_property): hdmi,hpd-gpio property size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
arch/arm/boot/dts/mt2701-evb.dtb: Warning (resets_property): Missing property '#reset-cells' in node /syscon@1b000000 or bad phandle (referred from /ethernet@1b100000:resets[0])
arch/arm/boot/dts/mt7623n-rfb-nand.dtb: Warning (resets_property): Missing property '#reset-cells' in node /syscon@1b000000 or bad phandle (referred from /ethernet@1b100000:resets[0])
arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb: Warning (resets_property): Missing property '#reset-cells' in node /syscon@1b000000 or bad phandle (referred from /ethernet@1b100000:resets[0])

-- 
Cheers,
Stephen Rothwell
