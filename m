From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the final tree (mfd
	tree related)
Date: Mon, 20 Dec 2010 12:18:41 +0000
Message-ID: <20101220121841.GB14986@sirena.org.uk>
References: <20101220192121.47767525.sfr@canb.auug.org.au> <20101220103336.GC11095@sortiz-mobl> <20101220105202.GA26706@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:46759 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755491Ab0LTMSq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Dec 2010 07:18:46 -0500
Content-Disposition: inline
In-Reply-To: <20101220105202.GA26706@rakim.wolfsonmicro.main>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 20, 2010 at 10:52:03AM +0000, Mark Brown wrote:
> On Mon, Dec 20, 2010 at 11:33:37AM +0100, Samuel Ortiz wrote:

> > Ok, I removed Mark's commit, the MFD tree should build fine now.
> > I'm keeping this one for whenever we'll have a proper pwm framework.

> It doesn't need dropping I think, the driver should just need a
> dependency on HAVE_PWM adding.

Meh, sorry, wrong way round.
