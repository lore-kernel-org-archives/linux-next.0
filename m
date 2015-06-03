From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: please include init-v4.1-rc6 branch for v4.2
Date: Wed, 3 Jun 2015 17:41:15 -0400
Message-ID: <20150603214114.GP29898@windriver.com>
References: <20150602232318.GI29898@windriver.com>
 <20150603133904.5d8b0bfb@canb.auug.org.au>
 <20150603185452.GV14071@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:39815 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbbFCVlU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2015 17:41:20 -0400
Content-Disposition: inline
In-Reply-To: <20150603185452.GV14071@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

[Re: [linux-next] please include init-v4.1-rc6 branch for v4.2] On 03/06/2015 (Wed 19:54) Mark Brown wrote:

> On Wed, Jun 03, 2015 at 01:39:04PM +1000, Stephen Rothwell wrote:
> > On Tue, 2 Jun 2015 19:23:18 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> 
> > > Please include init-v4.1-rc6 branch of:
> > > 	git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git
> 
> > OK, I will add it in just before I merge Andrew's tree and see how it
> > goes.
> 
> It looks like this has broken every build that includes modules which
> I'm trying in my build reports - lots of implicit declarations breaking
> the build.

The module build fails [on ARM] seem worse than they are since the one
interaction with the tegra/fuse driver causes spew to appear from
generic files like device.h 

https://lkml.kernel.org/r/20150603160808.GM29898@windriver.com

Thanks for the build coverage during the A/C outage; I'll follow up to
your build report with more details shortly; indicating exatly what has
been done to fix what.

Paul.
