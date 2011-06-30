From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the security-testing tree with the
 tree
Date: Thu, 30 Jun 2011 14:17:10 +0200
Message-ID: <20110630121710.GJ11559@pengutronix.de>
References: <20110630142910.2fea4257.sfr@canb.auug.org.au>
 <20110630072559.GA4048@pengutronix.de>
 <20110630193023.6056d48e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:41701 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952Ab1F3MRO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jun 2011 08:17:14 -0400
Content-Disposition: inline
In-Reply-To: <20110630193023.6056d48e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, git@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Thu, Jun 30, 2011 at 07:30:23PM +1000, Stephen Rothwell wrote:
> Hi Uwe,
>=20
> On Thu, 30 Jun 2011 09:25:59 +0200 Uwe Kleine-K=F6nig <u.kleine-koeni=
g@pengutronix.de> wrote:
> >
> > Long history short: James probably used -s ours or similar and it's=
 fine
> > not to merge that commit into next :-)
>=20
> Ah ha!  Thanks for the explanation.  My mind was clearly not up to it
> today. :-)
The uncomfortable issue here is that=20

	git show bcd05ca10420

(or gitk or gitweb or <enteryourfavoritetoolhere>) doesn't indicate tha=
t
it's "strange". The patch shown is simply empty, as it would be if the
tree matched the other parent or if it were a clean merge.

A flag would be nice that does what I did: redo the merge and compare
bcd05ca10420^{tree} with the result?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
