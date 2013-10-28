From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Mon, 28 Oct 2013 09:05:37 -0700
Message-ID: <2bf73b4c-8905-4889-bdd1-6bdae2c54bbd@CH1EHSMHS036.ehs.local>
References: <20131029013317.a33ae4ff86b88ea17bb58e74@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]:5019
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757112Ab3J1QFu convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Oct 2013 12:05:50 -0400
Content-Disposition: inline
In-Reply-To: <20131029013317.a33ae4ff86b88ea17bb58e74@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Suneel Garapati <suneelg@xilinx.com>, Vlad Lungu <vlad.lungu@windriver.com>

On Tue, Oct 29, 2013 at 01:33:17AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/tty/serial/xilinx_uartps.c: In function 'xuartps_clk_notifier=
_cb':
> drivers/tty/serial/xilinx_uartps.c:436:7: error: 'PRE_RATE_CHANGE' un=
declared (first use in this function)
>   case PRE_RATE_CHANGE:
>        ^
> drivers/tty/serial/xilinx_uartps.c:436:7: note: each undeclared ident=
ifier is reported only once for each function it appears in
> drivers/tty/serial/xilinx_uartps.c:446:36: error: dereferencing point=
er to incomplete type
>    if (!xuartps_calc_baud_divs(ndata->new_rate, xuartps->baud,
>                                     ^
> drivers/tty/serial/xilinx_uartps.c:461:7: error: 'POST_RATE_CHANGE' u=
ndeclared (first use in this function)
>   case POST_RATE_CHANGE:
>        ^
> drivers/tty/serial/xilinx_uartps.c:470:24: error: dereferencing point=
er to incomplete type
>    port->uartclk =3D ndata->new_rate;
>                         ^
> drivers/tty/serial/xilinx_uartps.c:475:7: error: 'ABORT_RATE_CHANGE' =
undeclared (first use in this function)
>   case ABORT_RATE_CHANGE:
>        ^
> drivers/tty/serial/xilinx_uartps.c: In function 'xuartps_probe':
> drivers/tty/serial/xilinx_uartps.c:1385:2: error: implicit declaratio=
n of function 'clk_notifier_register' [-Werror=3Dimplicit-function-decl=
aration]
>   if (clk_notifier_register(xuartps_data->refclk,
>   ^
> drivers/tty/serial/xilinx_uartps.c:1418:2: error: implicit declaratio=
n of function 'clk_notifier_unregister' [-Werror=3Dimplicit-function-de=
claration]
>   clk_notifier_unregister(xuartps_data->refclk,
>   ^
>=20
> Caused by commits in the tty tree.
>=20
> I have left this broken for today.

I already sent a series to Greg which should fix the x86 build of the
tty tree. I think he didn't apply those patches yet.

	S=C3=B6ren
