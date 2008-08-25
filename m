From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 12:42:10 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0808251239530.23923@gandalf.stny.rr.com>
References: <20080825130117.33fe34bc.sfr@canb.auug.org.au> <20080825060934.GB14993@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:42941 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526AbYHYQm2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 12:42:28 -0400
In-Reply-To: <20080825060934.GB14993@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


On Mon, 25 Aug 2008, Ingo Molnar wrote:

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > x86_64-unknown-linux-gnu-objcopy: unrecognized option `--globalize-symbol'
> > 
> > Introduced by commit 46483cdbb5dc06d84d9572bac1b90f6744c7fc95 ("ftrace:
> > create __mcount_loc section").
> > 
> > The currently documented minimum requirements for binutils is 2.12.
> > 
> > $ x86_64-unknown-linux-gnu-objcopy --version
> > GNU objcopy 2.16.1
> > 
> > For now I have reverted commit c2ffd56692cc4b762c175fad69b70a4ec0dfca3f
> > ("ftrace: enable using mcount recording on x86") since that is the least
> > intrusive thing to do and the above change depends on
> > CONFIG_FTRACE_MCOUNT_RECORD.
> 
> ok. The binutils i've used for testing is 2.18 and this is indeed a new 
> option since 2.17. Steve?


Ouch! I didn't realize that.

OK, I can test to see if objdump is >= version 2.18 and if it is not, I 
can simply not mark those functions. The current mcount for MCOUNT_RECORD 
is simply a "ret". No saving of registers or anything.

-- Steve
