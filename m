From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 31 (usb/phy/phy-qcom-8x16-usb.c)
Date: Fri, 31 Jul 2015 08:59:30 -0700
Message-ID: <55BB9B62.7080301@infradead.org>
References: <20150731154700.381f57a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:33580 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752869AbbGaP7f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2015 11:59:35 -0400
In-Reply-To: <20150731154700.381f57a4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>

On 07/30/15 22:47, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150730:
> 

on i386:

when CONFIG_EXTCON=m:


drivers/built-in.o: In function `phy_8x16_remove':
phy-qcom-8x16-usb.c:(.text+0x24170a): undefined reference to `extcon_unregister_interest'
drivers/built-in.o: In function `phy_8x16_init':
phy-qcom-8x16-usb.c:(.text+0x241d32): undefined reference to `extcon_get_cable_state'
drivers/built-in.o: In function `phy_8x16_probe':
phy-qcom-8x16-usb.c:(.text+0x24223c): undefined reference to `extcon_get_edev_by_phandle'
phy-qcom-8x16-usb.c:(.text+0x2424bd): undefined reference to `extcon_register_interest'
phy-qcom-8x16-usb.c:(.text+0x242582): undefined reference to `extcon_unregister_interest'



so config USB_QCOM_8X16_PHY needs to depend on EXTCON.

-- 
~Randy
