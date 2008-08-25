From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 12:46:09 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0808251245400.23923@gandalf.stny.rr.com>
References: <20080825130117.33fe34bc.sfr@canb.auug.org.au> <20080825060934.GB14993@elte.hu> <alpine.DEB.1.10.0808251239530.23923@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:55299 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754025AbYHYQqP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 12:46:15 -0400
In-Reply-To: <alpine.DEB.1.10.0808251239530.23923@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org




On Mon, 25 Aug 2008, Steven Rostedt wrote:
> > 
> > ok. The binutils i've used for testing is 2.18 and this is indeed a new 
> > option since 2.17. Steve?
> 
> 
> Ouch! I didn't realize that.
> 
> OK, I can test to see if objdump is >= version 2.18 and if it is not, I 
> can simply not mark those functions. The current mcount for MCOUNT_RECORD 
> is simply a "ret". No saving of registers or anything.

>= 2.17?

Hmm, I need to find a box with an old version of objcopy.

-- Steve
