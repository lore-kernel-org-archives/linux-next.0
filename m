From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Thu, 3 Aug 2017 08:50:06 -0700
Message-ID: <20170803155006.GA2234@fury>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
 <20170802235740.GB27974@fury>
 <20170803102810.37f7c6b0@canb.auug.org.au>
 <CA+55aFwVBk2FQEp0pbF9Xx-YhexL19fCHgJex4JaOannXpCTOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:36825 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751010AbdHCPuJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2017 11:50:09 -0400
Content-Disposition: inline
In-Reply-To: <CA+55aFwVBk2FQEp0pbF9Xx-YhexL19fCHgJex4JaOannXpCTOA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Aug 02, 2017 at 06:06:20PM -0700, Linus Torvalds wrote:
> On Wed, Aug 2, 2017 at 5:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I would say that if you rebase someone's commit(s), then you are on the
> > "patch's delivery path" and so should add a Signed-off-by tag.
> 
> Yeah, I agree. Rebasing really is pretty much the exact same thing as
> applying a patch.
> 
> > "git rebase" does have a "--signoff" option.
> 
> I think you end up signing off twice using that. I don't think it's
> smart enough to say "oh, you already did it once".
> 
> But I didn't check. Sometimes git is a lot smarter than I remember it
> being, simply because I don't worry about it. Junio does a good job.
> 
> And in general, you simply should never rebase commits that have
> already been publicized. And the fact that you didn't commit them in
> the first place definitely means that they've been public somewhere.

For the platform driver x86 subsystem, Andy I have defined our "testing"
branch as mutable. It's the place where our CI pulls from, as well as
the first place 0day pulls from, and where we stage things prior to
going to the publication branches ("for-next" and then sometimes
"fixes"). We find it valuable to let the robots have a chance to catch
issues we may have missed before pushing patches to a publication
branch, but to do that, we need the testing branch to be accessible to
them.

The usual case that would land us in the situation here is we discover a
bug in a patch and revert it before going to a publication branch.
Generally, this will involve one file (most patches here are isolated),
which we drop via rebase, and the rest are entirely unaffected in terms
of code, but as the tree changed under them, they get "re-committed".

This seems like a reasonable way to handle a tree with more than one
maintainer and take advantage of some automation. Andy and I do need a
common tree to work from, and I prefer to sync with him as early in the
process as possible, rather than have him and I work with two private
testing branches and have to negotiate who takes which patches. It would
slow us down and wouldn't improve quality in any measurable way. Even if
we did this work in an access controlled repository, we would still have
this problem.

With more and more maintainer teams, I think we need to distinguish
between "published" branches and "collaboration" branches. I suspect
maintainer teams will expose this rebasing behavior, but I don't believe
it is new or unique to us. To collaborate, we need a common branch,
which a lone maintainer doesn't need, and the committer/sign-off delta
makes this discoverable, whereas it was invisible with a lone
maintainer.

Note: A guiding principle behind our process is that of not introducing
bugs into mainline. Rather than reverting bad patches in testing, we
drop them, and replace them with a fixed version. The idea being we
don't want to introduce git bisect breakage, and we don't want to open
the window for stable/distro maintainers to pull a bad patch and forget
the revert or the fixup. If we can correct it before it goes to Linus,
we do.

> So I would definitely suggest against the "git rebase --signoff"
> model, even if git were to do the "right thing". It's simply
> fundamentally the wrong thing to do. Either you already committed them
> (and hopefully signed off correctly the first time), or you didn't
> (and you shouldn't be rebasing). So in neither case is "git rebase
> --signoff" sensible.

So in light of the above, we can:

a) Keep doing what we're doing
b) Sign off whenever we rebase
c) Add our signoff whenever we move patches from testing to for-next
   (I hadn't considered this until now... this might be the most
    compatible with maintainer teams while strictly tracking the
    "patches" delivery path")
d) Redefine testing as immutable and revert patches rather than drop
   them, introducing bugs into mainline.
e) Make each maintainer work from a private set of branches (this just
   masks the problem by making the rebase invisible)

Whatever we decide, I'd like to add this to some documentation for
maintainer teams (which I'm happy to prepare and submit).

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
