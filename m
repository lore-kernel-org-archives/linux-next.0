From: Scott Wood <scottwood@freescale.com>
Subject: Re: [BUILD FAILURE 10/12] Next April 21 : PPC64 randconfig	[drivers/mtd/maps/sbc8240.o]
Date: Tue, 21 Apr 2009 15:00:24 -0500
Message-ID: <49EE25D8.6040906@freescale.com>
References: <1240340059.9110.143.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:50330 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbZDUUBu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2009 16:01:50 -0400
In-Reply-To: <1240340059.9110.143.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: Jim Cromie <jim.cromie@gmail.com>, carolyn.j.smith@exgate.tek.com, Adrian Bunk <bunk@kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>

Subrata Modak wrote:
> This is a very old one. Doesn=C2=B4t seem to go away. Reported this e=
arlier
> on 14th April:
> http://lkml.org/lkml/2009/4/14/483,
>=20
> CC [M]  drivers/mtd/maps/sbc8240.o
> drivers/mtd/maps/sbc8240.c:31:1: warning: "DEBUG" redefined
> In file included from drivers/mtd/maps/sbc8240.c:23:
> include/linux/mtd/mtd.h:339:1: warning: this is the location of the
> previous definition
> drivers/mtd/maps/sbc8240.c: In function =E2=80=98init_sbc8240_mtd=E2=80=
=99:
> drivers/mtd/maps/sbc8240.c:172: error: =E2=80=98sbc8240_mtd=E2=80=99 =
undeclared (first
> use in this function)
> drivers/mtd/maps/sbc8240.c:172: error: (Each undeclared identifier is
> reported only once
> drivers/mtd/maps/sbc8240.c:172: error: for each function it appears i=
n.)
> drivers/mtd/maps/sbc8240.c: In function =E2=80=98cleanup_sbc8240_mtd=E2=
=80=99:
> drivers/mtd/maps/sbc8240.c:233: error: =E2=80=98sbc8240_mtd=E2=80=99 =
undeclared (first
> use in this function)

This looks like an arch/ppc orphan.  It's not enabled by any defconfig,=
=20
and it doesn't look like it does anything that physmap_of can't do.

I'd just remove it.

-Scott
