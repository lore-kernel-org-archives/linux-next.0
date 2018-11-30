From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] clk: imx: Use do_div in SCCG due to 64-bit divisor
Date: Fri, 30 Nov 2018 13:17:53 +1100
Message-ID: <20181130131753.7108e52a@canb.auug.org.au>
References: <20181130090325.7526140e@canb.auug.org.au>
        <1543535413-1256-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fQpTVA700y28kyP6Sg5Pi0i"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543535413-1256-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fQpTVA700y28kyP6Sg5Pi0i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Abel,

On Thu, 29 Nov 2018 23:50:22 +0000 Abel Vesa <abel.vesa@nxp.com> wrote:
>
> --- a/drivers/clk/imx/clk-frac-pll.c
> +++ b/drivers/clk/imx/clk-frac-pll.c
> @@ -116,12 +116,13 @@ static long clk_pll_round_rate(struct clk_hw *hw, u=
nsigned long rate,
>  			       unsigned long *prate)
>  {
>  	u64 parent_rate =3D *prate;
> -	u32 divff, divfi;
> -	u64 temp64;
> +	u64 divff, divfi;
> +	u64 temp64 =3D rate;
> =20
>  	parent_rate *=3D 8;
>  	rate *=3D 2;
> -	divfi =3D rate / parent_rate;
> +	do_div(temp64, parent_rate);
> +	divfi =3D temp64;

Did you mean to lose the doubling of "rate" above?

--=20
Cheers,
Stephen Rothwell

--Sig_/fQpTVA700y28kyP6Sg5Pi0i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwAndEACgkQAVBC80lX
0GwdLwf/avcEogeT2n0B9lp0v6bXI1hgabzRbQefXRPAuq7Nk5dV7LOWWdYPARR4
jN3V5m6qEqwoXLoi29W1nJ/J1bZzlydOkRtGyMAFpZ4w+a3eQdglj+mUs89yyNpA
Lan9T7MShXbp5hQJFKZwjIkpX52iJx4NJHbJfk0lDIdcuqi6zuH06OQI5DLbSmB5
DSE3ZQ7cAZJG/Y7dMNzlC6TQKRFn6CIb7ywQyCNeGmIyWNiVQmnFuBOhfTGfZPJs
XDetsQ/YbfE6a/GZDvyrmcq1MouLckW+P7FIEruOaEVQxgpprRPPhK7+uJrnV8Gi
0ofE8EWJff3lGvUnt5+V4uFE+1C8nw==
=rBNp
-----END PGP SIGNATURE-----

--Sig_/fQpTVA700y28kyP6Sg5Pi0i--
