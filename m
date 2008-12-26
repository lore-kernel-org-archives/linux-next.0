From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUG] next-20081216 - WARNING: at kernel/smp.c:333
	smp_call_function_mask
Date: Fri, 26 Dec 2008 14:33:54 +0100
Message-ID: <20081226133354.GC29265@elte.hu>
References: <86802c440812190351q3118516aif664dd5869c21b2a@mail.gmail.com> <20081219134636.GA11772@linux.vnet.ibm.com> <494C0BF0.3080109@kernel.org> <20081223132127.GA5450@linux.vnet.ibm.com> <495153A4.5060201@kernel.org> <20081224163400.GA11562@linux.vnet.ibm.com> <49529CE1.4040005@kernel.org> <20081226091217.GA5100@linux.vnet.ibm.com> <4954AC7B.3020603@kernel.org> <20081226102716.GA31450@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:57881 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751614AbYLZNfM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Dec 2008 08:35:12 -0500
Content-Disposition: inline
In-Reply-To: <20081226102716.GA31450@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Yinghai Lu <yinghai@kernel.org>, David Howells <dhowells@redhat.com>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mel@csn.ul.ie


* Sam Ravnborg <sam@ravnborg.org> wrote:

> On Fri, Dec 26, 2008 at 02:05:47AM -0800, Yinghai Lu wrote:
> > Kamalesh Babulal wrote:
> > > * Yinghai Lu <yinghai@kernel.org> [2008-12-24 12:34:41]:
> > > 
> > >> --
> > > 
> > > After the applying the patch, the kernel panic's with the same backtrace. The
> > > box is running Fedora 5 on it.
> > > 
> > 
> > please try...
> > Ingo, do we need to switch to use #idef and inline function instead?
> 
> I recall David Howells had a similar issue with the bootparamter patch set.
> The workaround he used was to add a barrier(); call in the weak function
> to avoid the inline.

could we add some extra attribute to __weak that would have a similar 
effect? Something like __attribute__((noinline)), or something silly like 
__attribute__((deprecated)) - just to keep gcc from screwing up __weak 
functions? Perhaps adding a section attribute would have a similar effect? 
(putting weak definitions into an extra section is probably helpful 
anyway)

	Ingo
