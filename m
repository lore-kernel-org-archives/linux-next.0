From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: Invalid module format (was: Re: linux-next: Tree for April 1)
Date: Wed, 1 Apr 2009 18:03:33 +0200
Message-ID: <20090401160333.GA5249@denkbrett.schottelius.org>
References: <20090401164450.f8192631.sfr@canb.auug.org.au> <20090401150928.GA5886@denkbrett.schottelius.org> <1820d69d0904010852qc07ccc7qc9cec18bcc2837bd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1763321AbZDAQED@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1820d69d0904010852qc07ccc7qc9cec18bcc2837bd@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel C <nix.or.die@googlemail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Gabriel C [Wed, Apr 01, 2009 at 05:52:59PM +0200]:
> 2009/4/1 Nico -telmich- Schottelius <nico-linux-next@schottelius.org>:
> > Stephen Rothwell [Wed, Apr 01, 2009 at 04:44:50PM +1100]:
> >> Hi all,
> >>
> >> Changes since 20090331:
> >
> > Same problem since 20090324.
>=20
> AFAIK it is since 20090218...
>=20
> >
> > arch=3Damd64, config attached, all modules have that problem.
>=20
> Disabling CONFIG_MODVERSIONS should workaround this problem.

Ahh, thanks! So I'll trac wireless-testing and iwlwifi for now, they
do have enough bugs for me :-)

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknTkFUACgkQuL75KpiFGIwvrgCgxzY/iMx6OnyiQqIiLCqvnZSR
HWoAn0GqQtsk8n0QWznqSzloybOuOu1y
=8OmZ
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
