From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Tue, 10 Mar 2015 09:23:18 +0100
Message-ID: <20150310082318.GH7525@pengutronix.de>
References: <20150310162816.3301cff5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33206 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751540AbbCJIXU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2015 04:23:20 -0400
Content-Disposition: inline
In-Reply-To: <20150310162816.3301cff5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg KH <greg@kroah.com>

Hello Greg,

On Tue, Mar 10, 2015 at 04:28:16PM +1100, Stephen Rothwell wrote:
> After merging the tty tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/tty/serial/imx.c: In function 'imx_set_termios':
> drivers/tty/serial/imx.c:1301:7: warning: suggest explicit braces to =
avoid ambiguous 'else' [-Wparentheses]
>     if (port->rs485.flags & SER_RS485_ENABLED)
>        ^
>=20
> Introduced by commit 17b8f2a3fdca ("serial: imx: add support for half
> duplex rs485").
should I send a fixed commit or do you prefer an incremental change?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
