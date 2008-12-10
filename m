From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: linux-next: Tree for December 8
Date: Wed, 10 Dec 2008 12:27:30 +0100
Message-ID: <20081210112730.GA11869@denkbrett.schottelius.org>
References: <20081208205929.366a9a01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:54760 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750761AbYLJL1h (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Dec 2008 06:27:37 -0500
Content-Disposition: inline
In-Reply-To: <20081208205929.366a9a01.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen Rothwell [Mon, Dec 08, 2008 at 08:59:29PM +1100]:
> Hi all,
>=20
> Changes since 20081204:

kryptd crashes now:

- first time cryptsetup is called I get a call trace
- after the second time cryptsetup is called, I get a call trace
  and system freeze

Error message can be found at

http://home.schottelius.org/~nico/unix/linux/kernel/next-20081208-kcrypt.jp=
eg

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk/p6IACgkQuL75KpiFGIzDUQCffOsbgyKidYSSNXLGU9x3loYB
NnsAnR962/aifvcFTfVd8hfhzC9ULjoG
=8hA7
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
