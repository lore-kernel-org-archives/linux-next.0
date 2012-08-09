From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Resurrecting linux-next tree for Xtensa
Date: Fri, 10 Aug 2012 08:53:12 +1000
Message-ID: <20120810085312.bb2f1df59f6f4dfdca965de1@canb.auug.org.au>
References: <50232D57.4000205@zankel.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__10_Aug_2012_08_53_12_+1000_YVBUAJxvwN_wR+94"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:46085 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759874Ab2HIWxW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Aug 2012 18:53:22 -0400
In-Reply-To: <50232D57.4000205@zankel.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Zankel <chris@zankel.net>
Cc: linux-next@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>

--Signature=_Fri__10_Aug_2012_08_53_12_+1000_YVBUAJxvwN_wR+94
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris.

On Wed, 08 Aug 2012 20:24:07 -0700 Chris Zankel <chris@zankel.net> wrote:
>
> I was wondering and hoping you could add the Xtensa 'next' tree back to=20
> the linux-next tree?
>=20
> It's currently on github (at least, until I get my access back to=20
> kernel.org)

You will need to get a gpg key signed so that you can move this tree to
kernel.org or to signed tags when you ask Linus to pull your tree.

> git://github.com/czankel/xtensa-linux.git#for-next
                                               ^
I used "for_next".  Just to be sure, that branch is currently empty,
right?

> It's been outdated for some time now and with more help we want to bring=
=20
> it up-to-date again.

Sounds like a good plan!

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

--Signature=_Fri__10_Aug_2012_08_53_12_+1000_YVBUAJxvwN_wR+94
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQJD9YAAoJEECxmPOUX5FEn9QP/Rkw0Pbhbz/O83P58Y+TTOb0
pF1ac9VAxwDhoy0xr1Aig/rh2bdYyO32j4Ld/3SzAVq0pnCD9Jgu3+2OLL0Fpdx+
kMnb6IKFaJVns/WiBkb9ISi0hi1BNYBt1/ZN2u5dZCZTRidipOCZ4gTKjJKadbDi
ONw3Gqma2dA/kbivK+p5kYUZja4iBsNzSsDCbZLOolNopCuSHFrVUgebGAU59VZm
YtZCd/sU2Y5/kR9rW/MxGOhjUoMhNBB+VV6rSIHR2mjNAvGT/WgQ/9CjERfF4xi/
Tfu2OWzfviW5+wgjwLA2OtCrYV4MqYP8qu+HOZcQj22o/dhnDEkhxgGYKy8+M482
kTlWcGl8Spshk0QUT4MP6b3uhxU9JRzPcfK6YtbhO2hMKRs3deNzxbGruW4jpDTb
KOdnqLl7TVGwsrnVPyWN1Er3qqhc7/x8Ys4a83vZ0SgtiULj8tCGAJkSE/dQRYuX
WY3wnlpFRo1ASgsrV1UfPkhapGEUwgsTSAvIy+RtMglSI8h2Gg8Q1ps25u60v/W+
12rRQ1QGPdd+9/VE3XNR2euCIGoUrhsk4sAZlIWJJiiyowOhbFRzg7bfiZy7BLzm
vw6C0Jp84ZM8f3Rt56/pleYV+Sk6xgPadvRlO6az/C5D6rpbkC5z3+H5mdbKgGnk
fKi8JK7HnkTM0oB9Er0F
=oL92
-----END PGP SIGNATURE-----

--Signature=_Fri__10_Aug_2012_08_53_12_+1000_YVBUAJxvwN_wR+94--
