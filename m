From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the driver-core tree with the block
 tree
Date: Wed, 8 May 2019 12:25:55 +1000
Message-ID: <20190508122555.5a19caea@canb.auug.org.au>
References: <20190429152400.281524b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sG1p5DfB8xej.FWcOlfTBd1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429152400.281524b7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Weiping Zhang <zhangweiping@didiglobal.com>, Kimberly Brown <kimbrownkd@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/sG1p5DfB8xej.FWcOlfTBd1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Apr 2019 15:24:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   block/blk-sysfs.c
>=20
> between commit:
>=20
>   4d25339e32a1 ("block: don't show io_timeout if driver has no timeout ha=
ndler")
>=20
> from the block tree and commit:
>=20
>   800f5aa1e7e1 ("block: Replace all ktype default_attrs with groups")
>=20
> from the driver-core tree.
>=20
> I fixed it up (the former stopped using the default_attrs field, so I
> effectively reverted the latter changes to this file) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

This is now a conflict between the block tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sG1p5DfB8xej.FWcOlfTBd1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzSPjMACgkQAVBC80lX
0GwAEAf/SjDtNontGW8LP5x1OAJL84WrzeYNaYdts/lHIN/ghgAORAkAAH2mwzIY
4I8ap8JLMAtJojTqCHYpumc3Yh8czWrVJtFTbH04DXogOmFumiT4SM3AmrsaW2Fw
e9i5a6fgto+C6Pk6HtJq0aetxYDWPdB/8XWjouBC8AdWHNNFyLYUzq5vG99FfxI8
F/dgWy4HlrFxpXhP4Mw3H4NhtWchoR7RslVc+l+WMuT3lp5GtwGwFfpQCeaRKDuk
WcILyLcXPV5UWTjV444E8OMz0JyQ+r6Es6hzJz83L460+79KxdV0DzZMLuBh3Azq
Gtyu0mhw1sxViglZ6RqTWX+g6PvSQw==
=PMNA
-----END PGP SIGNATURE-----

--Sig_/sG1p5DfB8xej.FWcOlfTBd1--
