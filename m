From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 omap_dss2 tree
Date: Fri, 09 Mar 2012 14:14:29 +0200
Message-ID: <1331295269.1927.54.camel@deskari>
References: <20120308170048.f1a992bca2ca2d93fa9747bf@canb.auug.org.au>
	 <201203081616.12510.arnd@arndb.de> <1331285751.1927.20.camel@deskari>
	 <201203091150.11294.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-voEfIIXlh7yz9CghUPDR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog137.obsmtp.com ([74.125.149.18]:38417 "EHLO
	psmtp.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754283Ab2CIMOe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 9 Mar 2012 07:14:34 -0500
Received: by mail-lpp01m010-f46.google.com with SMTP id j13so2192092lah.33
        for <linux-next@vger.kernel.org>; Fri, 09 Mar 2012 04:14:32 -0800 (PST)
In-Reply-To: <201203091150.11294.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>


--=-voEfIIXlh7yz9CghUPDR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-09 at 11:50 +0000, Arnd Bergmann wrote:
> On Friday 09 March 2012, Tomi Valkeinen wrote:
> > On Thu, 2012-03-08 at 16:16 +0000, Arnd Bergmann wrote:
> > > On Thursday 08 March 2012, Stephen Rothwell wrote:
> > > > Hi all,
> > > >=20
> > > > Today's linux-next merge of the arm-soc tree got a conflict in
> > > > arch/arm/mach-omap1/board-palmtt.c between commit ddba6c7f7ec6 ("OM=
AP1:
> > > > pass LCD config with omapfb_set_lcd_config()") from the omap_dss2 t=
ree
> > > > and commit 2e3ee9f45b3c ("ARM: OMAP1: Move most of plat/io.h into l=
ocal
> > > > iomap.h") from the arm-soc tree.
> > > >=20
> > > > I fixed it up (see below) and can carry the fix as necessary.
> > >=20
> > > Hi Stephen,
> > >=20
> > > Thanks for fixing up all the conflicts between arm-soc and omap_dss2.
> > > I think we should make sure they are resolved in one of the trees bef=
ore
> > > the merge window.
> >=20
> > Do we need to? The conflicts seemed to be trivial ones, like arm-soc
> > adds/removes something that just happens to be next to something else
> > that I add/remove.
> >=20
> > My understanding is that it's better to leave those conflicts than to d=
o
> > "trickery" to avoid them.
>=20
> Each of the conflicts is simple enough, but I feel it's worth resolving
> them in this case because there are a number of them. Looking at them
> again now, it's probably ok either way -- resolving them now or letting
> Linus take care of them.

Florian, do you have an opinion about this?

Merging omapdss tree through arm-soc would make sense for avoiding
conflicts, because almost every merge window there are some conflicts as
I often need to edit arch/arm files also. But I'm not sure if we have
ever had a conflict in drivers/video.

But still, it's a video driver, and fbdev tree sounds more suited for a
video driver.

So I don't know =3D). Basically it's ok for me either way also. But it
would be nice to have a standard way of doing this, instead of, for
example, merging omapdss sometimes through fbdev, sometimes through
arm-soc, depending on the conflicts...

 Tomi


--=-voEfIIXlh7yz9CghUPDR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPWfQlAAoJEPo9qoy8lh71f6AP/jhkYje7s5HBY7iJ8hCQP98Q
V/cM1m8eAAlDtyzshcmibDeEv12UOaIqsTTO+IgnUhZjstbhcYhux5AP9GyOFkJi
FV0WbtRX4CcGfoT1pF3q0kwOyjRmy5vLkxTlxm+UWVeI7hZ8XxFjy1GsL8Z1538M
MCJ+4BwymtvkufH00WjIuQOL3wWuDM07BqHXBO8x/cAI/W/ej0sCTD9OAcw/CYX7
VQAOepae9pEkKvSbhb5XzYxJ57mlbjBTVP4M9u0J2wsXYBP+eMYMskoGT6YzGFiO
CpB4igJFNmnWRwmaLcVXlGk93QuWxQl0w49aIULhOEt5fiOBtoGQJaCh20/yyyu/
dDQc9pzf5C1EW3XlHKM++MfZOcujzqWXrbytuIjBgY86b0lQrJNoGWtXy4NfNfhi
tnsWtQr5muYi1Xv0nfl2ymZuVUMJc9nn8nd1gD/FXSPAOgybTOL9iZeptRqkEnKh
n/Lme9eJWvgAusDGNs4P99LiN2ot/zsy5eAmFkEbG82fRLYaznHDABJ2CgwpGQqz
Wdarqej2PSXAlfWo3q+I3+nCTBl3P42VpI9J9WT8tea/cvsPbTf9ec9BwekiEnpc
LnLcb8j4BKkcFqiLkwmZ6O0Bxqs42hAP++UMsec6KYp8novgudaRewlrAGKs2X4R
f6WjZfEe/7vvdNT4LwXd
=cQUk
-----END PGP SIGNATURE-----

--=-voEfIIXlh7yz9CghUPDR--
