From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 31 Aug 2015 17:48:42 +1000
Message-ID: <20150831174842.3c227fd2@canb.auug.org.au>
References: <20150828115041.037554b4@canb.auug.org.au>
	<alpine.DEB.2.02.1508280936240.16666@lnxricardw1.se.axis.com>
	<20150828154556.GO12027@sirena.org.uk>
	<alpine.DEB.2.02.1508310850530.16666@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53073 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751433AbbHaHsq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2015 03:48:46 -0400
In-Reply-To: <alpine.DEB.2.02.1508310850530.16666@lnxricardw1.se.axis.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Ricard,

On Mon, 31 Aug 2015 09:04:22 +0200 Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>
> On Fri, 28 Aug 2015, Mark Brown wrote:
> 
> > On Fri, Aug 28, 2015 at 09:40:41AM +0200, Ricard Wanderlof wrote:
> > > On Fri, 28 Aug 2015, Stephen Rothwell wrote:
> > 
> > > In fact the exact same construct is used by a handful of other codec 
> > > drivers which apparently don't fail.
> > 
> > > I'm suspecting something slightly more convoluted like a missing 
> > #include .
> > 
> > No, the issue is that you have used a different variable name when 
> > declaring the IDs and when referencing them in the module device table.
> 
> Yeah, I realized that upon closer inspection. 
> 
> What bugs me is that my ARM gcc didn't seem to flag this, whereas the 
> x86 gcc did upon subsequent testing. And yes, CONFIG_OF is set during my 
> build.

Do you have CONFIG_MODULE set in your build? (just guessing)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
