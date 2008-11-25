From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 24 Nov 2008 23:31:33 -0500
Message-ID: <1227587493.7622.14.camel@localhost.localdomain>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
	 <1227584931.7622.11.camel@localhost.localdomain>
	 <20081125151345.3f0ed493.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:41372 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752911AbYKYEcR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 23:32:17 -0500
In-Reply-To: <20081125151345.3f0ed493.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


On Tue, 2008-11-25 at 15:13 +1100, Stephen Rothwell wrote:
> Hi Steve,
> 
> On Mon, 24 Nov 2008 22:48:51 -0500 Steven Rostedt <srostedt@redhat.com> wrote:
> >
> > Could you post a git branch that had this failure, so I can compile it
> > to see what happened?
> 
> ssh://master.kernel.org/~sfr/ftrace master
> 
> to get the failure, I did:
> 
> make ARCH=x86_64 allmodconfig
> make ARCH=x86_64 arch/x86/boot/tty.o
> 
> My machine is Debian sid.
> 
> $ gcc --version
> gcc (Debian 4.3.2-1) 4.3.2
> $ ld --version
> GNU ld (GNU Binutils for Debian) 2.18.0.20080103
> 
> The original failure was with a gcc 4.3.2 cross compiled for a powerpc
> host and a binutils 2.19.
> 
> You can see which trees are merged by looking for commits by me.

This may be a compiler bug, or something introduced by the compiler. I
compiled it fine first with gcc 4.0.2, but then tried with the same
compiler you used, and got the same error as you.

I'll look more at it.

Thanks,

-- Steve
