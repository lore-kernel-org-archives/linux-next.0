From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: Rebasing the edac-amd tree (Was: Re: linux-next: manual merge
 of the edac-amd tree with Linus' tree)
Date: Wed, 5 Aug 2009 09:42:08 +0200
Message-ID: <20090805074208.GD7732@liondog.tnic>
References: <20090805150933.103de233.sfr@canb.auug.org.au>
 <20090805062215.GA7732@liondog.tnic>
 <20090805164032.3cf9d95a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f217.google.com ([209.85.220.217]:64841 "EHLO
	mail-fx0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932937AbZHEHmO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2009 03:42:14 -0400
Content-Disposition: inline
In-Reply-To: <20090805164032.3cf9d95a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Hi,

On Wed, Aug 05, 2009 at 04:40:32PM +1000, Stephen Rothwell wrote:
> On Wed, 5 Aug 2009 08:22:15 +0200 Borislav Petkov <petkovbb@googlemail.com> wrote:
> >
> > thanks and yes, you're right. The former patch is less intrusive
> > and we opted for that one since it is really late in the -rc cycle
> > but the latter cleans up stuff so that code flow becomes much more
> > understandable. I'll rediff later and sorry for the inconvenience.
> 
> As an alternative to rebasing, you could merge Linus' current tree into
> yours and do the merge fixup there.  This is not particularly necessary,
> as the fixup is fairly simple.  Though you may want to do that sometime
> before you ask Linus to merge your tree.

that's what I'd normally do but I'm carrying some more patches which
have to go to -tip and I'd rather rebase to have a clean history and
all.

> > By the way, I see that you're merging edac-amd before tip and I'm going
> > to need to rebase my tree against tip in the next couple of days since
> > it depends on a bunch of stuff in it, so could you please switch the
> > merge order of the two trees so that edac-amd goes after tip?
> 
> Again, instead of rebasing, you could just merge in the branches from tip
> that you depend on. You need to make sure that you only depend on stable
> (i.e. non rebasing) branches in the tip tree, not on the branch
> (auto-latest) that is actually merged into linux-next.  Please discuss
> this with Ingo.

Yep, it happened yesterday.

> 
> I will move the edac-amd tree to after the tip tree tomorrow.

Thanks.

-- 
Regards/Gruss,
    Boris.
