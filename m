From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Jan 7 (rcutorture)
Date: Mon, 7 Jan 2013 19:53:48 -0800
Message-ID: <20130108035348.GF2525@linux.vnet.ibm.com>
References: <20130107142649.c843e0b711532dc3a631e4cf@canb.auug.org.au>
 <50EB252C.4010005@infradead.org>
 <20130107221627.GZ2525@linux.vnet.ibm.com>
 <20130108095959.98d83d91dbd0e9e1ac023373@canb.auug.org.au>
 <1357600327.5190.13.camel@gandalf.local.home>
 <1357605379.5190.15.camel@gandalf.local.home>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:40358 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523Ab3AHDxy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jan 2013 22:53:54 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 7 Jan 2013 20:53:53 -0700
Content-Disposition: inline
In-Reply-To: <1357605379.5190.15.camel@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 07, 2013 at 07:36:19PM -0500, Steven Rostedt wrote:
> On Mon, 2013-01-07 at 18:12 -0500, Steven Rostedt wrote:
> > On Tue, 2013-01-08 at 09:59 +1100, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > On Mon, 7 Jan 2013 14:16:27 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > > >
> > > > On Mon, Jan 07, 2013 at 11:42:36AM -0800, Randy Dunlap wrote:
> > > > > 
> > > > > on i386 or x86_64:
> > > > > 
> > > > > ERROR: "trace_clock_local" [kernel/rcutorture.ko] undefined!
> > > > 
> > > > Hello, Randy,
> > > > 
> > > > Did your build include the following, also pushed to -next in that same
> > > > batch from -rcu?  Including Steven Rostedt on CC for his take.
> > > 
> > > That commit was certainly in next-20130107.
> > 
> > Could be bad config dependencies.
> 
> Paul,
> 
> You need to also select TRACE_CLOCK if you are going to use it.

Thank you, Steve!

Randy, does the following patch help?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ce75d3b..b0fe7bd 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1010,6 +1010,7 @@ config RCU_CPU_STALL_INFO
 config RCU_TRACE
 	bool "Enable tracing for RCU"
 	depends on DEBUG_KERNEL
+	select TRACE_CLOCK
 	help
 	  This option provides tracing in RCU which presents stats
 	  in debugfs for debugging RCU implementation.
