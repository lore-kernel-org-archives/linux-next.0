From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: regmap tree for -next
Date: Sat, 16 Jul 2011 14:05:08 +1000
Message-ID: <20110716140508.bb8f01866ddede8dfc05583f@canb.auug.org.au>
References: <20110709045315.GA13233@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__16_Jul_2011_14_05_08_+1000_gHjINl+Xy5D3Xke1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59621 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750713Ab1GPEFR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 16 Jul 2011 00:05:17 -0400
In-Reply-To: <20110709045315.GA13233@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Sat__16_Jul_2011_14_05_08_+1000_gHjINl+Xy5D3Xke1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Sat, 9 Jul 2011 13:53:17 +0900 Mark Brown <broonie@opensource.wolfsonmic=
ro.com> wrote:
>
> Please consider including the tree at:
>=20
>    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-n=
ext
>=20
> in -next, providing Greg is happy with me doing this (the code currently
> sits under drivers/base).  I'm using this tree for development of a
> generic register map API for I2C and SPI type devices, factoring out a
> bunch of widely duplicated code and hopefully also providing a basis for
> further code sharing.

Given Greg's blessing, I will include this tree in the next linux-next
release.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Sat__16_Jul_2011_14_05_08_+1000_gHjINl+Xy5D3Xke1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOIQ30AAoJEDMEi1NhKgbsd0YH/2m0vtgCfQ1WLlerHbzGQR85
oQCz95RD8XY2ay0vE7pviX+YX13Mbwd+4IrMbeEXcqjroXuGCK7m9kNU1vwEmupx
795qL5o8HdilNdzURyWY4m82kyJuT+bUPQKRKgeb2q6mDQ944PLBaoRZ1mWjxvhm
VOIHJ9oiIK3adqMLa/JIS+RWZfq2UKwJ+U7QYMoLzW+pygCMiJoL82bH+P954XoD
pwmstXTt1ZglqY7OTX9/vjVvT8Pyagbx0aONMhPG+ODv7muf2JdTL+xOUJ/oQ9A/
1jhHwUEqGAHBdixzzqFP2+5l8uhC2X2z+cbepsl5p3OamWFe/+9Betmkvk1njA0=
=ZQsW
-----END PGP SIGNATURE-----

--Signature=_Sat__16_Jul_2011_14_05_08_+1000_gHjINl+Xy5D3Xke1--
