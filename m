From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ARM i.MX patches in -next
Date: Wed, 10 Feb 2010 15:40:07 +1100
Message-ID: <20100210154007.a561baa6.sfr@canb.auug.org.au>
References: <20100209104638.GH17643@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Feb_2010_15_40_07_+1100_LAo94nysNBR0O.zn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40743 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752970Ab0BJEkN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Feb 2010 23:40:13 -0500
In-Reply-To: <20100209104638.GH17643@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

--Signature=_Wed__10_Feb_2010_15_40_07_+1100_LAo94nysNBR0O.zn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sasch,

On Tue, 9 Feb 2010 11:46:39 +0100 Sascha Hauer <s.hauer@pengutronix.de> wro=
te:
>
> I am the Freescale i.MX maintainer for the kernel.
> Currently the ARM i.MX part is not in -next. Could you include
> the following branch into your -next tree?
>=20
> git://git.pengutronix.de/git/imx/linux-2.6.git for-next
>=20
> It currently has one merge conflict with next which is trivial
> to solve. I could resolve this by pulling in the ASoC branch
> into mine. Please let me know what you prefer.

I have added your tree starting today.  As you say, the conflict is
trivial and "git rerere" will remember it for me, so no problem from my
side.

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

--Signature=_Wed__10_Feb_2010_15_40_07_+1100_LAo94nysNBR0O.zn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktyOKcACgkQjjKRsyhoI8zr9QCeOUip1vhieowoC++mpXOotivV
pdQAoJdYAdcvdqggw27Koej3PVaujltG
=fjrV
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Feb_2010_15_40_07_+1100_LAo94nysNBR0O.zn--
