From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: Tree for May 16 (mfd/mc13xxx)
Date: Wed, 16 May 2012 20:04:27 +0200
Message-ID: <20120516180427.GM22395@pengutronix.de>
References: <20120516201426.3a162ecd6adeb7132413f1b9@canb.auug.org.au>
 <4FB3CF4E.8000106@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:54531 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754400Ab2EPSEf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 14:04:35 -0400
Content-Disposition: inline
In-Reply-To: <4FB3CF4E.8000106@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Wed, May 16, 2012 at 09:01:18AM -0700, Randy Dunlap wrote:
> On 05/16/2012 03:14 AM, Stephen Rothwell wrote:
>=20
> >=20
> > The mfd tree lost its build failure but gained another so I used th=
e
> > version from next-20120511.
>=20
>=20
> drivers/mfd/mc13xxx-core.c:726:2: error: implicit declaration of func=
tion 'regmap_exit'
I think the patch by Mark Brown[1] addresses that problem?

Best regards
Uwe

[1] http://mid.gmane.org/1337190669-29328-1-git-send-email-broonie@open=
source.wolfsonmicro.com

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
