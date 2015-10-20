From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: no releases after tomorrow for 10 days (Was: Linux
 4.3-rc6)
Date: Wed, 21 Oct 2015 10:31:13 +1100
Message-ID: <20151021103113.29534482@canb.auug.org.au>
References: <CA+55aFzxNK9_0TrVbgCfPA5dj1KY3y15S0cyVGCLWs2cOp25aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53708 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750910AbbJTXbP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Oct 2015 19:31:15 -0400
In-Reply-To: <CA+55aFzxNK9_0TrVbgCfPA5dj1KY3y15S0cyVGCLWs2cOp25aQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hi Linus,

On Sun, 18 Oct 2015 16:45:42 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> Things continue to be calm, and in fact have gotten progressively
> calmer. All of which makes me really happy, although my suspicious
> nature looks for things to blame. Are people just on their best
> behavior because the Kernel Summit is imminent, and everybody is
> putting their best foot forward?
> 
> Or maybe this just ended up being one of those rare painless releases
> when nothing bad happens.
> 
> That would be lovely.

I will be away from linux-next starting Friday until Monday week (i.e.
Nov 2) attending Kernel Summit and taking a short break.  Two of my
past victims/helpers will also be at Kernel Summit.

So if you do the usual -rc7 (this Sunday) then release (a week later),
there will be no linux-next releases during that time.   If this is
seen as a problem, you could delay the release, or suprise everyone and
release this weekend :-)

I suspect a reasonable amount of code for v4.4 is still pending as we
only have ~8500 commits in linux-next so far (and nothing in the vfs
tree for example).  I would expect about 10000 commits in a normal
release.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
