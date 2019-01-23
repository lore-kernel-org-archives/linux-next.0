From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: linux-next: Fixes tag needs some work in the renesas tree
Date: Wed, 23 Jan 2019 10:41:20 +0000
Message-ID: <TYXPR01MB1775F5B4C96D81299ECC3AF9C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <20190123075605.116ddbd0@canb.auug.org.au>
 <TY1PR01MB1770C404E14E88CB912D12D4C0990@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190123103914.u7nlz624j5dmy7yr@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123103914.u7nlz624j5dmy7yr@verge.net.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Thank you Simon.

Fab

> From: Simon Horman <horms@verge.net.au>
> Sent: 23 January 2019 10:39
> Subject: Re: linux-next: Fixes tag needs some work in the renesas tree
>
> [CC linux-renesas-soc]
>
> On Wed, Jan 23, 2019 at 08:55:21AM +0000, Fabrizio Castro wrote:
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Sent: 22 January 2019 20:56
> > > To: Simon Horman <horms@verge.net.au>
> > > Subject: linux-next: Fixes tag needs some work in the renesas tree
> > >
> > > Hi all,
> > >
> > > In commit
> > >
> > >   8d6e2bbaeceb ("arm64: dts: renesas: r8a774a1: Fix hsusb reg size")
> > >
> > > Fixes tag
> > >
> > >   Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC a=
nd
> > >
> > > has these problem(s):
> > >
> > >   - Subject has leading but no trailing parentheses
> > >   - Subject has leading but no trailing quotes
> > >
> > > Please don't split Fixes tags across 2 lines.
> >
> > Hello Stephen,
> >
> > I am sorry for the trouble. My editor is configured to automatically wr=
ap lines when they are too long, I'll be more careful next time.
> > Do you need me to do anything about this patch?
>
> Hi Fabrizio,
>
> I should have noticed this myself. I'll fix up the fixes tag
> in my next push. I don't think any action is needed by you
> at this time.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
