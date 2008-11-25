From: "stephane eranian" <eranian@googlemail.com>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 17:36:56 +0100
Message-ID: <7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au>
	 <20081125102234.GA4281@elte.hu>
	 <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com>
	 <20081125153345.GA20733@elte.hu>
Reply-To: eranian@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.154]:42201 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbYKYQg6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 11:36:58 -0500
Received: by fg-out-1718.google.com with SMTP id 19so24374fgg.17
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 08:36:56 -0800 (PST)
In-Reply-To: <20081125153345.GA20733@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>

Ingo,


On Tue, Nov 25, 2008 at 4:33 PM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * stephane eranian <eranian@googlemail.com> wrote:
>
>> So I am not sure I understand your point about submitting the
>> changes to the x86 tree first.
>
> You are modifying x86 architecture files to enable a kernel feature on
> x86. Such feature enablement, if it's pushed into linux-next, must go
> via the arch maintainers.
>
> The x86 impact of the perfmon3 tree is substantial:
>
[snip]
>  25 files changed, 2340 insertions(+), 6 deletions(-)
>
> linux-next is not a development kernel - it is an integration tree
> simulating the next version of the upstream kernel and hence all trees
> that are in it must be synced up (and in this case, go via) their
> respective maintainers.
>
Perfmon3 as it exists in linux-next has two components: generic + x86
I can send x86@kernel.org the x86 specific patches to integrate them into
the x86 tree even though they would not be operational without the generic part.
But then, where do I send the generic code?

> Thanks,
>
>        Ingo
>
