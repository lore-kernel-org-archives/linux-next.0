From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: linux-next: Tree for Sep 25
Date: Thu, 3 Oct 2013 21:30:51 +0800
Message-ID: <20131003133051.GB25934@localhost>
References: <20130925144329.7d240a6fa2b5782dc8726340@canb.auug.org.au>
 <1380156448.17366.44.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:30634 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753791Ab3JCNbD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Oct 2013 09:31:03 -0400
Content-Disposition: inline
In-Reply-To: <1380156448.17366.44.camel@joe-AO722>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 25, 2013 at 05:47:28PM -0700, Joe Perches wrote:
> On Wed, 2013-09-25 at 14:43 +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Heads up: I will be having a 3 week break leading up to the kernel
> > summit.  This means that next-20130927 (next Friday) will be the last
> > linux-next release until next-20131028 (or maybe 29).  I presume that
> > Linus will be up to v3.12-rc7 by then and -rc7 is often the last before
> > a release ... Please plan accordingly.
> 
> Hi Stephen.
> 
> Maybe this is a good time for an experiment.
> 
> Perhaps it would be interesting if you still had a script
> running every workday and pushed out the result tree without
> trying to do any patch conflict resolution yourself.
> 
> Maybe notify the owners of the trees that conflict and let
> them work out whatever resolutions that are necessary.
> 
> I think FengGuang's robot can supply most all the details
> necessary and maybe you can do a lot less work in the future.

It's a good idea, unfortunately Stephen has already went to vocation.
I could try the auto merge and merge-failure reports and hand the
script over to Stephen when he is back. However the merge conflicts
will have to be handled by the relevant developer/maintainers.

Thanks,
Fengguang
