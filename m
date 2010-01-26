From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: add utrace tree
Date: Mon, 25 Jan 2010 16:07:21 -0800 (PST)
Message-ID: <alpine.LFD.2.00.1001251605320.3574@localhost.localdomain>
References: <f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com> <20100123112333.GA15455@elte.hu> <20100123114729.GA7828@redhat.com> <20100123194820.GM21263@thunk.org> <f73f7ab81001241742t1f827ddetd958e1949787020f@mail.gmail.com>
 <alpine.LFD.2.00.1001250845180.3574@localhost.localdomain> <20100125170254.GB22862@redhat.com> <alpine.LFD.2.00.1001250930320.3574@localhost.localdomain> <1264451453.3028.59.camel@springer.wildebeest.org> <alpine.LFD.2.00.1001251236160.3574@localhost.localdomain>
 <20100126000237.GA15936@cs.unibo.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:50710 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750773Ab0AZAJw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jan 2010 19:09:52 -0500
In-Reply-To: <20100126000237.GA15936@cs.unibo.it>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: Mark Wielaard <mjw@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, tytso@mit.edu, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>



On Tue, 26 Jan 2010, Renzo Davoli wrote:
> 
> The solution is that everybody can code his/her optimized kernel/user 
> interface for tracing in his/her kernel module, i.e. utrace.

I don't think people understand. That is simply not a "solution". That is 
a PROBLEM. The thing you describe is an absolute disaster. Which is 
exactly why I rant against it.

The last thing we want to have is "here, take this, and make your own 
kernel module mess around it optimized for your particular crazy 
scenario".

But every SINGLE post in this thread that has argued for utrace has argued 
exactly this way. 

			Linus
