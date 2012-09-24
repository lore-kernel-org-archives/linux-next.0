From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the omap_dss2
 tree
Date: Mon, 24 Sep 2012 16:11:46 +0300
Message-ID: <1348492306.2361.48.camel@deskari>
References: <20120924195305.588277e94ce701abc5e5a6c5@canb.auug.org.au>
	 <201209241243.39462.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-M+Hqa9IPoUqJ2P+CGqU6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog126.obsmtp.com ([74.125.149.155]:44245 "EHLO
	na3sys009aog126.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752854Ab2IXNLw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Sep 2012 09:11:52 -0400
Received: by lbbgj3 with SMTP id gj3so6673888lbb.19
        for <linux-next@vger.kernel.org>; Mon, 24 Sep 2012 06:11:49 -0700 (PDT)
In-Reply-To: <201209241243.39462.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>


--=-M+Hqa9IPoUqJ2P+CGqU6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, 2012-09-24 at 12:43 +0000, Arnd Bergmann wrote:
> On Monday 24 September 2012, Stephen Rothwell wrote:
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > drivers/video/omap/lcd_ams_delta.c between commit 9586778de558 ("OMAPFB=
1:
> > remove unnecessary includes") from the  tree and commit e27e35ec735f
> > ("ARM: OMAP1: Move board-ams-delta.h from plat to mach") from the arm-s=
oc
> > tree.
> >=20
> > The latter removed a superset of the former (as far as include files is
> > concerned), so I used that and can carry the fix as necessary (no actio=
n
> > is required).
> >=20
>=20
> Hi Stephen,
>=20
> I looked at all your reports and your fixes are looking good to me.
>=20
> I'm already building all ARM defconfigs now and have fixup patches for th=
e
> instances that went wrong or introduced new warnings, I'll do that again
> on top of today's linux-next tree.
>=20
> The merge window is going to be fun with all those conflicts, but I don't
> have a better idea either.

If there's a stable branch for the OMAP platform changes, I could merge
it to omapdss tree and fix the conflicts. But if I've understood right,
Linus doesn't really like merges just for the sake of fixing conflicts.

So far all the omapdss conflicts seem trivial, though.

 Tomi


--=-M+Hqa9IPoUqJ2P+CGqU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJQYFwSAAoJEPo9qoy8lh71EJIQAKtPQwbbQhXVyqxv2aT3j0V+
CJnIpJ2Ohh3DEtq+xfVMg4Q74m4Ux/o0AP8KuYLqoOd9baS6h68iEmq7qHROziH/
TE/E5sk7RyMDLCgGZQv2f0+xSdcG37Uw6941jHd4d1Yeox7JchOOTWzgSZf6K9sj
Fq/geFm5Sru9yWkyOfQK8+ber+3mA2LzlHhBlCCTV4aQiWim+19D+xLCiqsuu7Uw
dGqR6F+QtALklNVzxJHe6RTOm7iUpPyJSRCqcrikzQk0G4jq29kezXiUUvSyoCwb
Bo61T5zwkTc/W4DAGSsYFydSznmwK23JD6oAQSvb0JKuGrjp1POrfHYwTOiVlO9N
SoH7Pa1txrVxmIKSui4v4wTy9NIBFjq62JZ8+uriQvmDbLOFHZQ8F+sQFgTBwMvX
SCheZHtEqbyNEfXiIMXxGYuUcU+UtygSGVnPHl/zGzwb9+WOKyS6Pg1C2eTXAy/6
HfF9iFGwNyeup22NtZ6jAaiiy/jZd6s4XY+QI69yfHJvgRTBmlGknXY+CprmoDWE
yGsD4GCkyBtq43AOrHwc4ufy7q83aL4JQZX4jbRbs4DdYCbw09oA0UhzqS3cShdR
GbG6Iprj9rHWHzsZuA93FVRlEGTxrdpNhzoQ8xeNuDWwfcCOV2iZJ4q8CFYS4Xgv
fijtLwYSCZlgSy+BwFyF
=5H6r
-----END PGP SIGNATURE-----

--=-M+Hqa9IPoUqJ2P+CGqU6--
