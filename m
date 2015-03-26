From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 10:52:02 -0700
Message-ID: <CA+55aFw6f4sLc4DMTmd2T9-r8NNQq8Zr4Wf1SvHSG=s1Vd-WuA@mail.gmail.com>
References: <20150326193112.2c87eb39@canb.auug.org.au>
	<20150326103442.GV21418@twins.programming.kicks-ass.net>
	<20150326132750.GA2805@arm.com>
	<20150326142220.GY21418@twins.programming.kicks-ass.net>
	<CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
	<551440C5.8040104@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:38129 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752094AbbCZRwD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 13:52:03 -0400
In-Reply-To: <551440C5.8040104@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>

On Thu, Mar 26, 2015 at 10:24 AM, Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
> Oh I just added that check back then because some guy named
> Linus suggested something like that ;-)

Yes, my bad.

In my defense, that was when we were talking about ACCESS_ONCE()
causing bugs with gcc due to the blind use of "volatile" that it turns
out gcc doesn't necessarily like.

With the memcpy fallback (and the simpler "scalar pointer copy by
hand"), I think READ_ONCE() (and WRITE_ONCE()) are safe.

                      Linus
