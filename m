From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Sat, 7 Jan 2012 13:48:31 +0800
Message-ID: <20120107054829.GF4790@S2101-09.ap.freescale.net>
References: <20120106120345.8157a839b1c924315d728eea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:51464 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967Ab2AGFiK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Jan 2012 00:38:10 -0500
Content-Disposition: inline
In-Reply-To: <20120106120345.8157a839b1c924315d728eea@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hui Wang <jason77.wang@gmail.com>, Russell King <rmk@arm.linux.org.uk>, Nicolas Pitre <nicolas.pitre@linaro.org>

On Fri, Jan 06, 2012 at 12:03:45PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-imx/mm-imx5.c between commit 9bdd46257ab3 ("ARM: plat-m=
xc:
> hook special idle handlers to arm_pm_idle") from the arm tree and com=
mit
> 010dc8af8f28 ("ARM: mx5: use generic irq chip pm interface for pm
> functions on") from the arm-soc tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessar=
y.

Hi Stephen,

When I was testing this fix on next-20120106, I spotted another compile
error from this file.

  CC      arch/arm/mach-imx/mm-imx5.o
arch/arm/mach-imx/mm-imx5.c:58:24: error: redefinition of =E2=80=98mx50=
_io_desc=E2=80=99
arch/arm/mach-imx/mm-imx5.c:48:24: note: previous definition of =E2=80=98=
mx50_io_desc=E2=80=99 was here
arch/arm/mach-imx/mm-imx5.c:48:24: warning: =E2=80=98mx50_io_desc=E2=80=
=99 defined but not used

The fix could just be removing the duplication.

--=20
Regards,
Shawn


8<----
@@ -53,16 +54,6 @@ static struct map_desc mx50_io_desc[] __initdata =3D=
 {
 };

 /*
- * Define the MX50 memory map.
- */
-static struct map_desc mx50_io_desc[] __initdata =3D {
-       imx_map_entry(MX50, TZIC, MT_DEVICE),
-       imx_map_entry(MX50, SPBA0, MT_DEVICE),
-       imx_map_entry(MX50, AIPS1, MT_DEVICE),
-       imx_map_entry(MX50, AIPS2, MT_DEVICE),
-};
-
-/*
