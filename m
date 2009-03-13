From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next test scripts
Date: Fri, 13 Mar 2009 09:37:01 +0100
Message-ID: <20090313083701.GB15754@pengutronix.de>
References: <20090206142022.GA5430@pengutronix.de> <20090212202036.GA31203@pengutronix.de> <20090313080348.GC3246@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33081 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752244AbZCMIhM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2009 04:37:12 -0400
Content-Disposition: inline
In-Reply-To: <20090313080348.GC3246@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Hi Nico,

On Fri, Mar 13, 2009 at 09:03:48AM +0100, Nico -telmich- Schottelius wr=
ote:
> Uwe Kleine-K=F6nig [Thu, Feb 12, 2009 at 09:20:37PM +0100]:
> > Hello,
> >=20
> > On Fri, Feb 06, 2009 at 03:20:22PM +0100, Uwe Kleine-K=F6nig wrote:
> > > I plan to setup something similar to linux-next for the Pengutron=
ix test
> > > lab to build a tree that contains the work of all our developers =
for
> > > daily testing.
> > >=20
> > > It would be really great if I could take a look into your scripts=
 to
> > > manage linux-next.  I tried searching the web for them, but witho=
ut
> > > success.
> > >=20
> > > Are the scripts somewhere available without being found by me?  I=
f yes,
> > > where are they, if not, do you can publish them somewhere?
> > After some more search I found the script by James Bottomley[1].
>=20
> I'm also maintaining some smaller scripts for maintaining all the
> kernel testing / building / installation stuff:
>=20
> http://git.schottelius.org/?p=3Dnsbin;a=3Dtree;f=3Dlinux;hb=3DHEAD
Thanks, but I think it doesn't include what I'm looking for.  You only
seem to build bleeding edge (in next-build.sh) but you don't merge
different trees before.

BTW, I don't see the reason for linux/fetch-branches.sh, why not rely o=
n
git remote udpate?

Best regards
Uwe

--=20
Pengutronix e.K.                              | Uwe Kleine-K=F6nig     =
       |
Industrial Linux Solutions                    | http://www.pengutronix.=
de/  |
