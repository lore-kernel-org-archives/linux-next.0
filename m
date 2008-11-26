From: "H. Peter Anvin" <hpa@zytor.com>
Subject: RE: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 20:24:39 -0800
Message-ID: <200811260423.mAQ4NAae023517@terminus.zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:54177 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbYKZEZV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 23:25:21 -0500
content-class: 
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: eranian@gmail.com, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>

I guess it really comes down to: is -next a merge window preview tree, or is it another -mm tree just based on a different toolset/workflow?

    -hpa

-- 
Sent from my mobile phone (pardon any lack of formatting)


-----Original Message-----
From: Ingo Molnar <mingo@elte.hu>
Sent: Tuesday, November 25, 2008 19:33
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: eranian@gmail.com; linux-next@vger.kernel.org; Alexander van Heukelum <heukelum@mailshack.com>; the arch/x86 maintainers <x86@kernel.org>; H. Peter Anvin <hpa@zytor.com>; Thomas Gleixner <tglx@linutronix.de>; Peter Zijlstra <a.p.zijlstra@chello.nl>; Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the perfmon3 tree


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > In any case, until that happens and until there's agreement with 
> > the x86 maintainers (there's none at the moment) the perfmon3 tree 
> > (or at least its x86 bits) needs to be removed from linux-next. I 
> > already see a number of problems with the patchset that we'll have 
> > to work out via an iterative review process.
> 
> That process has been happening except it seems that the x86 
> maintainers haven't bothered to participate. [...]

uhm, that's plain not true. There are three x86 maintainers and we 
take pride in replying to all x86 patch submission within a day 
typically, so i reject your suggestion.

We know and knew about the existence of the perfmon patches, but they 
were always in the vague RFC category and never directly submitted or 
Cc:-ed to us.

The authors of those patches never even bothered to Cc: the x86 arch 
maintainers, and never asked for those patches to be Ack-ed, accepted 
or reviewed. If that is not so, please show me the lkml link that 
contradicts my claim.

And how did we notice that this was going on? Not because we were 
told, but due to a bad perfmon commit modifying x86 code that suddenly 
showed up in linux-next ...

> [...] If, as you say, all the x86 parts have to go via the x86 tree, 
> then be aware that this woukd probably delay x86 perfmon integration 
> until 2.6.30 or later [...]

Why should that be so?

All i'm asking for you is to follow the upstream kernel integration 
process. All i'm asking you is when a new tree matches such a wide 
pattern of x86 modifications:

       25 files changed, 2340 insertions(+), 6 deletions(-)

_to at least Cc: the maintainers and ask their opinion_

this isnt just a file here and there. It goes straight into the guts 
of the architecture.

All i'm asking for is to not use linux-next as a backdoor to get 
_unreviewed_ and _clearly bad_ patches behind the back of architecture 
maintainers who specifically asked to be involved.

> [...] (*cough* ftrace *cough*). [...]

I'm not sure what you want to imply by that. ftrace was delayed for 
several kernel releases before it went upstream and the initial port 
went upstream with the full knowledge (and participation) of the 
architecture maintainers. (x86, incidentally)

> [...] As Andrew pointed out in another thread you seem to have 
> missed, the integration of perfmon (or something like it) is way 
> over due.  The way he suggested to go forward was to get it into 
> linux-next and aim for 2.6.29 integration.
>
> Several other architectures want this code in the kernel, so if they 
> have to wait for the x86 maintainers to decide what they want, then 
> the only way forward may be to separate the generic parts of the 
> code and get that integrated along with one of the other 
> architectures.

There's a proper process for merging brand new features, and it starts 
with asking the opinion of the maintainers. This isnt just a random 
stale subsystem no-one is interested in. This is a highly active piece 
of code maintained by three maintainers. This subsystem saw more than 
5800 commits in the last year alone.

Stephen, this is kernel maintenance 101, and you must follow it.

	Ingo
