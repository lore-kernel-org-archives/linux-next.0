From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Jan 7 (rcutorture)
Date: Mon, 07 Jan 2013 19:36:19 -0500
Message-ID: <1357605379.5190.15.camel@gandalf.local.home>
References: <20130107142649.c843e0b711532dc3a631e4cf@canb.auug.org.au>
	 <50EB252C.4010005@infradead.org> <20130107221627.GZ2525@linux.vnet.ibm.com>
	 <20130108095959.98d83d91dbd0e9e1ac023373@canb.auug.org.au>
	 <1357600327.5190.13.camel@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:19338 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754628Ab3AHAgV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jan 2013 19:36:21 -0500
In-Reply-To: <1357600327.5190.13.camel@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: paulmck@linux.vnet.ibm.com, Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-01-07 at 18:12 -0500, Steven Rostedt wrote:
> On Tue, 2013-01-08 at 09:59 +1100, Stephen Rothwell wrote:
> > Hi Paul,
> > 
> > On Mon, 7 Jan 2013 14:16:27 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > >
> > > On Mon, Jan 07, 2013 at 11:42:36AM -0800, Randy Dunlap wrote:
> > > > 
> > > > on i386 or x86_64:
> > > > 
> > > > ERROR: "trace_clock_local" [kernel/rcutorture.ko] undefined!
> > > 
> > > Hello, Randy,
> > > 
> > > Did your build include the following, also pushed to -next in that same
> > > batch from -rcu?  Including Steven Rostedt on CC for his take.
> > 
> > That commit was certainly in next-20130107.
> > 
> 
> Could be bad config dependencies.
> 

Paul,

You need to also select TRACE_CLOCK if you are going to use it.

-- Steve
