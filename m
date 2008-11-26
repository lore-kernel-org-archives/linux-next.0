From: "stephane eranian" <eranian@googlemail.com>
Subject: Re: linux-next: concerns over the perfmon3 tree
Date: Wed, 26 Nov 2008 14:25:08 +0100
Message-ID: <7c86c4470811260525m5bd691fbi4e067cd4ff60ee11@mail.gmail.com>
References: <20081126213449.ab269449.sfr@canb.auug.org.au>
	 <20081126104726.GA8580@elte.hu>
Reply-To: eranian@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.153]:58254 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751776AbYKZNZL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2008 08:25:11 -0500
Received: by fg-out-1718.google.com with SMTP id 19so309679fgg.17
        for <linux-next@vger.kernel.org>; Wed, 26 Nov 2008 05:25:09 -0800 (PST)
In-Reply-To: <20081126104726.GA8580@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, paulus@samba.org, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Ingo,

On Wed, Nov 26, 2008 at 11:47 AM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi Stephane,
>>
>> Given the concerns expressed by Ingo, I have dropped the perfmon3
>> tree from linux-next until they have been addressed.  Hopefully that
>> will not be loo long.  Let us all know how we can help with this.
>
> Thanks, we'll try to finish the review ASAP (today+tomorrow) so that
> it can be added back in 1-2 days. And it's sensible to keep it in the
> separate perfmon3 tree as well (as long as it's not rebased) - that's
> a convenient initial structure for new features.
>

I think I am missing something about rebasing. Are you saying you want
the patches to stay with the same tree until it is reviewed thoroughly? So
far I have used Linus' v2.6.28-rcXX tree as it evolves at a pace I can follow.
Is that okay?

> ( and the powerpc bits would be nice as well, they seem to be missing
>  from the current lineup - the more architectures keep hitting on
>  that code, the better the end result. )
>

The fully featured perfmon3 code (available as a branch of my kernel.org tree)
has all the architectures we currently support. There is some overlap with the
patchset posted on LKML. I focused on x86 because this is the key architecture
with a lot of demands. It should not be very difficult to derive the
powerpc patchset
from the fully featured git branch, same goes for MIPS, and SPARC. IA-64 will be
a bit more challenging because they already have a much older version
of perfmon2.
Switching IA-64 to perfmon3 now, would cause lots of perfmon2 features
to disappear
(e.g., sampling, system-wide).
