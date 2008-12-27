From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUG] next-20081216 - WARNING: at kernel/smp.c:333
	smp_call_function_mask
Date: Sat, 27 Dec 2008 10:50:19 +0100
Message-ID: <20081227095019.GA8248@elte.hu>
References: <86802c440812190351q3118516aif664dd5869c21b2a@mail.gmail.com> <20081219134636.GA11772@linux.vnet.ibm.com> <494C0BF0.3080109@kernel.org> <20081223132127.GA5450@linux.vnet.ibm.com> <495153A4.5060201@kernel.org> <20081224163400.GA11562@linux.vnet.ibm.com> <49529CE1.4040005@kernel.org> <20081226091217.GA5100@linux.vnet.ibm.com> <4954AC7B.3020603@kernel.org> <3677.1230371218@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:36986 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752567AbYL0JvD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 27 Dec 2008 04:51:03 -0500
Content-Disposition: inline
In-Reply-To: <3677.1230371218@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Yinghai Lu <yinghai@kernel.org>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mel@csn.ul.ie


* David Howells <dhowells@redhat.com> wrote:

> Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > I recall David Howells had a similar issue with the bootparamter patch set.
> > The workaround he used was to add a barrier(); call in the weak function
> > to avoid the inline.
> 
> Yes I did.  Rusty's solution was just to move the default weak functions into
> different files.
> 
> Attempting to use the noinline attribute does not work.
> 
> Of course, you could just stick the functions into lib/ in separate .c 
> files and dispense with the weak attribute altogether.

the weak functions should be close to where the code that uses them is - 
not somewhere separate (where no-one will really be aware of their 
existence). So either we find a way to avoid such repeat bugs in the 
future, or we do away with weak functions altogether and go back to 
stone-age #ifdefs ;-)

I think we should get a Sparse check that detects empty void __weak 
functions?

	Ingo
