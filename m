From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 13:52:10 +0200
Message-ID: <20080813115210.GD18660@elte.hu>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au> <20080813073205.GA398@elte.hu> <48A28DD9.7010108@cs.helsinki.fi> <20080813075808.GA11645@elte.hu> <1218615288.7813.310.camel@penberg-laptop> <20080813085800.GF23417@elte.hu> <1218627433.7813.320.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34330 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752700AbYHMLwg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 07:52:36 -0400
Content-Disposition: inline
In-Reply-To: <1218627433.7813.320.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> Hi Ingo,
> 
> On Wed, 2008-08-13 at 10:58 +0200, Ingo Molnar wrote:
> > what's your current workflow, what causes the sha1's for commits to 
> > change frequently? Do you work with patches (i.e. it's not really a Git 
> > workflow at all and you regenerate the git tree all the time you export 
> > it from your patch queue), or do you perhaps git-rebase often to clean 
> > up patches?
> 
> No, I don't work with patches. A lot of the churn comes from the fact 
> that I have been dropping and re-applying SLUB defrag patches from 
> Christoph lately. I keep them in a topic branch and pull them for my 
> 'for-next' branch that appears in linux-next.
> 
> The basic workflow for me is as follows:
> 
>   - Whenever someone sends me a patch, I apply it to my 'testing' 
>     branch, do a little bit testing there and if everything seems fine,
>     I pull the branch to my 'for-next' branch.
> 
>   - After few days, I pull (or cherry pick) the patches to 'for-linus' 
>     branch and ask Linus to pull. Whenever he pulls, I usually rebase 
>     all of my branches to Linus' master.
> 
>   - For development, I maintain topic branches that are _not_ 
>     append-only (such as SLUB defrag and kmemtrace). Whenever something 
>     changes there I do a git-reset --hard on 'for-next' and re-pull the 
>     topic branches there.
> 
>   - Also, I usually rebase my whole tree after an -rc release or two 
>     just to keep my tree in-sync with mainline. That usually doesn't 
>     affect my patches at all.
> 
> So AFAICT most of the changes to SHA1s are due to me doing development 
> in the topic branches and recreating the 'for-next' branch.

seems pretty sane to me. We use something quite similar in -tip, with 
the distinction that after a very short initial period [a few days at 
most] we try to keep development branches append-only as well.

There are 5 main advantages of doing that:

- trust: the end result, despite being a slighly bit messy, is easier to 
  trust. The commits are in true historic order, development activities 
  and timeline is easy to review.

- integration: creating the next branch is just a matter of doing an 
  incremental git-merge.

- guaranteed no-brains preservation of information: no patch is lost 
  ever in a pure append-only flow. Doing a git-reset --hard anytime 
  always risks the loss of patches - and even if only history is lost, 
  that is valuable too most of the time. Whenever i do it i have to use 
  additional safeguards against the loss of patches.

- bisection quality: statistically, the newest commits tend to have
  the most bugs. By doing delta patches - even if the end result is a 
  higher patch count - makes the risky portion of a stream of 
  append-only changes drastically smaller. [this assumes that there is 
  an adequate QA effort and that commits do not just sit there unused: 
  that the topic branch is tested well enough and is exposed to others 
  via linux-next, etc.]

- other contributors: derived work (people basing trees off topic 
  branches) do not get sha1's pulled from under their feet. Back/forth 
  merging is easy. Having history of development in a tree (as long as 
  it's not totally insane history) is beneficial in general.

btw., when you send something to Linus and he pulls, generally you dont 
have to rebase/reset to 'clean up the house' - as long as you dont 
cherry-pick into the release branch. A "git-merge linus/master" will 
fast-forward your topic branch and will turn it into a pure 
upstream-based branch.

	Ingo
