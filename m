From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: linux-next: manual merge of the rseq tree with Linus' tree
Date: Thu, 16 Nov 2017 15:21:14 +0000 (UTC)
Message-ID: <2081439912.16582.1510845674173.JavaMail.zimbra@efficios.com>
References: <20171115153536.7fab87b7@canb.auug.org.au> <20171115080712.tehklwmcvol7iiic@gmail.com> <20171116014826.5228aa7c@canb.auug.org.au> <1489656964.15813.1510758032885.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.efficios.com ([167.114.142.141]:53814 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757959AbdKPPU0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Nov 2017 10:20:26 -0500
In-Reply-To: <1489656964.15813.1510758032885.JavaMail.zimbra@efficios.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>

----- On Nov 15, 2017, at 10:00 AM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> ----- On Nov 15, 2017, at 9:48 AM, Stephen Rothwell sfr@canb.auug.org.au wrote:
> 
>> Hi Ingo,
>> 
>> On Wed, 15 Nov 2017 09:07:12 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>>>
>>> There's absolutely no way such invasive x86 changes should be done outside the
>>> x86
>>> tree and be merged into linux-next.
>>> 
>>> linux-next should be for the regular maintenance flow, for changes pushed by
>>> maintainers and part of the regular maintenance process - not for
>>> work-in-progress
>>> features that may or may not be merged upstream in that form ...
>> 
>> Sure.  I was given the impression that Linus was going to be asked to
>> merge this tree during this merge window, so I assumed that it had been
>> seen by the appropriate people.  Most of these patches include you,
>> Linus and Andrew (among others) on their cc's and they seem to have
>> gone through several revisions.
>> 
>> I guess Mathieu has jumped the gun.
> 
> The membarrier core serializing command has been developed in the open
> since Aug. 27, 2017 [1]. That's one full development cycle. On Sept 28,
> 2017, I started CCing Ingo when I noticed I would have to add documentation
> to each architecture return-to-usermode paths [2]. I have never heard feedback
> from him until now.
> 
> I am open to remove the x86-specific membarrier core serializing patch from
> my tree and hand it to the x86 maintainers after the generic code makes it
> into Linus' tree, if this is seen as the appropriate way forward.

Hi Stephen,

fyi, I removed the core serializing membarrier commits from the
linux-rseq rseq/for-next branch. That work will indeed be postponed
to the 4.16 queue.

Thanks,

Mathieu

> 
> Thanks,
> 
> Mathieu
> 
> [1]
> http://lkml.kernel.org/r/20170827195404.22171-2-mathieu.desnoyers@efficios.com
> [2]
> http://lkml.kernel.org/r/911707916.20840.1506605496314.JavaMail.zimbra@efficios.com
> 
> 
>> 
>> I'll drop it again tomorrow.
>> 
>> --
>> Cheers,
>> Stephen Rothwell
> 
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
