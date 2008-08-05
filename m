From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Wed, 6 Aug 2008 00:20:26 +1000
Message-ID: <20080806002026.47702e20.sfr@canb.auug.org.au>
References: <20080805140257.7fad0dc0.sfr@canb.auug.org.au>
	<20080805053628.GA19574@gondor.apana.org.au>
	<20080805233300.e98f9da5.sfr@canb.auug.org.au>
	<20080805140503.GB23405@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_Aug_2008_00_20_26_+1000_JFK/n/oQr=k2hYYx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60898 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755700AbYHEOtc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 10:49:32 -0400
In-Reply-To: <20080805140503.GB23405@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__6_Aug_2008_00_20_26_+1000_JFK/n/oQr=k2hYYx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Tue, 5 Aug 2008 22:05:04 +0800 Herbert Xu <herbert@gondor.apana.org.au> =
wrote:
>
> On Tue, Aug 05, 2008 at 11:33:00PM +1000, Stephen Rothwell wrote:
> >=20
> > I am guessing that will help with these errors as well?
> >=20
> > testmgr.c:(.text+0x6404): undefined reference to `.crypto_alloc_ablkcip=
her
>=20
> Yes it should.

Great, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_Aug_2008_00_20_26_+1000_JFK/n/oQr=k2hYYx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiYYasACgkQjjKRsyhoI8yAbgCZAQ+NrXwYww2OvTNTd4lwTYQE
Z6MAoKCFPiXDtgyniDcEaC2DTFvKUMY+
=58dJ
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Aug_2008_00_20_26_+1000_JFK/n/oQr=k2hYYx--
