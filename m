From: Johan Hovold <johan@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the mfd-fixes
 tree
Date: Thu, 30 Nov 2017 11:54:37 +0100
Message-ID: <20171130105437.GD8177@localhost>
References: <20171130014305.38797236@canb.auug.org.au>
 <20171129145000.GA7381@localhost>
 <20171129163142.3qrtdlqivwyfip6e@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:43542 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750782AbdK3Kyi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Nov 2017 05:54:38 -0500
Content-Disposition: inline
In-Reply-To: <20171129163142.3qrtdlqivwyfip6e@dell>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 29, 2017 at 04:31:42PM +0000, Lee Jones wrote:
> On Wed, 29 Nov 2017, Johan Hovold wrote:
> 
> > On Thu, Nov 30, 2017 at 01:43:05AM +1100, Stephen Rothwell wrote:
> > > Hi Lee,
> > > 
> > > Commits
> > > 
> > >   5f6bf7b9f96e ("mfd: twl4030-audio: Fix sibling-node lookup")
> > >   38c021ee7af3 ("mfd: twl6040: Fix child-node lookup")
> > > 
> > > are missing a Signed-off-by from their author.
> > 
> > Ouch, sorry about that.
> 
> That's unlike you Johan.
> 
> As it was you I didn't even look for that. :)

Yeah, I'd like to think so too. :)

> > Lee, can you still fix them up? Want me to resubmit?
> 
> No, it's okay.  Fixed and pushed.

Thanks for fixing it up.

Johan
