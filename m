From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: build warning after merge of the sunxi tree
Date: Fri, 22 Mar 2019 10:17:42 +0100
Message-ID: <20190322091742.rp3xfy3zkagq5xm2@flea>
References: <20190322083048.31084cf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eqavf6eufbe5o6pd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190322083048.31084cf8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chen-Yu Tsai <wens@csie.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--eqavf6eufbe5o6pd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Mar 22, 2019 at 08:30:48AM +1100, Stephen Rothwell wrote:
> Hi all,
>
> After merging the sunxi tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
>   Depends on [n]: HAS_IOMEM [=y] && ARCH_SUNXI
>   Selected by [y]:
>   - CLK_SUNXI_PRCM_SUN6I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>   - CLK_SUNXI_PRCM_SUN8I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>
> WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
>   Depends on [n]: HAS_IOMEM [=y] && ARCH_SUNXI
>   Selected by [y]:
>   - CLK_SUNXI_PRCM_SUN6I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>   - CLK_SUNXI_PRCM_SUN8I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>
> WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
>   Depends on [n]: HAS_IOMEM [=y] && ARCH_SUNXI
>   Selected by [y]:
>   - CLK_SUNXI_PRCM_SUN6I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>   - CLK_SUNXI_PRCM_SUN8I [=y] && COMMON_CLK [=y] && CLK_SUNXI [=y]
>
> Introduced by commit
>
>   49c726d55c1b ("clk: sunxi: Add Kconfig options")

I've just sent a patch fixing this:
https://lore.kernel.org/lkml/20190322091650.5189-1-maxime.ripard@bootlin.com/

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--eqavf6eufbe5o6pd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXJSoNgAKCRDj7w1vZxhR
xTP/AQCT9qnV/p0WU1E+XgnhoZmwGi8I8iTb3cNYIJP8uDIrVwEAzVYZp8iVV32G
8+rRirNgLMvQkN95O8pF8I3/p9nm1A8=
=KVIv
-----END PGP SIGNATURE-----

--eqavf6eufbe5o6pd--
