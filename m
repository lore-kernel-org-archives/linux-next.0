From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: manual merge of the security-testing tree with the
 tree
Date: Thu, 30 Jun 2011 11:52:17 -0700
Message-ID: <7v4o37qhi6.fsf@alter.siamese.dyndns.org>
References: <20110630142910.2fea4257.sfr@canb.auug.org.au>
 <20110630072559.GA4048@pengutronix.de>
 <20110630193023.6056d48e.sfr@canb.auug.org.au>
 <20110630121710.GJ11559@pengutronix.de>
 <BANLkTi=usrsF60Popfu55v3_dXe7Yo0GrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=usrsF60Popfu55v3_dXe7Yo0GrA@mail.gmail.com> (Linus
 Torvalds's message of "Thu, 30 Jun 2011 09:20:35 -0700")
Sender: git-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, git@vger.kernel.org, Jeff King <peff@peff.net>
List-Id: linux-next.vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

> It would be lovely if "git show" (and log operations) had some option
> to do a "expensive merge check" and did actually figure out the common
> ancestor and at least took that into account.
>
> It would be doable to do it at least better than we do now - the
> common ancestor is not cheap to compute, but it's much cheaper than a
> full merge, and would at least allow us to flag dangerous merges. Of
> course, it gets fun when there are multiple common ancestors and
> renames. It's entirely possible that it's never going to be practical
> to do anything but "re-do the merge and compare result".

I would have to say that it would boil down to "re-do the merge" whichever
way we implement it, and it is not necessarily a bad thing.  

There are ideas to implement a mode of "git merge" that works entirely
in-core without touching the working tree (it may have to write temporary
blobs and possibly trees to the object store, though). It would let sites
like github to let its users accept a trivial pull request that can merge
cleanly on site in the browser without necessarily having to have a local
checkout used for conflict resolution.

If such an "in-core merge" feature is implemented cleanly in a reusable
way, it would be just the matter of comparing the output from it with the
actual committed result.

Of course, if the committed result was deliberately made by "-s ours",
comparison between an auto-merge result and the committed result would
produce a lot of noise, but that is really the point of "expensie merge
check", so the noise in that scenario is a feature, not a bug.
