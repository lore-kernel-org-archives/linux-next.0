From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 10 Sep 2013 15:35:04 -0700
Message-ID: <CA+55aFwiK+=7N3EDoX+s8dVCoraba9bCPrgqHgsMKppogEFBnw@mail.gmail.com>
References: <20130910143807.4c32d548e08d2184061f52cb@canb.auug.org.au>
	<20130910152753.662599171456233c5f91edb4@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:56689 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256Ab3IJWfG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Sep 2013 18:35:06 -0400
In-Reply-To: <20130910152753.662599171456233c5f91edb4@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Chinner <dchinner@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>

On Tue, Sep 10, 2013 at 3:27 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> This is rather a fiasco.  "vfs: reorganize dput() memory accesses" made
> rather a mess of a 46 patch series which has been under development and
> test for two cycles so far.

Andrew, *please* don't do the insane rebasing you keep on doing.

Nobody else does that, and it adds more work for you, and makes your
patch bombs be untimely.

And I'll be honest, I don't care about the "more work for you" part,
since I don't really see it, but I do care about the "untimely" part.
That's the one that affects me. For example, I'm traveling starting
Friday, so I'll close the merge window on the road (linuxCon US next
week, a weekend of diving before that). It would be much nicer if I
have almost nothing pending before I leave.

And quite frankly, there is absolutely nothing that touches
fs/dcache.c that should be in your tree anyway, as far as I can tell.

But seriously - don't do the constant rebasing. I tell the git people
that, because I hate how it actually dilutes the value of any testing
they did. The fact that you rebase to the day you send the patches is
actually taking *away* value from what you do, and it adds a lot of
work for you.

So I'd (once again) suggest you base your pile of patches on the
previous stable kernel, and that linux-next take it *first* rather
than take it last.

             Linus
