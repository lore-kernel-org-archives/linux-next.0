From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: [PATCH -next] usb: fix functionfs for CONFIG_NET disabled
Date: Thu, 13 May 2010 20:12:44 +0200
Message-ID: <op.vcnovimh7p4s8u@pikus>
References: <20100513171540.54b308d0.sfr@canb.auug.org.au>
 <20100513094112.86acf7c2.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17456 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752221Ab0EMSMR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 May 2010 14:12:17 -0400
In-reply-to: <20100513094112.86acf7c2.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 13 May 2010 18:41:12 +0200, Randy Dunlap <randy.dunlap@oracle.c=
om> wrote:
> Fix functionfs build to handle CONFIG_NET not enabled, to prevent
> these build errors:
>
> ERROR: "netif_carrier_on" [drivers/usb/gadget/g_ffs.ko] undefined!
[...]

> @@ -726,7 +726,7 @@ config USB_FUNCTIONFS
> config USB_FUNCTIONFS_ETH
>  	bool "Include CDC ECM (Ethernet) function"
> -	depends on USB_FUNCTIONFS
> +	depends on USB_FUNCTIONFS && NET
>  	help
>  	  Include an CDC ECM (Ethernet) funcion in the CDC ECM (Funcion)
>  	  Filesystem.  If you also say "y" to the RNDIS query below the
> @@ -734,7 +734,7 @@ config USB_FUNCTIONFS_ETH
> config USB_FUNCTIONFS_RNDIS
>  	bool "Include RNDIS (Ethernet) function"
> -	depends on USB_FUNCTIONFS
> +	depends on USB_FUNCTIONFS && NET
>  	help
>  	  Include an RNDIS (Ethernet) funcion in the Funcion Filesystem.
>  	  If you also say "y" to the CDC ECM query above the gadget will

Looks reasonable.  Thanks!

--=20
Best regards,                                        _     _
| Humble Liege of Serenely Enlightened Majesty of  o' \,=3D./ `o
| Computer Science,  Micha=C5=82 "mina86" Nazarewicz       (o o)
+----[mina86*mina86.com]---[mina86*jabber.org]----ooO--(_)--Ooo--
