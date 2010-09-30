From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the i.MX
	tree
Date: Thu, 30 Sep 2010 09:44:23 +0200
Message-ID: <20100930074423.GL29811@pengutronix.de>
References: <20100930112302.e554d367.sfr@canb.auug.org.au> <20100930033110.GA5762@opensource.wolfsonmicro.com> <20100930064533.GJ29811@pengutronix.de> <20100930065813.GA1744@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:56768 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754483Ab0I3Ho0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2010 03:44:26 -0400
Content-Disposition: inline
In-Reply-To: <20100930065813.GA1744@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Wed, Sep 29, 2010 at 11:58:13PM -0700, Mark Brown wrote:
> On Thu, Sep 30, 2010 at 08:45:33AM +0200, Uwe Kleine-K=F6nig wrote:
>=20
> > I might be wrong, but I think there are no non-audio users of the s=
si
> > device?
>=20
> That's kind of the point; while this is a generic serial port I've ne=
ver
> seen it used for anything except audio.
>=20
> > I think the correct fix is to squash the patch I just sent into the
> > commit merging the two.
>=20
> If there's no non-audio users there's no need to do the rename - the
> renames are to avoid having the ASoC DAI drivers suddenly start bindi=
ng
> with other drivers so we could just revert the rename in ASoC which
> would remove the merge issue.
Ah, now I got your point.  Your suggestion to keep the name for now
(until maybe in the future we get other users) sounds sensible.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
