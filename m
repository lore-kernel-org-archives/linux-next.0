From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Thu, 24 Aug 2017 13:56:10 -0700
Message-ID: <20170824205610.GF24167@fury>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
 <20170802235740.GB27974@fury>
 <20170803102810.37f7c6b0@canb.auug.org.au>
 <CA+55aFwVBk2FQEp0pbF9Xx-YhexL19fCHgJex4JaOannXpCTOA@mail.gmail.com>
 <20170803155006.GA2234@fury>
 <20170805215829.GC1277@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170805215829.GC1277@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-next.vger.kernel.org

On Sat, Aug 05, 2017 at 02:58:29PM -0700, Darren Hart wrote:
> On Thu, Aug 03, 2017 at 08:50:06AM -0700, Darren Hart wrote:
> > On Wed, Aug 02, 2017 at 06:06:20PM -0700, Linus Torvalds wrote:
> > > On Wed, Aug 2, 2017 at 5:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > I would say that if you rebase someone's commit(s), then you are on the
> > > > "patch's delivery path" and so should add a Signed-off-by tag.
> > > 
> > > Yeah, I agree. Rebasing really is pretty much the exact same thing as
> > > applying a patch.
> 
> I will be away for a few days, but will follow up on this when I return.
> In the meantime, my plan is to leave the current for-next branch alone
> rather than rebasing it to fix the previous rebase which resulted in the
> mixed committer/signoff issue Stephen's new test identified.
> 
> I just want it to be clear I'm not ignoring the issue, but rather
> planning on addressing it in commits going forward - based on the
> results of the discussion below.
> 

OK, with no additional feedback here, Andy and I have discussed and we will
adapt our process by using individual review branches which 0-day can pull from
which are considered transient and mutable. After this, the patches will be
added to the common testing branch, which will now be fast-forward only [1].
After a short period, testing will move to for-next and fixes branches in
preparation for pull-requests, just as before.

Thanks,

1. We may eliminate the testing branch as it may not offer any value over
   for-next, but we'll work through at least one release cycle before doing
   so.

-- 
Darren Hart
VMware Open Source Technology Center
