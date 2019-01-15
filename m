From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] ARM: imx: add i.MX7ULP cpuidle support
Date: Tue, 15 Jan 2019 23:12:52 +0800
Message-ID: <20190115151250.GC13895@dragon>
References: <1547185955-2395-1-git-send-email-Anson.Huang@nxp.com>
 <20190114005600.GN11426@dragon>
 <e892304bde543b86a9d0ad4409d0c6a1f509a312.camel@nxp.com>
 <20190116001043.69529b90@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116001043.69529b90@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Leonard Crestez <leonard.crestez@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Anson Huang <anson.huang@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 16, 2019 at 12:10:43AM +1100, Stephen Rothwell wrote:
> Hi Leonard,
> 
> On Tue, 15 Jan 2019 12:30:23 +0000 Leonard Crestez <leonard.crestez@nxp.com> wrote:
> >
> > On 1/14/19 2:56 AM, Shawn Guo wrote:
> > > On Fri, Jan 11, 2019 at 05:57:30AM +0000, Anson Huang wrote:  
> > > > This patch adds cpuidle support for i.MX7ULP, 3 cpuidle
> > > > states supported as below:
> > > > 
> > > > 1. WFI, just ARM wfi;
> > > > 2. WAIT mode, mapped to SoC's partial stop mode #3;
> > > > 3. STOP mode, mapped to SoC's partial stop mode #1.
> > > > 
> > > > In WAIT mode, system clock and bus clock will be enabled;
> > > > In STOP mode, system clock and bus clock will be disabled.
> > > > 
> > > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>  
> > > 
> > > Applied, thanks.
> > >   
> > 
> > Hello,
> > 
> > I'm not sure if anyone else already noticed but it seems the
> > arch/arm/mach-imx/cpuidle-imx7ulp.c file was dropped?
> > 
> > It's not in your tree:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?h=imx/soc&id=cf2d2d392906f5603cf0d0f3630f6386babf7e4b
> > 
> > This causes build failures in next-20190115 with imx_v6_v7_defconfig.
> 
> That file does not exist in Linus' tree either.  And there are no
> commits in linux-next that add it.

Sorry.  That's my fault.  The patch doesn't apply to my tree and I had
to use 'patch' command.  However, I forgot to add this new
cpuidle-imx7ulp.c file.

Just fixed it.

Shawn
