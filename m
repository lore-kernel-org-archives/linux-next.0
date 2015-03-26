From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 19:54:20 +0100
Message-ID: <551455DC.4080604@de.ibm.com>
References: <20150326193112.2c87eb39@canb.auug.org.au> <20150326103442.GV21418@twins.programming.kicks-ass.net> <20150326132750.GA2805@arm.com> <20150326142220.GY21418@twins.programming.kicks-ass.net> <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com> <551440C5.8040104@de.ibm.com> <CA+55aFw6f4sLc4DMTmd2T9-r8NNQq8Zr4Wf1SvHSG=s1Vd-WuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:39143 "EHLO
	e06smtp11.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278AbbCZSy0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 14:54:26 -0400
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Thu, 26 Mar 2015 18:54:25 -0000
In-Reply-To: <CA+55aFw6f4sLc4DMTmd2T9-r8NNQq8Zr4Wf1SvHSG=s1Vd-WuA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>

Am 26.03.2015 um 18:52 schrieb Linus Torvalds:
> On Thu, Mar 26, 2015 at 10:24 AM, Christian Borntraeger
> <borntraeger@de.ibm.com> wrote:
>>
>> Oh I just added that check back then because some guy named
>> Linus suggested something like that ;-)
> 
> Yes, my bad.
> 
> In my defense, that was when we were talking about ACCESS_ONCE()
> causing bugs with gcc due to the blind use of "volatile" that it turns
> out gcc doesn't necessarily like.
> 
> With the memcpy fallback (and the simpler "scalar pointer copy by
> hand"), I think READ_ONCE() (and WRITE_ONCE()) are safe.
> 
>                       Linus
> 

FWIW, I dropped the warning fixp patch from my linux-next branch so
everything should be back to normal and we can merge Peters patch for 4.0 or
4.1.

Christian
