From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Date: Tue, 21 May 2019 12:43:22 +0800
Message-ID: <20190521044321.GX15856@dragon>
References: <20190521083756.4c8aee8a@canb.auug.org.au>
 <DB3PR0402MB39165C5944880EA0B0A37F91F5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39165C5944880EA0B0A37F91F5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>
List-Id: linux-next.vger.kernel.org

On Tue, May 21, 2019 at 02:16:47AM +0000, Anson Huang wrote:
> Hi, Stephen/Shawn
> 	I realized this issue last week when I updated my Linux-next tree (NOT sure why I did NOT meet such issue when I did the patch), so I resent the patch series of adding head file "io.h" to fix this issue, please apply below V2 patch series instead, sorry for the inconvenience.
> 
> https://patchwork.kernel.org/patch/10944681/

Okay, fixed.  Sorry for the breakage, Stephen.

Shawn

> > -----Original Message-----
> > From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> > Sent: Tuesday, May 21, 2019 6:38 AM
> > To: Shawn Guo <shawnguo@kernel.org>
> > Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mailing
> > List <linux-kernel@vger.kernel.org>; Anson Huang <anson.huang@nxp.com>;
> > Aisheng Dong <aisheng.dong@nxp.com>
> > Subject: linux-next: build failure after merge of the imx-mxs tree
> > 
> > Hi Shawn,
> > 
> > After merging the imx-mxs tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/clk/imx/clk.c: In function 'imx_mmdc_mask_handshake':
> > drivers/clk/imx/clk.c:20:8: error: implicit declaration of function
> > 'readl_relaxed'; did you mean 'xchg_relaxed'? [-Werror=implicit-function-
> > declaration]
> >   reg = readl_relaxed(ccm_base + CCM_CCDR);
> >         ^~~~~~~~~~~~~
> >         xchg_relaxed
> > drivers/clk/imx/clk.c:22:2: error: implicit declaration of function
> > 'writel_relaxed'; did you mean 'xchg_relaxed'? [-Werror=implicit-function-
> > declaration]
> >   writel_relaxed(reg, ccm_base + CCM_CCDR);
> >   ^~~~~~~~~~~~~~
> >   xchg_relaxed
> > 
> > Caused by commit
> > 
> >   0dc6b492b6e0 ("clk: imx: Add common API for masking MMDC handshake")
> > 
> > I have used the imx-mxs tree from next-20190520 for today.
> > 
> > --
> > Cheers,
> > Stephen Rothwell
