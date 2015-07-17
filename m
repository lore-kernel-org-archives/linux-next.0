From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build warnings after merge of the regmap tree
Date: Fri, 17 Jul 2015 17:45:13 +0100
Message-ID: <20150717164513.GR16517@opensource.wolfsonmicro.com>
References: <20150717143934.4f0ce5d7@canb.auug.org.au> <20150717094436.GC21939@opensource.wolfsonmicro.com> <20150717103450.GJ11162@sirena.org.uk> <20150717152955.GI21939@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43665 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752965AbbGQQpR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2015 12:45:17 -0400
Content-Disposition: inline
In-Reply-To: <20150717152955.GI21939@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
Cc: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

On Fri, Jul 17, 2015 at 04:29:55PM +0100, Nariman Poushin wrote:
> On Fri, Jul 17, 2015 at 11:34:50AM +0100, Mark Brown wrote:
> > On Fri, Jul 17, 2015 at 10:44:36AM +0100, Nariman Poushin wrote:
> > 
> > > What is the best course of action here? I am more than happy to help with
> > > whatever is needed but unsure of the etiquette here and also not sure
> > > what I can do.
> > 
> > > Clearly there are some clients that need updating but they were not
> > > present in the regmap tree, so is the correct thing to do to merge
> > > in the mfd and sound-asoc tree and provide a fixup commit?
> > 
> > > Just let me know and I am happy to do whatever is deemed correct.
> > 
> > Please send patches fixing the problems you have introduced.
> 
> I have sent the patches to fix the build errors you found Stephen.
> Just wanted to let you guys know I will be on vacation for 1 week,
> so if there are any issues they might not be addressed until then.
> 
> Thanks
> Nariman

If you include myself and Richard Fitzgerald
(rf@opensource.wolfsonmicro.com) one of us will pick things up if
there are any issues.

Thanks,
Charles
