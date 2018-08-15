From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the net-next
 tree
Date: Wed, 15 Aug 2018 13:12:46 +1000
Message-ID: <20180815131246.67214bdf@canb.auug.org.au>
References: <20180730132253.33633f56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5o8nAnh_Uqd79A_ANVWGtV_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730132253.33633f56@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/5o8nAnh_Uqd79A_ANVWGtV_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Jul 2018 13:22:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the crypto tree got conflicts in:
>=20
>   drivers/net/ethernet/freescale/fec_main.c
>   drivers/net/ethernet/freescale/fs_enet/mac-fec.c
>=20
> between commits:
>=20
>   16f6e9835bcd ("net: ethernet: freescale: Use generic CRC32 implementati=
on")
>   d805f6a86829 ("net: ethernet: fs-enet: Use generic CRC32 implementation=
")
>=20
> from the net-next tree and commit:
>=20
>   5d258b48efbd ("net: ethernet: Use existing define with polynomial")
>=20
> from the crypto tree.
>=20
> I fixed it up (I used the net-next tree versions (but kept the rmeoval
> of the CRC32_POLY and FEC_CRC_POLY defines) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the crypto-current tree and the net-next
tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5o8nAnh_Uqd79A_ANVWGtV_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzmi4ACgkQAVBC80lX
0GxORQf4xlZJYAR0z3mo8Vs/gRo6knlmBG5iT9REqwMU5anuxA2VrDU6OST2/C5f
PMP1Kc5aBf5jyw3stH6ggP1uSP+YUBKR8V0fAY8iBTSbdprhWWI4oOCnyo1F6QPp
V14BSULMMEUaVsLmddio82NUhWQjNPg0YIs4LSUmrsKBTD19LeZZBGeK9O3R1Uht
VoDCf2fSsj+bIpj8KCZiTLhMWesJtbpDO7nauEw1rLHIdSzVray6isgRcRcrk4DU
Q+wl1t8iymPt5+X7UV1KJJV4idh1EMa3C4cL1xnWQm58+VGG8WG92HmqFfmeySq9
4a/lcKJholUVLzOwKSVRY5U//xyG
=xFcW
-----END PGP SIGNATURE-----

--Sig_/5o8nAnh_Uqd79A_ANVWGtV_--
