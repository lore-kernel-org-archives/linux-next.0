From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Mon, 2 Mar 2015 17:11:49 +1100
Message-ID: <20150302171149.0a62b072@canb.auug.org.au>
References: <20150302165057.29087a08@canb.auug.org.au>
	<20150302170345.742add96@notabene.brown>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6T+r98i8NNEmj_tCkKr3B3n"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150302170345.742add96@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/6T+r98i8NNEmj_tCkKr3B3n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Mon, 2 Mar 2015 17:03:45 +1100 NeilBrown <neilb@suse.de> wrote:
>
> I think
> +               bm_blocks =3D DIV_ROUND_UP(bm_blocks, 4096);
>=20
> needs DIV_ROUND_UP_SECTOR_T()

I tried that and it was not sufficient.

> The first patch you identified adds that line.  The second relocates it.

The second also changes this:

bm_blocks =3D sector_div(bitmap->mddev->resync_max_sectors, (chunksize >> 9=
));

(added by the first) to this:

bm_blocks =3D bitmap->mddev->resync_max_sectors / (bitmap->mddev->bitmap_in=
fo.chunksize >> 9);

where bitmap->mddev->resync_max_sectors is a sector_t ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/6T+r98i8NNEmj_tCkKr3B3n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU8/8rAAoJEMDTa8Ir7ZwVtK8P/iFrG9XzxkMVELK3EdSRmtxX
6l8ka+5EEN0hgQ41sN98k+97c5Mg5VPcX4b8pSyh9vvLrWt7ow1piXyLHiaPlIYW
P8dN4f5HPco2FNQRlcOVp/jt5Cgns50ypNKUIKfcuR4l1mexnok92oU1DXhj5YE3
KVNTDFk5MZUIglh6vbUqRqu3hqcJBHoyhtxHqwZktimftD0T+b1UxYyr4ASXML+n
iiMmgZk9O4t0HaGPkotC/RMV6uLnMu30hgHIFoFHRpHrNEf4plQdFaaTddr41C27
RmnScLs9no+zGdkNkNMTbE589wu7QJ0jHlKOa7U+U1MXeaKnjvOrD8XIaPmCeuL1
V/ZF+5PWyaYuO9kx+7wFS6n5r8t2PvQBhVfV6LLx/kepyOXOabGGk9WQ3OxIMFjk
LBSJNRtkfb4+3nUHk0IWMhg9kAqzPiW5Go2aLD1/R+rb4D9timc6e3A/mVw6jKrU
jBORlI8CZn6/e8Xv5RYZiv1HmrDAxZ4UZtdALBPrpQLNlhhHSDM4Mtx/n/DRg35G
mmgWrI1xwaodFiZ9P+u6CnxOn1tmIjtmh/Pd1b3nJdigPX/F6HLuV4p2VrZgjDNg
r5Ka0ZsBfLKWKiO+kw8hfVfriZ0TsJkUl31VFclqFS2ukbusnjQ9WG7QQ+jEoiS8
y3RXWEJIglQ15PayuvIC
=fY+F
-----END PGP SIGNATURE-----

--Sig_/6T+r98i8NNEmj_tCkKr3B3n--
