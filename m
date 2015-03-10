From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Tue, 10 Mar 2015 10:19:04 +0100
Message-ID: <20150310091904.GB13728@kroah.com>
References: <20150310162816.3301cff5@canb.auug.org.au>
 <20150310082318.GH7525@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42316 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752297AbbCJJTH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 05:19:07 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 203A0210E2
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2015 05:19:05 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150310082318.GH7525@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 10, 2015 at 09:23:18AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Greg,
>=20
> On Tue, Mar 10, 2015 at 04:28:16PM +1100, Stephen Rothwell wrote:
> > After merging the tty tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >=20
> > drivers/tty/serial/imx.c: In function 'imx_set_termios':
> > drivers/tty/serial/imx.c:1301:7: warning: suggest explicit braces t=
o avoid ambiguous 'else' [-Wparentheses]
> >     if (port->rs485.flags & SER_RS485_ENABLED)
> >        ^
> >=20
> > Introduced by commit 17b8f2a3fdca ("serial: imx: add support for ha=
lf
> > duplex rs485").
> should I send a fixed commit or do you prefer an incremental change?

It's already in my tree, so I need an add-on patch.

thanks,

greg k-h
