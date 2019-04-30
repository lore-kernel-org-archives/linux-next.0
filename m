From: Anson Huang <anson.huang@nxp.com>
Subject: RE: linux-next: build warning after merge of the clk tree
Date: Tue, 30 Apr 2019 01:44:58 +0000
Message-ID: <DB3PR0402MB3916B4CE00494BE730C07047F53A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190430101939.76dc077c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430101939.76dc077c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

Hi, Stephen
	Thanks for notice.
	As it is intentional, I will send out a patch to add "/* fall through */" =
to avoid this build warning,

Anson.

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Tuesday, April 30, 2019 8:20 AM
> To: Mike Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Ma=
iling
> List <linux-kernel@vger.kernel.org>; Anson Huang <anson.huang@nxp.com>;
> Gustavo A. R. Silva <gustavo@embeddedor.com>; Kees Cook
> <keescook@chromium.org>
> Subject: linux-next: build warning after merge of the clk tree
>=20
> Hi all,
>=20
> After merging the clk tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/clk/imx/clk-pllv3.c:453:21: warning: this statement may fall thro=
ugh [-
> Wimplicit-fallthrough=3D]
>    pll->denom_offset =3D PLL_IMX7_DENOM_OFFSET;
>                      ^
> drivers/clk/imx/clk-pllv3.c:454:2: note: here
>   case IMX_PLLV3_AV:
>   ^~~~
>=20
> Introduced by commit
>=20
>   01d0a541ff4b ("clk: imx: correct i.MX7D AV PLL num/denom offset")
>=20
> I get this warning because I am building with -Wimplicit-fallthrough in
> attempt to catch new additions early.  The gcc warning can be turned off =
by
> adding a /* fall through */ comment at the point the fall through happens
> (assuming that the fall through is intentional).
>=20
> --
> Cheers,
> Stephen Rothwell
