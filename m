From: <Nicolas.Ferre@microchip.com>
Subject: RE: linux-next: manual merge of the at91 tree with the arm-soc tree
Date: Thu, 20 Apr 2017 14:50:57 +0000
Message-ID: <56448E9475A7CD4F97A754616F76B45780C65F@CHN-SV-EXMX07.mchp-main.com>
References: <20170420083817.5a44b69c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:61207 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S946492AbdDTOvD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Apr 2017 10:51:03 -0400
In-Reply-To: <20170420083817.5a44b69c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, nicolas.ferre@atmel.com, olof@lixom.net, arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, alexandre.belloni@free-electrons.com, linux-kernel@vger.kernel.org, peda@axentia.se

> Hi Nicolas,
>
> Today's linux-next merge of the at91 tree got a conflict in:
> 
>  arch/arm/boot/dts/at91-tse850-3.dts
> between commit:
>
> e67cedc92812 ("ARM: dts: at91: add envelope detector mux to the Axentia TSE-850")
>
> from the arm-soc tree and commit:
>
>  29dd89418007 ("ARM: dts: at91: add envelope detector mux to the Axentia TSE-850")
>
> from the at91 tree.
>
> I fixed it up (I used the arm-soc tree version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Stephen,

Yes, the use of arm-soc version was the way to go. I now have updated my at91-next tree to match Alexandre's pull-request and hope it is not in conflict anymore.

Thanks for your fix.
Best regards,
