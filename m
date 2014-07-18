From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 18 Jul 2014 13:15:17 -0700
Message-ID: <53C98055.5070301@zytor.com>
References: <20140718150005.73db8eb9@canb.auug.org.au> <53C97287.5020509@zytor.com> <CALCETrXs4fdKDA1C4ts3qzgbB6PrmCZZyK3R4cBLaO9RbBp0YA@mail.gmail.com> <53C97E0F.6090601@zytor.com> <CALCETrXP+Rz8wi_N2G7WLwnGuFMC8zeo5o+jgGmvpZkndrM+2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:43440 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757110AbaGRUP4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2014 16:15:56 -0400
In-Reply-To: <CALCETrXP+Rz8wi_N2G7WLwnGuFMC8zeo5o+jgGmvpZkndrM+2Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On 07/18/2014 01:08 PM, Andy Lutomirski wrote:
> 
> i isn't an index in to the syms array at all.  This code is completely
> wrong.  See the patch I sent in reply to Stephen's original email.
> 
> But, to your earlier point, presumably this could warn:
> 
> for (int i = 0; i < 10; i++)
>   if (array[i] > array[5] + 1)
>     fail();
> 
> I think that's absurd.  There's nothing wrong with that code.  A given
> test should have to be always true or always false on *all* loop
> iterations to be flagged, I think.
> 

No, the issue is that gcc is telling you that the code will do the wrong
thing in this case.  Yes, only for one iteration, but still.

The reason this is a concern is that: (x > x + n) and its variants is
often used to mean (x > INT_MAX - n) without the type knowledge, but
that is actually invalid standard C because signed types are not
guaranteed to wrap.

	-hpa
