From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next test scripts
Date: Thu, 12 Feb 2009 21:20:37 +0100
Message-ID: <20090212202036.GA31203@pengutronix.de>
References: <20090206142022.GA5430@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60987 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759111AbZBLUh1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Feb 2009 15:37:27 -0500
Content-Disposition: inline
In-Reply-To: <20090206142022.GA5430@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hello,

On Fri, Feb 06, 2009 at 03:20:22PM +0100, Uwe Kleine-K=F6nig wrote:
> I plan to setup something similar to linux-next for the Pengutronix t=
est
> lab to build a tree that contains the work of all our developers for
> daily testing.
>=20
> It would be really great if I could take a look into your scripts to
> manage linux-next.  I tried searching the web for them, but without
> success.
>=20
> Are the scripts somewhere available without being found by me?  If ye=
s,
> where are they, if not, do you can publish them somewhere?
After some more search I found the script by James Bottomley[1].

Still I'd like to know if you put some work in that script or even
created your own to prevent duplication of work.

If you care that I don't just use your script without contributing back=
,
I intend to use it among others for our (public) mxc tree at
git://git.pengutronix.de/git/imx/linux-2.6.git which gets much interest
in the arm-linux community and you can be sure that you will benefit
from our changes to your script.

Best regards
Uwe

[1] http://article.gmane.org/gmane.linux.kernel/626055/

--=20
Pengutronix e.K.                              | Uwe Kleine-K=F6nig     =
       |
Industrial Linux Solutions                    | http://www.pengutronix.=
de/  |
