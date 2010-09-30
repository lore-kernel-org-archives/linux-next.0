From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the i.MX
	tree
Date: Thu, 30 Sep 2010 08:45:33 +0200
Message-ID: <20100930064533.GJ29811@pengutronix.de>
References: <20100930112302.e554d367.sfr@canb.auug.org.au> <20100930033110.GA5762@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:39124 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754376Ab0I3Gpf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2010 02:45:35 -0400
Content-Disposition: inline
In-Reply-To: <20100930033110.GA5762@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Wed, Sep 29, 2010 at 08:31:11PM -0700, Mark Brown wrote:
> On Thu, Sep 30, 2010 at 11:23:02AM +1000, Stephen Rothwell wrote:
>=20
> > The former removed that code that the latter changed.  I just used =
the
> > former.
>=20
> > The latter was just changing some names, so ti may be able to be
> > integrated into the former.
>=20
> Though doing that would break bisection.  The other option would be t=
o
> revert the bit of the multi-component change that does the rename whi=
ch
> I think should be safe - Sacha, Liam, does that seem sensible?  There=
 is
> the issue with other potential non-audio users of the SSI to be
> considered.
I might be wrong, but I think there are no non-audio users of the ssi
device?

I think the correct fix is to squash the patch I just sent into the
commit merging the two.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
