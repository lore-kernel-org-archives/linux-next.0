From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Mon, 28 Oct 2013 09:33:33 -0700
Message-ID: <20131028163333.GA4797@kroah.com>
References: <20131029013317.a33ae4ff86b88ea17bb58e74@canb.auug.org.au>
 <2bf73b4c-8905-4889-bdd1-6bdae2c54bbd@CH1EHSMHS036.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42745 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756609Ab3J1Qdf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Oct 2013 12:33:35 -0400
Content-Disposition: inline
In-Reply-To: <2bf73b4c-8905-4889-bdd1-6bdae2c54bbd@CH1EHSMHS036.ehs.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Suneel Garapati <suneelg@xilinx.com>, Vlad Lungu <vlad.lungu@windriver.com>

On Mon, Oct 28, 2013 at 09:05:37AM -0700, S=F6ren Brinkmann wrote:
> On Tue, Oct 29, 2013 at 01:33:17AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the final tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > drivers/tty/serial/xilinx_uartps.c: In function 'xuartps_clk_notifi=
er_cb':
> > drivers/tty/serial/xilinx_uartps.c:436:7: error: 'PRE_RATE_CHANGE' =
undeclared (first use in this function)
> >   case PRE_RATE_CHANGE:
> >        ^
> > drivers/tty/serial/xilinx_uartps.c:436:7: note: each undeclared ide=
ntifier is reported only once for each function it appears in
> > drivers/tty/serial/xilinx_uartps.c:446:36: error: dereferencing poi=
nter to incomplete type
> >    if (!xuartps_calc_baud_divs(ndata->new_rate, xuartps->baud,
> >                                     ^
> > drivers/tty/serial/xilinx_uartps.c:461:7: error: 'POST_RATE_CHANGE'=
 undeclared (first use in this function)
> >   case POST_RATE_CHANGE:
> >        ^
> > drivers/tty/serial/xilinx_uartps.c:470:24: error: dereferencing poi=
nter to incomplete type
> >    port->uartclk =3D ndata->new_rate;
> >                         ^
> > drivers/tty/serial/xilinx_uartps.c:475:7: error: 'ABORT_RATE_CHANGE=
' undeclared (first use in this function)
> >   case ABORT_RATE_CHANGE:
> >        ^
> > drivers/tty/serial/xilinx_uartps.c: In function 'xuartps_probe':
> > drivers/tty/serial/xilinx_uartps.c:1385:2: error: implicit declarat=
ion of function 'clk_notifier_register' [-Werror=3Dimplicit-function-de=
claration]
> >   if (clk_notifier_register(xuartps_data->refclk,
> >   ^
> > drivers/tty/serial/xilinx_uartps.c:1418:2: error: implicit declarat=
ion of function 'clk_notifier_unregister' [-Werror=3Dimplicit-function-=
declaration]
> >   clk_notifier_unregister(xuartps_data->refclk,
> >   ^
> >=20
> > Caused by commits in the tty tree.
> >=20
> > I have left this broken for today.
>=20
> I already sent a series to Greg which should fix the x86 build of the
> tty tree. I think he didn't apply those patches yet.

Yes, I have them, sorry, been traveling, will get to them later today..=
=2E

thanks,

greg k-h
