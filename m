From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: mx51_efika: update platform data for new mfd
 changes
Date: Fri, 4 Mar 2011 20:46:16 +0100
Message-ID: <20110304194616.GW22310@pengutronix.de>
References: <20110304080653.3f2c3f19@debxo>
 <4D710FF9.6040305@ru.mvista.com>
 <20110304083822.0f40d120@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110304083822.0f40d120@debxo>
Sender: linux-kernel-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: Sergei Shtylyov <sshtylyov@mvista.com>, Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Amit Kucheria <amit.kucheria@canonical.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Fri, Mar 04, 2011 at 08:38:22AM -0800, Andres Salomon wrote:
> On Fri, 04 Mar 2011 19:14:49 +0300
> Sergei Shtylyov <sshtylyov@mvista.com> wrote:
>=20
> > Hello.
> >=20
> > Andres Salomon wrote:
> >=20
> > > Note that this relies on stuff currently in mfd's next tree, but
> > > this is also a newer driver.  I'm not sure which tree it should g=
o
> > > through, as it's a problem that shows up in next.
> >=20
> >     This passage should be under --- tear line.
>=20
> What?
Actually putting it above the commit log and separating it by a scissor=
s
line (see git-mailinfo(1), git am -c) should be fine, too.

This is all about selecting which part of the message should end up in
the commit log.  Git ignores everything after the tripple dash (apart
from the patch of course).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
