From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Fri, 4 Aug 2017 10:47:37 -0700
Message-ID: <20170804174737.GD21169@fury>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
 <20170802235740.GB27974@fury>
 <20170803102810.37f7c6b0@canb.auug.org.au>
 <CA+55aFwVBk2FQEp0pbF9Xx-YhexL19fCHgJex4JaOannXpCTOA@mail.gmail.com>
 <xmqqmv7ftegw.fsf@gitster.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <xmqqmv7ftegw.fsf@gitster.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Junio C Hamano <gitster@pobox.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 04, 2017 at 10:44:31AM -0700, Junio C Hamano wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> 
> > On Wed, Aug 2, 2017 at 5:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> I would say that if you rebase someone's commit(s), then you are on the
> >> "patch's delivery path" and so should add a Signed-off-by tag.
> >
> > Yeah, I agree. Rebasing really is pretty much the exact same thing as
> > applying a patch.
> >
> >> "git rebase" does have a "--signoff" option.
> >
> > I think you end up signing off twice using that. I don't think it's
> > smart enough to say "oh, you already did it once".
> 
> Git avoids duplication only when your SoB appears as the last
> existing one, so that we can capture a flow of a patch which you
> originally signed off, picked up and tweaked further by somebody
> else, which comes back to you and you sign it off again.
> 
> We may drop yours even when yours is not the last in the existing
> chain, but that would be a bug; at least the above is what we try to
> do.
> 
> > And in general, you simply should never rebase commits that have
> > already been publicized. And the fact that you didn't commit them in
> > the first place definitely means that they've been public somewhere.
> >
> > So I would definitely suggest against the "git rebase --signoff"
> > model, even if git were to do the "right thing". It's simply
> > fundamentally the wrong thing to do.
> 
> When those involved are using push/pull as a replacement for
> e-mailed patch exchange, then such a workflow should be OK.  There
> needs to be a shared understanding that the branch(es) used for such
> exchange are unstable and should not be built directly on to be
> merged, of course.
> 

Thanks Junio,

I don't think I correctly parsed "should not be built directly on to be
merged", can you rephrase?

-- 
Darren Hart
VMware Open Source Technology Center
