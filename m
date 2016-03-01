From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 1 Mar 2016 10:45:32 +0100
Message-ID: <20160301094531.GA23893@gmail.com>
References: <20160301122910.74ff0a92@canb.auug.org.au>
 <20160301070750.GA6636@gmail.com>
 <CA+icZUUM9U4i0mZqyhLyBQApGNWAjx1EBY+C5RybPhO1NL+sGg@mail.gmail.com>
 <F86C52D5-02DB-441D-AC8B-FC5169CAF182@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33174 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752097AbcCAJpg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 04:45:36 -0500
Content-Disposition: inline
In-Reply-To: <F86C52D5-02DB-441D-AC8B-FC5169CAF182@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> That is not the issue here.  The problem is clearly that objtool is a host 
> program and not compiled with host cc.  So it is a good thing to test even 
> though it is weird, because it affects real use cases.

Absolutely, it's a real bug that should be fixed. What is counterproductive is 
that this rare and hard to replicate build modus is now a must-have test for 
linux-next inclusion.

I already cross-build to 20+ weird, rarely used architectures, slowing down the 
linux-next merge integration test immensely and wasting quite a bit of 
electricity. linux-next making it even harder to test for is a step backwards.

Thanks,

	Ingo
