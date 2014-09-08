From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request to add linux-kselftest to linux-next
Date: Tue, 9 Sep 2014 08:58:41 +1000
Message-ID: <20140909085841.2ec2871e@canb.auug.org.au>
References: <540DC2BD.7030506@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3pRDc6lJ=X1CNEYVfBqVhMc"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55207 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755023AbaIHW6z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Sep 2014 18:58:55 -0400
In-Reply-To: <540DC2BD.7030506@osg.samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, greg Kroah-Hartman <gregkh@linuxfoundation.org>, fengguang.wu@intel.com

--Sig_/3pRDc6lJ=X1CNEYVfBqVhMc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Mon, 08 Sep 2014 08:52:45 -0600 Shuah Khan <shuahkh@osg.samsung.com> wro=
te:
>
> Could you please add linux-kselftest tree to linux-next.
> I plan to maintain two branches:
>=20
> linux-kselftest for Kselftest Framework
>=20
> fixes - Contains changes intended for merging before the next major
>         release, including fixes for regressions introduced during
>         merge window.
> next  - Contains changes intended for merging during the next merge
>         window between a major release and -rc1.

Umm, a git URL would be helpful :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/3pRDc6lJ=X1CNEYVfBqVhMc
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUDjStAAoJEMDTa8Ir7ZwVwMoQAJWFVdIBcQ/GGdl1HpoW9PDC
cRQRCTGGWhcBBrvnhFsuw8996ciFCd/X5LuVOlEe4tNCrRriQwBOMU4IXMUBJVlM
yev1AOhZPofdrZTeukUJJqrRLHyLqmq5fitZIiXcGgLBGOh7Y9+fP2ySKM55+KV7
dAuqcJQrTEGNlHSMN75r+sUeKDij1amL0/fbl0uFOy9gklBeuOgewER1DPtLvw+F
mVYmImFRQGpF0ccMhO9qyx8gtBqMX1inyRRr6kX3yi+ke58h1S+I5AnM8rSoTXGk
eUvwCitfwIc60h48eT+GbSvAC5c/e19VNbnTNnJrwax+hITzHBYwB2T/3TTDORia
3un0D9J22u4qFmbgCpdFlOMqYBe1sTrJnlxVfzJzqHfJDI5HsmLHQnbPNu2SDMUt
yUya8kzeyN1cFzG4f7KZvxjNQRewUezoqfoxfax/DmFXCj7FMmrrzxb+mNsRZN3r
wC2fR1Ykrwd4y/EACR3wy3AkR1nSkktcB9MyzxnqCfZBX/0btvJCbtPTOIopNHOD
8iAkBdgJwI3hmubnfb9cxTasdUkoD6IGS9e1XWhT6WcJnaO5KyttlikDQ+yVL8Sq
naG+uX8VXT7KoX7AG4pvGmeXu58I4DpCmkpfTHLz9NxVWC3Z1Q39Qc23B7KZ+e69
nwEzsc6wbAsaAcOW5hsa
=TmWw
-----END PGP SIGNATURE-----

--Sig_/3pRDc6lJ=X1CNEYVfBqVhMc--
