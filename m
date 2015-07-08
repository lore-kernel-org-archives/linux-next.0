From: Jan Kara <jack@suse.cz>
Subject: Re: next-20150703 build: 1 failures 73 warnings (next-20150703)
Date: Wed, 8 Jul 2015 10:41:34 +0200
Message-ID: <20150708084134.GD725@quack.suse.cz>
References: <E1ZB04o-0001MQ-6U@optimist>
 <CAP=VYLqpwQ4OqYMBW4m9oo2ZjiZEda7vn1zSXxLEYtH7ucbOqQ@mail.gmail.com>
 <20150704165249.231cdacd@canb.auug.org.au>
 <20150705093654.GB11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33982 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933724AbbGHIlm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2015 04:41:42 -0400
Content-Disposition: inline
In-Reply-To: <20150705093654.GB11162@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Gortmaker <paul.gortmaker@windriver.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, jack@suse.cz, Andrew Morton <akpm@linux-foundation.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>

On Sun 05-07-15 10:36:54, Mark Brown wrote:
> On Sat, Jul 04, 2015 at 04:52:49PM +1000, Stephen Rothwell wrote:
> > On Sat, 4 Jul 2015 00:01:33 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> 
> > > 6e9d331aec60a3dd1bbc035fbdd84a90364b8565 is the first bad commit
> > > commit 6e9d331aec60a3dd1bbc035fbdd84a90364b8565
> > > Author: Jan Kara <jack@suse.cz>
> > > Date:   Fri Jun 19 09:05:45 2015 +1000
> 
> > >     drm/exynos: convert g2d_userptr_get_dma_addr() to use get_vaddr_frames()
> 
> > Amazing!  Four SOB lines and lots of CCs and noone bothered to build test it :-(
> 
> > > Fix seems posted here...
> > > 
> > > http://permalink.gmane.org/gmane.comp.video.dri.devel/131898
> 
> And there was another, similar fix sent as a result of me reporting the
> same issue earlier last week too with no response :(

There was another issue in the series due to which Andrew refreshed the
whole series in mm tree and this fix fell through the cracks. I should have
warned Andrew. Sorry, my fault.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
