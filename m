From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the sunxi tree
Date: Tue, 26 Mar 2019 10:09:15 +1100
Message-ID: <20190326100915.3fa1e4c9@canb.auug.org.au>
References: <20190322083048.31084cf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pvwmm6ZF_4jU5TbsfpW_ZHY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322083048.31084cf8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/pvwmm6ZF_4jU5TbsfpW_ZHY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 22 Mar 2019 08:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the sunxi tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
>   Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
>   Selected by [y]:
>   - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
>   - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
>=20
> WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
>   Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
>   Selected by [y]:
>   - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
>   - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
>=20
> WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
>   Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
>   Selected by [y]:
>   - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
>   - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
>=20
> Introduced by commit
>=20
>   49c726d55c1b ("clk: sunxi: Add Kconfig options")

I am still getting these warnings.
--=20
Cheers,
Stephen Rothwell

--Sig_/pvwmm6ZF_4jU5TbsfpW_ZHY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyZX5sACgkQAVBC80lX
0GwnGgf+KwAyLaPwYOeCFAgclduhWxifha74rgF0zp7ZnaP0aTrn5etAgo+5bTpL
pwJReMsMcPy4NT1Y6RE95UtDplZMLM1w2OwRteXO6zKFF3Kef9eQx2IM9Q5UhPVb
SV0eJyXJcLMT9N8DDybNRhwm7H63zNLXzCe8Zffqj8QvCnZTXUybYKRwGuz+YlaV
I4gmgKNv1rqsKRDohjUfUFfgJVUg1dwe/8Ht//lh4k7t67NITsBuIwY4oE7FQsDb
ohj8UP0jmRyzPsOjn5zsrByeLXkt5XHCVMSOGxnHtFvRwrgnebnnIQGsv6AQ7PC/
PaTm4guRvda4bzrPSnbiDoA/UFZZIA==
=s4Bq
-----END PGP SIGNATURE-----

--Sig_/pvwmm6ZF_4jU5TbsfpW_ZHY--
