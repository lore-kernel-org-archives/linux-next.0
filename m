From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: git merges of tags
Date: Fri, 19 May 2017 11:30:55 -0700
Message-ID: <CA+55aFwaxsNZ0ACQkASdDTbSrdcHMJpFPtswK485tEWRBVVYrA@mail.gmail.com>
References: <20170519092202.6b0f9a57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170519092202.6b0f9a57@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Git Mailing list <git@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, May 18, 2017 at 4:23 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Just a reminder that if you are merging Linus' tree (or any tree
> really) via a tag, git was changed some time ago so that merging a tag
> will not do a fast forward (there is a good reason for this - I just
> can't recall it ATM).

The reason is that when you merge a signed tag, git squirrels away t
he signature into the merge commit, so that you can see and verify the
signage later (use "git log --show-signatures" to see the signatures
on the commits).

If you fast-forward, there isn't any new commit to add the signing data to.

> To do the fast forward, try "git merge <tag>^{}" ...

A slightly simpler syntax might be just "tag^0", but yes, the "^{}"
thing peels off any tags.

>   (unfortunately
> doing "git merge --ff <tag>" also does not do a fast forward - it also
> doesn't fail, it unexpectedly just creates a merge commit :-().

"--ff" is the default behavior, and means "allow fast forward", but
note that it is about "allowing", not "forcing".

You can use "--ff-only" to say that you will _only_ accept a
fast-forward, and git will error out  if it needs to create a merge.

                  Linus
