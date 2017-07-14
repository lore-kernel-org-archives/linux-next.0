From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 10:33:54 -0400
Message-ID: <1500042834.2936.18.camel@redhat.com>
References: <20170714111437.69a6b100@canb.auug.org.au>
         <1499995033.2936.12.camel@redhat.com>
         <20170714033416.GS1528@mtr-leonro.local>
         <1500005553.2936.14.camel@redhat.com>
         <20170714045417.GU1528@mtr-leonro.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35466 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754026AbdGNOd4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 Jul 2017 10:33:56 -0400
In-Reply-To: <20170714045417.GU1528@mtr-leonro.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>

On Fri, 2017-07-14 at 07:54 +0300, Leon Romanovsky wrote:
> On Fri, Jul 14, 2017 at 12:12:33AM -0400, Doug Ledford wrote:
> > On Fri, 2017-07-14 at 06:34 +0300, Leon Romanovsky wrote:
> > > On Thu, Jul 13, 2017 at 09:17:13PM -0400, Doug Ledford wrote:
> > > > On Fri, 2017-07-14 at 11:14 +1000, Stephen Rothwell wrote:
> > > > > Hi Doug,
> > > > > 
> > > > > Today's linux-next merge of the rdma tree got conflicts in:
> > > > > 
> > > > >   drivers/infiniband/core/uverbs_cmd.c
> > > > >   drivers/infiniband/core/verbs.c
> > > > > 
> > > > > between commit:
> > > > > 
> > > > >   d291f1a65232 ("IB/core: Enforce PKey security on QPs")
> > > > > 
> > > > > from Linus' tree and commits:
> > > > > 
> > > > >   c7c0fb974caa ("IB/core: Introduce modify QP operation with
> > > > > udata")
> > > > >   5f4bc420f35f ("IB/uverbs: Make use of ib_modify_qp variant
> > > > > to
> > > > > avoid
> > > > > resolving DMAC")
> > > > > 
> > > > > from the rdma tree.
> > > > > 
> > > > > I fixed it up (I used the latter version of uverbs_cmd.c and
> > > > > see
> > > > > below)
> > > > > and can carry the fix as necessary. This is now fixed as far
> > > > > as
> > > > > linux-next
> > > > > is concerned, but any non trivial conflicts should be
> > > > > mentioned
> > > > > to
> > > > > your
> > > > > upstream maintainer when your tree is submitted for
> > > > > merging.  You
> > > > > may
> > > > > also want to consider cooperating with the maintainer of the
> > > > > conflicting
> > > > > tree to minimise any particularly complex conflicts.
> > > > 
> > > > This was expected.  The SELinux changes went through the
> > > > SELinux
> > > > tree
> > > > and the referenced patches touch the same code.  Your fix is
> > > > correct.
> > > 
> > > Sorry Doug, but it is not expected at all for the code which will
> > > go
> > > to 4.14.
> > 
> > Who said anything about 4.14?  The merge window is not closed, and
> > a
> > current for-next tag need not represent code intended for
> > 4.14.  That
> > switchover doesn't happen until the merge window closes (and for
> > many
> > trees, a couple rc cycles past the merge window closing).
> 
> Really, "couple"?
> Your tree contains enormous amount of code, you was listed as one of
> top-pusher,
> and you still behave like your tree has one or two patches in the
> cycle.
> 
> All major trees with similar volume of patches are doing incremental
> development and not "one-time" shots.

I *did* do incremental development.  By LOC count, 3/4 of what's in my
current tree was there since back in June.  And I grabbed it and
started working on it as soon as I was told that the patch I was
waiting on, from your company, was finally in DaveM's tree so I could
finally pull a net-next starting point upon which to base your patches
on.  Once I had that starting point, I started taking code.  I started
with the Intel stuff this time since I started with Mellanox stuff last
time.

Or do you not remember that email conversation?  If not, I'll refresh
your memory (paraphrased):

Me: Are we ready to go yet, I pulled DaveM's net-next today? <- 6/14
You: Not quite yet.  Today's net-next is enough for two of three
conflicting patches, but to fix the third you need another one.
Me: OK, send it quickly.
You: We'll submit it right away. (and you didn't Cc: me or linux-rdma
on the patchset so I didn't see any of it)
<time passes>
Me: Hey, did you ever get that patch in? <- this was on 6/25
You: Oh, yeah, here's the commit hash. <- this was on 6/25 too

Then if you look in my tree, the hfi patches start here:

Commit:     Doug Ledford <dledford@redhat.com>
CommitDate: Tue Jun 27 16:56:33 2017 -0400

Now, Linus and I have already talked about this off list some, and one
of the things that will help with this is if I don't even try to merge
up all of my branches into one branch.  This way I can start branches
for people that don't have dependencies on Dave's tree as soon as I
want to.  The downside of this is that we won't necessarily have a
fully merged up tree to test against during development.

But, what's making me mad about this email exchange right now is that
you and your company routinely ask me to hold off until you have stuff
in Dave Miller's tree and then want me to do all of my work after that
and before the next merge window, and then you complain that I'm not
doing things as a continuous development process.  Look at the dates
above.  When I asked, and it wasn't ready, was 6/14.  Linus opened the
merge window on 7/3, which was not even three weeks later.  I didn't
get final notice that it *was* ready until 6/25, right at one week
before the merge window opened.

So, you need to take your pick.  Do you want continuous development, or
do you want me bending over backwards to try and avoid your company's
endless stream of conflicts so Linus isn't yelling about that?  But
complaining at me on a public list when you left me only one week to do
my work (even though I thought I had two) just doesn't cut it for me.

> > > Both patches in question were targeted for 4.13 and you was
> > > expected
> > > to
> > > see the merge conflicts during last month or so, prior to merge
> > > window of 4.13.
> > > 
> > > In 4.14, you should base your tree on Linus's tree and don't have
> > > ANY
> > > conflicts in your subsystem, between ANY subsystems and
> > > especially
> > > Linus, so we will be able to develop and test.
> > 
> > I'm sure for 4.14 that will be the issue.  I didn't put this tag on
> > my
> > 4.14 intended work.  I considered this patch series suitable as
> > possible -rc fixes, so it is under a for-next tag for now to get
> > the
> > for-next testing (which is not much different than a local merge
> > test
> > right now, what it does in addition to a local merge test is catch
> > the
> > situation where some other pending patches and this conflict).
> 
> I don't get it, linux-next is much more than simple merge test. The
> overall
> goal of linux-next is to allow other people to test it BEFORE it hits
> Linus.
> 
> We want to run our verification on it and catch bugs BETWEEN
> subsystems
> (RoCE, iWARP and IPoIB for netdev vs. rdma) in advance and not after.

Sure.  And by LOC count, 75% of my current branch has been in for-next
for weeks.  Only the patches I deemed as possible -rc candidates are
newly added.

> > 
> > > For me, this merge conflict puts a large sign, that your tree is
> > > not
> > > ready for 4.14.
> > > 
> > > Please base your tree on Linus's tree.
> > 
> > Two things here.  First, no one, and I mean *NO ONE*, bases their
> > for-
> > next branch on a middle of the merge window version of Linus' tree.
> > Second, I would be happy to base my work on a suitable base kernel
> > version from Linus' tree from now on (such as -rc2).  Please do
> > *NOT*
> > send me another patch set that requires I sync up from net-next in
> > order to make things work, because, as you say, I should sync up to
> > Linus' tree.
> 
> Really? Are you comparing base point of 4.14 development with your
> stalled
> for weeks branches?

Check the email record Leon.  He who stalls me is not the right person
to be bitching about me being stalled.

> Start to work incrementally, update your branches constantly and such
> requests will disappear, so we will be able to plan and not to guess.

I got your notice that the proper commit hash was ready in DaveM's
tree, I started with hfi1, I then switched to looking/working on the
-rc kernels, then there was a Holiday, then there was one last patch
for -rc that I was waiting on to fix the IPoIB issue, but, as has
already been pointed out, while I was working on these -rc fixes, the
merge window had already opened unbeknownst to me.  So I made myself
look foolish for sending a pull request for an -rc cycle that was
already closed.  After that, I tried to get my work on the for-next
branch done quickly, but because it wasn't done prior to July 3rd,
which really means June 30 because July 3rd was really only a partial
day because of the holiday on July 4th in the US, Linus rejected all of
it.  But go back and check those dates Leon.  I had 5 days from the
time you got me the commit hash to complete everything.  If I had known
that the -rc cycle was closed I probably could have gotten it all done,
but I wasted time on the wrong kernel, sorry.  But you have no right to
complain with these dates being what they are when they are that way
because of working with your needs.

> I respect your hard work and what you are doing, but struggling to
> understand
> why don't you want to make it more effective and less error prone.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
