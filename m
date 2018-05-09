From: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 jc_docs tree
Date: Wed, 9 May 2018 18:53:28 +0200
Message-ID: <20180509165249.GA16976@andrea>
References: <20180509202508.15c3435a@canb.auug.org.au>
 <20180509132824.GA14503@andrea>
 <20180509085920.5fbb32f5@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180509085920.5fbb32f5@lwn.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Dufour <ldufour@linux.vnet.ibm.com>, mingo@kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, May 09, 2018 at 08:59:20AM -0600, Jonathan Corbet wrote:
> On Wed, 9 May 2018 15:28:24 +0200
> Andrea Parri <andrea.parri@amarulasolutions.com> wrote:
> 
> > > BTW, it would be nice if the the question "Why was this file removed?" was
> > > answered by that jc_docs commit message ...  I actually wonder if this
> > > file needs to return (I have no way of knowing).  
> > 
> > My bad; thanks for pointing this out.
> > 
> > Mmh... "why" would have been something like "the feature has no Kconfig". ;-)
> > 
> > I defer to your (community) decision regarding "if this file needs to return"
> > (Cc-ing Ingo, who created the file and also suggested its removal); I remain
> > available for preparing the patch to restore (and refresh) this file, should
> > you agree with this approach.
> 
> So I'll confess that I balked on the lack of a changelog, but then decided
> to proceed with the patch (and the other removal as well) due to the lack
> of the Kconfig option.
> 
> Now that I look a little closer, I think the real issue is that the
> "features" documentation assumes that there's a Kconfig option for each,
> but there isn't in this case.  The lack of a Kconfig option does not,
> this time around, imply that the feature has gone away.
> 
> I think that I should probably revert this patch in the short term.
> Longer-term, it would be good to have an alternative syntax for "variable
> set in the arch headers" to describe situations like this.

Both matters were discussed during v1:

  http://lkml.kernel.org/r/1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com

... (and the glory details are documented in features-refresh.sh ;-) ).

As I suggested above, simply reverting this patch will leave this file,
(and only this file!) out-of-date (and won't resolve the conflict with
Laurent's patch ...).

  Andrea


> 
> Make sense?
> 
> Thanks,
> 
> jon
