From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build warnings after merge of the clk tree
Date: Wed, 21 Jun 2017 09:13:39 -0700
Message-ID: <20170621161339.GX4493@codeaurora.org>
References: <20170621093423.695ba952@canb.auug.org.au>
 <CAALAos-MZxMWS9yePDf0RZvp7FMpkqGAMrvncRq9qziPDewwkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAALAos-MZxMWS9yePDf0RZvp7FMpkqGAMrvncRq9qziPDewwkQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@baylibre.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>
List-Id: linux-next.vger.kernel.org

On 06/21, Anup Patel wrote:
> On Wed, Jun 21, 2017 at 5:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> > produced these warnings:
> >
> > WARNING: vmlinux.o(.text+0x819309): Section mismatch in reference from the function sr_genpll0_clk_init() to the function .init.text:iproc_pll_clk_setup()
> > The function sr_genpll0_clk_init() references
> > the function __init iproc_pll_clk_setup().
> > This is often because sr_genpll0_clk_init lacks a __init
> > annotation or the annotation of iproc_pll_clk_setup is wrong.
> >
> > Introduced by commit
> >
> >   654cdd3229cd ("clk: bcm: Add clocks for Stingray SOC")

Thanks for the report!

> 
> All sr_xxx_init() had __init attribute but we had removed it based on
> review comments.
> 
> The iproc_pll_xxx() APIs are shared across various clk drivers of iproc SoCs.
> 
> I suggest we bring back __init attribute for all sr_xxx_init() in sr_clk.c ??
> 

No. We should remove __init from the iproc_pll_clk_setup()
function.

---8<---
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: iproc: Remove __init marking on iproc_pll_clk_setup()

Now that this function is called from driver probe routines, it
needs to drop the __init marking because it isn't just called
from init code.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sandeep Tripathy <sandeep.tripathy@broadcom.com>
Cc: Anup Patel <anup.patel@broadcom.com>
Cc: Ray Jui <ray.jui@broadcom.com>
Cc: Scott Branden <scott.branden@broadcom.com>
Fixes: 654cdd3229cd ("clk: bcm: Add clocks for Stingray SOC")
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/bcm/clk-iproc-pll.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
index 2d61893da024..375d8dd80d45 100644
--- a/drivers/clk/bcm/clk-iproc-pll.c
+++ b/drivers/clk/bcm/clk-iproc-pll.c
@@ -617,12 +617,12 @@ static void iproc_pll_sw_cfg(struct iproc_pll *pll)
 	}
 }
 
-void __init iproc_pll_clk_setup(struct device_node *node,
-				const struct iproc_pll_ctrl *pll_ctrl,
-				const struct iproc_pll_vco_param *vco,
-				unsigned int num_vco_entries,
-				const struct iproc_clk_ctrl *clk_ctrl,
-				unsigned int num_clks)
+void iproc_pll_clk_setup(struct device_node *node,
+			 const struct iproc_pll_ctrl *pll_ctrl,
+			 const struct iproc_pll_vco_param *vco,
+			 unsigned int num_vco_entries,
+			 const struct iproc_clk_ctrl *clk_ctrl,
+			 unsigned int num_clks)
 {
 	int i, ret;
 	struct iproc_pll *pll;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
