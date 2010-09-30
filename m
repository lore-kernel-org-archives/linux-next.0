From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the i.MX
 tree
Date: Wed, 29 Sep 2010 23:58:13 -0700
Message-ID: <20100930065813.GA1744@opensource.wolfsonmicro.com>
References: <20100930112302.e554d367.sfr@canb.auug.org.au>
 <20100930033110.GA5762@opensource.wolfsonmicro.com>
 <20100930064533.GJ29811@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44712 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754212Ab0I3G6B (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Sep 2010 02:58:01 -0400
Content-Disposition: inline
In-Reply-To: <20100930064533.GJ29811@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Thu, Sep 30, 2010 at 08:45:33AM +0200, Uwe Kleine-K=F6nig wrote:

> I might be wrong, but I think there are no non-audio users of the ssi
> device?

That's kind of the point; while this is a generic serial port I've neve=
r
seen it used for anything except audio.

> I think the correct fix is to squash the patch I just sent into the
> commit merging the two.

If there's no non-audio users there's no need to do the rename - the
renames are to avoid having the ASoC DAI drivers suddenly start binding
with other drivers so we could just revert the rename in ASoC which
would remove the merge issue.
