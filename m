From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] clk: imx: Use do_div in SCCG due to 64-bit divisor
Date: Thu, 29 Nov 2018 23:50:22 +0000
Message-ID: <1543535413-1256-1-git-send-email-abel.vesa@nxp.com>
References: <20181130090325.7526140e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130090325.7526140e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lucas Stach <l.stach@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: linux-next.vger.kernel.org

On arm32, a division with a 64-bit divisor has to be done through
do_div() function otherwise there is a link failure like:

drivers/clk/imx/clk-frac-pll.o: In function `clk_pll_round_rate':
clk-frac-pll.c:(.text+0x54): undefined reference to `__aeabi_uldivmod'
make: *** [Makefile:1040: vmlinux] Error 1

Fixes: 9fd680d0fafd ("clk: imx: add fractional PLL output clock")
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/clk/imx/clk-frac-pll.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-frac-pll.c b/drivers/clk/imx/clk-frac-pll.=
c
index 9872620..8b13df9 100644
--- a/drivers/clk/imx/clk-frac-pll.c
+++ b/drivers/clk/imx/clk-frac-pll.c
@@ -116,12 +116,13 @@ static long clk_pll_round_rate(struct clk_hw *hw, uns=
igned long rate,
 			       unsigned long *prate)
 {
 	u64 parent_rate =3D *prate;
-	u32 divff, divfi;
-	u64 temp64;
+	u64 divff, divfi;
+	u64 temp64 =3D rate;
=20
 	parent_rate *=3D 8;
 	rate *=3D 2;
-	divfi =3D rate / parent_rate;
+	do_div(temp64, parent_rate);
+	divfi =3D temp64;
 	temp64 =3D rate - divfi * parent_rate;
 	temp64 *=3D PLL_FRAC_DENOM;
 	do_div(temp64, parent_rate);
--=20
2.7.4
