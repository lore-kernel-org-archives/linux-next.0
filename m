From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [GIT PULL linux-next] Add Compiler Attributes tree
Date: Wed, 3 Oct 2018 13:54:05 +0200
Message-ID: <CANiq72=cRpqnB3BxLsmj-rMdUGJK+pac1SRppoRgsON69ErfQg@mail.gmail.com>
References: <CANiq72=rgT9cPWH64Tf_8gAU09EiH5FvGqFUdOjV=spVbM5m8Q@mail.gmail.com>
 <20181003071059.02b3fd6f@canb.auug.org.au> <CAKwvOdmt4-jFv6d-ZVUH5OOvXSz38jpuNvQy-jtoSS3xEoh78A@mail.gmail.com>
 <CANiq72mmxiO6RWBTQfWYDaa6gmOF01nXmN6BJNCAjAFz3QJqqA@mail.gmail.com> <20181002232454.GB2483@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002232454.GB2483@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ted Ts'o <tytso@mit.edu>, Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Steven Rostedt <rostedt@goodmis.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Olof Johansson <olof@lxom.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, David Miller <davem@davemloft.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Sandipan
List-Id: linux-next.vger.kernel.org

Hi Ted,

On Wed, Oct 3, 2018 at 1:25 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Wed, Oct 03, 2018 at 12:12:10AM +0200, Miguel Ojeda wrote:
> > As I have read, -next is supposed to be a vision of what the merge
> > window will look like after merging everything, i.e. ideally -rc1. For
> > that to work for files out-of-tree (like these ones, which are not
> > maintained by a single tree), changes should be allowed to be stacked
> > on each other; otherwise, we cannot handle conflicts :-(
>
> In general, best practice is to base tree on an -rcX commit.  I
> usually will use something like -rc4 which is after most of the major
> changes have gone in.  This tends to reduce conflicts for most git
> trees.

Sure. That is what I do for mainline PRs to Linus. As you say, it
works fine for mostly independent trees. But it doesn't (that well)
for out-of-tree stuff or for stuff spanning several trees.

>
> There are times when a commit in one tree needs to depend on a commit
> in another tree.  What to do depends on the circumstances.
>

Exactly. And for this case, I simply assumed Stephen wanted a clean
series to apply on top of the latest next-* tag (same way we base
stuff on top of -rc*s). Note that this is *not* really a "tree"
collecting changes/development, it is a patch series, i.e. what is
important is only the range-diff.

What has surprised me is that -next does not allow for range-diffs
(patches/commits/...) to be inside -next, maybe applied after all the
normal merges of trees. I simply assumed it did, given what I could
find about -next (which does not seem to be documented properly, by
the way).

>
> So another solution is to simply evade the problem.  If the reason why
> tree A needs to depend on tree B is that tree B is using some
> interface which has changed, if it's a minor change, then Stephen will
> fix it up when he pulls the changes; just as Linus will.

While this is a simple conflict, I don't really agree with release
maintainers having to fix conflicts on the fly (even if it is a single
trivial line), but that is an orthogonal discussion...

> Yet another solution is to arrange the code changes to avoid needing
> commits that might conflict.  For example, in fs/ext4/ext4.h, I very
> deliberately did this.
>
> /* Until this gets included into linux/compiler-gcc.h */
> #ifndef __nonstring
> #if defined(GCC_VERSION) && (GCC_VERSION >= 80000)
> #define __nonstring __attribute__((nonstring))
> #else
> #define __nonstring
> #endif
> #endif
>
> You included a cleanup patch to remove it in your git tree, but it
> wasn't actually necessary.  If there was a merge conflict, it would be
> simple enough to just drop your cleanup patch, since I had carefully
> used #ifndef __nonstring... #endif.  So the idea was that if someone
> defined __nonstring somewhere else, it wouldn't break the build with a
> duplicate #define since it was protected with an #ifndef.
>
> I didn't mind that you included a cleanup patch; but I set things up
> so that it would not be necessary, since often the best way to solve a
> merge conflict is by avoiding the need for the change (in some other
> git tree) in the first place.  :-)

Alright, I am not sure how to answer this without sounding
"aggressive" and maybe I misunderstood something you tried to point
out, so I apologize in advance. There are several points here:

  * The merge conflict isn't related to this (but let's assume it was,
since you pointed this out as an example -- I guess; although I am not
sure why).

  * Thanks for explaining, but I think most people here understand how
#ifndef works :-) Also note that we already had guards for some
attributes that needed per-compiler implementations.

  * The patch is actually necessary:

    - Several people argued that examples should be present when I
introduced __nonstring earlier in the series. While I don't think they
are mandatory for this case, they are good to have, and since they
were anyway requested, I happily added them.

    - Changes should include everything related to them (as far as
possible, i.e. extreme examples aside). Adding __nonstring and not
removing the ext4 part would simply be leaving undone work (which has
to be done sooner or later). To be honest, it could have even been
done in the same commit and I would say it is logically OK (even if
not great).

    - Related to that: I think the outer #ifndef shouldn't have been
included to begin with, because it is either wrong or dead code: if we
end up having a __nonstring, it should be removed at the same time
(like this series does); and if __nonstring isn't there (like now), it
isn't guarding against anything. At worst, it could hide a mismatch in
the definitions.

    - I promised to you I would clean it up :-)

You seem to argue that it is better to avoid merge conflicts rather
than doing a proper series. Well, I think we should really try to
avoid conflicts pushing down the """quality""" of
patches/commits/series.

Cheers,
Miguel
