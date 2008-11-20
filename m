From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: md tree build warnings
Date: Thu, 20 Nov 2008 16:20:30 +1100
Message-ID: <20081120162030.28cdbe3b.sfr@canb.auug.org.au>
References: <20081120161056.47b6130e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_16_20_30_+1100_SQjeIEFXTFqOZrgu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50954 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751174AbYKTFUo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 00:20:44 -0500
In-Reply-To: <20081120161056.47b6130e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, Cheng Renquan <crquan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__20_Nov_2008_16_20_30_+1100_SQjeIEFXTFqOZrgu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Thu, 20 Nov 2008 16:10:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) produced these new
> warnings:
>=20
> drivers/md/md.c: In function 'print_sb_1':
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',=
 but argument 3 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',=
 but argument 7 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',=
 but argument 8 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',=
 but argument 9 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',=
 but argument 10 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Lu' expects type 'long long unsig=
ned int', but argument 29 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',=
 but argument 30 has type '__le64'
> drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int',=
 but argument 31 has type '__le64'

This was especially noticeable because it more than doubled the number of
warnings from that build :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_16_20_30_+1100_SQjeIEFXTFqOZrgu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkk854ACgkQjjKRsyhoI8w/lgCeJZNNnM6vZLSxlCCdGpf4BFLT
kwMAn1NIE0ickjaVFf5ceP/+rBDhhyPo
=cEYC
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_16_20_30_+1100_SQjeIEFXTFqOZrgu--
