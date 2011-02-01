From: "Gadiyar, Anand" <gadiyar@ti.com>
Subject: linux-next-20100201 - OMAP2+ defconfig broken with CONFIG_DEBUG_LL
Date: Tue, 1 Feb 2011 11:09:52 +0530
Message-ID: <AANLkTinF+dpKvuRztChBM01MAjgL-foGp_yVq3uC9ghu@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog114.obsmtp.com ([74.125.149.211]:54505 "EHLO
	na3sys009aog114.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750859Ab1BAFkO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Feb 2011 00:40:14 -0500
Received: by mail-wy0-f182.google.com with SMTP id 19so6373216wyf.41
        for <linux-next@vger.kernel.org>; Mon, 31 Jan 2011 21:40:13 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

Hi all,

I tried to build linux-next as of 20100201 with omap2plus_defconfig. In addition
I turned on CONFIG_DEBUG_LL and hit the following error.

  AS      arch/arm/kernel/debug.o
arch/arm/kernel/debug.S: Assembler messages:
arch/arm/kernel/debug.S:174: Error: garbage following instruction --
`ldreq r1,=
__virt_to_phys(omap_uart_phys)'
arch/arm/kernel/debug.S:174: Error: garbage following instruction --
`ldrne r1,=
__phys_to_virt((0x80000000+0x3ffc))'
arch/arm/kernel/debug.S:174: Error: garbage following instruction --
`ldreq r2,=
__virt_to_phys(omap_uart_phys)'
arch/arm/kernel/debug.S:174: Error: garbage following instruction --
`ldreq r2,=
__virt_to_phys(omap_uart_phys)'
arch/arm/kernel/debug.S:178: Error: garbage following instruction --
`ldreq r2,=
__virt_to_phys(omap_uart_lsr)'
arch/arm/kernel/debug.S:190: Error: garbage following instruction --
`ldreq r1,=
__virt_to_phys(omap_uart_phys)'
arch/arm/kernel/debug.S:190: Error: garbage following instruction --
`ldrne r1,=
__phys_to_virt((0x80000000+0x3ffc))'
arch/arm/kernel/debug.S:190: Error: garbage following instruction --
`ldreq r2,=
__virt_to_phys(omap_uart_phys)'
arch/arm/kernel/debug.S:190: Error: garbage following instruction --
`ldreq r2,=
__virt_to_phys(omap_uart_phys)'
make[1]: *** [arch/arm/kernel/debug.o] Error 1
make: *** [arch/arm/kernel] Error 2

Will try and bisect this down later. Just reporting for now.

- Anand
