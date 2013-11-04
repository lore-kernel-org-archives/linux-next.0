From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Mon, 4 Nov 2013 14:39:51 +1100
Message-ID: <20131104143951.1c23224cf511123517395a17@canb.auug.org.au>
References: <20131104141345.b2699b2cc7cdc347c5735c5a@canb.auug.org.au>
	<20131104032341.GD14163@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__4_Nov_2013_14_39_51_+1100_hzCyGQ9xUeyRpUA7"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131104032341.GD14163@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kmo@daterainc.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__4_Nov_2013_14_39_51_+1100_hzCyGQ9xUeyRpUA7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Sun, 3 Nov 2013 20:23:41 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>
> Don't have ppc64 cross compiling handy, but the below should do the

https://www.kernel.org/pub/tools/crosstool/

> trick.

That patch fixes it for me.

Compile-tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__4_Nov_2013_14_39_51_+1100_hzCyGQ9xUeyRpUA7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSdxcLAAoJEMDTa8Ir7ZwVEU8P/1OlkDBz4HppHAIeO3bnyjc0
/MtbBRMo8IFaTGUNeBpEB5i0Ku34fjVG93HpwBrwYzN7VlCwl7TWkKEQbDEHRza9
Xnxcc1wS1rIRoi5b+OIcUyJe4EC7Yo3ZvdLXm1h14R5vx3lsobDmz/yP9MacipZ+
PJJy11u2q4nA834hRwaga36UBXMtu1If1/M3sNpua80F1rxffna6z/IjgGr24zLE
02PeqniAFsJ1SFM39Q4p2tiOoUaZZQhEUGK4E6fp3J0Q/0g5/eqX7I1591ufr+xL
VRzrHwjlV19O7DrMzSrD10hfCVrvxmblIyiQEJm6PYqCoCceXc8QNiJHm8jd0rIB
6uXm7RicYZVMPhfxnHLQK8IsLI1F5/ajvQ5EJMI+H0wu7+6djiuIj2MR6pjAA3fb
6/bS7zpKUxGSQmlTsz7Yf3rvwPgeZWEAwZuxLamopEZDMj7LrP2GKWIijY5Dgx2n
lS2YL2A1aHfIb7hbmB8X1T1UUWSixvgmfY2679EqWk8SmrEtBC6glae6HPyU7dyq
nDm30AF+eriexSf+NEsYArVA2eqbMLRWj/1qbgMrPBvVJydOIAImN1dVMwVVma2F
hnYxTqHA6GMyNdIVbvoozHSdcw5Jf/oTkkQV60GJiRJf1tOU8ZOE9Lakdm3kRd7K
oYu9Kvy0P38IB2dMNG8Q
=/MUQ
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Nov_2013_14_39_51_+1100_hzCyGQ9xUeyRpUA7--
