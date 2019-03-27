From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Mar 27 (sunxi clk & mfd)
Date: Thu, 28 Mar 2019 09:50:36 +1100
Message-ID: <20190328095036.734adbba@canb.auug.org.au>
References: <20190327145020.2fff97b8@canb.auug.org.au>
        <641a04ec-e2e6-4263-e77e-d272058c18c9@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2y/24R9YVVfBV9eqHhF_Wc6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <641a04ec-e2e6-4263-e77e-d272058c18c9@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

--Sig_/2y/24R9YVVfBV9eqHhF_Wc6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Wed, 27 Mar 2019 13:32:26 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on i386 or x86_64:
>=20
> WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
>   Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
>   Selected by [y]:
>   - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]

I reported that a while ago (x86_64 allmodconfig after the merge of the
sunxi tree).  Apparently there is a fix out there but it hasn't been
applied yet.

--=20
Cheers,
Stephen Rothwell

--Sig_/2y/24R9YVVfBV9eqHhF_Wc6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyb/jwACgkQAVBC80lX
0GzdgAf/eg6NADI6jioc4zeNy5YSgPVmpghBePkE3A5Lh5xJ1Ity/75vcaInsOLJ
O8fQm4eOn/mSyY+s18/nYXH2naVn5/ea5uszxmf9FplhaKRN14wvYiiupxg0J+mQ
Fk2EzLCuaxSTorJbdJ4i/nRmeKL4Sje+iMh9ZuNgom8MwFysfeSyTp0hoP8eWIvy
HvP5TBqDA9kLgV2XzKZ2erEELHDPp4Y5bRA5pgvEAFtQqZ/k2m+pEZ221fb62LMI
6iSf1wxAJLYHNCdDa0wTCUWO0QZ8yIqCnC5moybhF+taU0dJDR49wG7WcCeYGiIA
DwezjKXBNwRQjSmsnel1bm53HhXziw==
=Ibwh
-----END PGP SIGNATURE-----

--Sig_/2y/24R9YVVfBV9eqHhF_Wc6--
