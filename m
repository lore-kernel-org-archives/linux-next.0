From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Mon, 16 Feb 2015 09:36:41 +0530
Message-ID: <20150216040641.GT21387@intel.com>
References: <20150216120934.3f4dc936@canb.auug.org.au>
 <EB2E1ED4-00E1-4BDE-9B0D-8CB8912674B7@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <EB2E1ED4-00E1-4BDE-9B0D-8CB8912674B7@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yibin Gong <yibin.gong@freescale.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 16, 2015 at 01:48:56AM +0000, Yibin Gong wrote:
> Hi Stephen,
>     Thanks for you report. I have notice it and sent the v4 patch rev=
iew yesterday.
>=20
> =E5=8F=91=E8=87=AA=E6=88=91=E7=9A=84 iPhone
>=20
> > =E5=9C=A8 2015=E5=B9=B42=E6=9C=8816=E6=97=A5=EF=BC=8C09:09=EF=BC=8C=
Stephen Rothwell <sfr@canb.auug.org.au> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > Hi Vinod,
> >=20
> > After merging the slave-dma tree, today's linux-next build (arm mul=
ti_v7_defconfig)
> > failed like this:
> >=20
> > drivers/dma/imx-sdma.c: In function 'sdma_run_channel0':
> > drivers/dma/imx-sdma.c:535:57: error: macro "readl" passed 2 argume=
nts, but takes just 1
> >  if (readl(SDMA_H_CONFIG_CSM, sdma->regs + SDMA_H_CONFIG) =3D=3D 0)
> >                                                         ^
> > drivers/dma/imx-sdma.c:535:6: error: 'readl' undeclared (first use =
in this function)
> >  if (readl(SDMA_H_CONFIG_CSM, sdma->regs + SDMA_H_CONFIG) =3D=3D 0)
> >      ^
Thanks Stephen,

> >=20
> > Caused by commit 66a073b6478d ("dmaengine: imx-sdma: switch to dyna=
mic
> > context mode after script loaded").
I have dropped the offending commit now

--=20
~Vinod

> >=20
> > I have used the slave-dma tree from next-20150213 for today.
> > --=20
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au

--=20
