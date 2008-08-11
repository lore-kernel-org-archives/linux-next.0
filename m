From: Nico Schottelius
	<nico-linux-kernel-bugreport20080731@schottelius.org>
Subject: Re: Suspend issues on 2.6.27-rc2 (was: Heavy suspend and io
	problems in 2.6.27-rc1-00156-g94ad374)
Date: Mon, 11 Aug 2008 20:04:16 +0200
Message-ID: <20080811180416.GA22969@denkbrett.schottelius.org>
References: <20080731210507.GA6094@denkbrett.schottelius.org> <20080804233712.GA4181@denkbrett.schottelius.org> <20080807083642.GA4370@denkbrett.schottelius.org> <200808071852.11080.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755785AbYHKSEd@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200808071852.11080.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Nico Schottelius <nico-linux-kernel-bugreport20080731@schottelius.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rafael J. Wysocki [Thu, Aug 07, 2008 at 06:52:10PM +0200]:
> > The problem continues to exist:
> >=20
> > I tested it on vanilla 2.6.27-rc2: Same problem, system does not wake u=
p.
> >=20
> > Did not test the proposed patch, because it did not restore the console
> > in any tested case yet, though it at least wakes the system up.
>=20
> What graphics adapter is there in your box?

x1400, using radeonhd (also from git)

It's a T60 lenovo thinkpad.

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkigfyAACgkQuL75KpiFGIzYSgCfbp8WxUe1YmDcY7EEIyWxPM7V
UUEAoJzC8V+VUy7FWUJfgch5RwB+wi59
=65+i
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
