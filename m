From: "stephane eranian" <eranian@googlemail.com>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Wed, 26 Nov 2008 09:32:03 +0100
Message-ID: <7c86c4470811260032n64d69b04w5762e5f6cbd0cff9@mail.gmail.com>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au>
	 <20081125102234.GA4281@elte.hu>
	 <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com>
	 <20081125153345.GA20733@elte.hu>
	 <7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com>
	 <20081125165118.GF22504@elte.hu>
	 <20081126140032.72d86f17.sfr@canb.auug.org.au>
	 <20081126033318.GE8242@elte.hu>
Reply-To: eranian@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.158]:33292 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958AbYKZIcH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2008 03:32:07 -0500
Received: by fg-out-1718.google.com with SMTP id 19so238461fgg.17
        for <linux-next@vger.kernel.org>; Wed, 26 Nov 2008 00:32:04 -0800 (PST)
In-Reply-To: <20081126033318.GE8242@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>

Ingo,

On Wed, Nov 26, 2008 at 4:33 AM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> > In any case, until that happens and until there's agreement with
>> > the x86 maintainers (there's none at the moment) the perfmon3 tree
>> > (or at least its x86 bits) needs to be removed from linux-next. I
>> > already see a number of problems with the patchset that we'll have
>> > to work out via an iterative review process.
>>
>> That process has been happening except it seems that the x86
>> maintainers haven't bothered to participate. [...]
>
> uhm, that's plain not true. There are three x86 maintainers and we
> take pride in replying to all x86 patch submission within a day
> typically, so i reject your suggestion.
>
> We know and knew about the existence of the perfmon patches, but they
> were always in the vague RFC category and never directly submitted or
> Cc:-ed to us.
>
As Stephen pointed out, the full patchset was posted on LKML in October
I never saw any comments from you or any other x86 maintainers. I always
assumed you were ALL on LKML anyway.

The perfmon patchset has been posted on LKML numerous times. I have
listened to all comments and made tons of changes both internally and to
the syscall APIs. I would not call this patchset a 'vague RFC'.


> The authors of those patches never even bothered to Cc: the x86 arch
> maintainers, and never asked for those patches to be Ack-ed, accepted
> or reviewed. If that is not so, please show me the lkml link that
> contradicts my claim.
>
You were cc'ed but apparently there is a problem with the script I am using
to post this patchset as it seems it was sent only to LKML and the cc-list
got dropped.

>
> All i'm asking for is to not use linux-next as a backdoor to get
> _unreviewed_ and _clearly bad_ patches behind the back of architecture
> maintainers who specifically asked to be involved.
>
I would appreciate if you could explain and point me to the x86 code which
you think is bad. I am always happy to take constructive comments to
improve the code.

I have reposted the full patchset yesterday on LKML but unfortunately my
script dropped the cc-list. I will repost today making sure x86@kernel.org
is cc'ed. I am sorry about that, it never was intentional. I will be waiting for
your feedback on the x86 code.
