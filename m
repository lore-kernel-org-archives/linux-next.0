From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the staging tree with the imx-mxs
 tree
Date: Wed, 8 May 2019 13:47:27 +1000
Message-ID: <20190508134727.7ca1e390@canb.auug.org.au>
References: <20190412144921.3a152478@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1V1pV/zWcmIrgm4TFnFSdey"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412144921.3a152478@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Greg KH <greg@kroah.com>, Shawn Guo <shawn.guo@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Yang <decatf@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jonathan =?UTF-8?B?TmV1c2Now6Rm?= =?UTF-8?B?ZXI=?= <j.neuschaefer@gmx.net>
List-Id: linux-next.vger.kernel.org

--Sig_/1V1pV/zWcmIrgm4TFnFSdey
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Apr 2019 14:49:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the staging tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/vendor-prefixes.txt
>=20
> between commit:
>=20
>   189733b0a7e4 ("dt-bindings: Add vendor prefix for Rakuten Kobo, Inc.")
>=20
> from the imx-mxs tree and commit:
>=20
>   2e5cee6c7622 ("dt-bindings: Add vendor prefix for Kionix, Inc.")
>=20
> from the staging tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
> index 5f2b185a04e6,93753f447c20..000000000000
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@@ -211,7 -210,7 +211,8 @@@ kiebackpeter    Kieback & Peter Gmb
>   kinetic Kinetic Technologies
>   kingdisplay	King & Display Technology Co., Ltd.
>   kingnovel	Kingnovel Technology Co., Ltd.
> + kionix	Kionix, Inc.
>  +kobo	Rakuten Kobo Inc.
>   koe	Kaohsiung Opto-Electronics Inc.
>   kosagi	Sutajio Ko-Usagi PTE Ltd.
>   kyo	Kyocera Corporation

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1V1pV/zWcmIrgm4TFnFSdey
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzSUU8ACgkQAVBC80lX
0GwTPAf/cEVh8RWOnK9RS7qYoOibc+Ud8w21cx8GoOiArXG95S1BgP+HUekZMS/m
gy13w1VEqM1L391i+d/lrBuEQR/D5dQCXkIF6DzjBqmSUZ2X4D6y9IIFjXde5+21
Fq8F0bShBq8XI4zKbaUGT5BpbEEq/7Z+PU63tPL5jTuIdoA4666mMRUFPhcCoHj4
ajRQORxZsEdLv6MsTGQ6LLnTcfzbPMKT/B2M/aPFp8NolcHIvSt2lk+HjOeD5MJo
ltA1BMt6Tgwguq44o9IZIMGrfMwVYZNm3fY55zc8+jINsj+Ysb7gsLGAjwbEvQHB
PSrvQNm/09DAs+ziVUOhB3/uGroe9A==
=cTIR
-----END PGP SIGNATURE-----

--Sig_/1V1pV/zWcmIrgm4TFnFSdey--
