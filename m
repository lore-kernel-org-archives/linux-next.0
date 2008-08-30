From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: rcu build warnings
Date: Sat, 30 Aug 2008 07:38:12 -0700
Message-ID: <20080830143812.GH7107@linux.vnet.ibm.com>
References: <20080829191948.95cde73f.sfr@canb.auug.org.au> <20080829144200.GB6725@linux.vnet.ibm.com> <20080830154411.62615e9b.sfr@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:54339 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971AbYH3OiP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Aug 2008 10:38:15 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m7UEcEwu005580
	for <linux-next@vger.kernel.org>; Sat, 30 Aug 2008 10:38:14 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m7UEcEJX213496
	for <linux-next@vger.kernel.org>; Sat, 30 Aug 2008 08:38:14 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m7UEcCfY001757
	for <linux-next@vger.kernel.org>; Sat, 30 Aug 2008 08:38:13 -0600
Content-Disposition: inline
In-Reply-To: <20080830154411.62615e9b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Sat, Aug 30, 2008 at 03:44:11PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Fri, 29 Aug 2008 07:42:00 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> >
> > Commit 0cd418ddb1ee88df7d16d5df06cb2da68eceb9e4 from linux-2.6-tip in the
> > tip/core/rcu section addresses this problem.  Please accept my apologies
> > for the hassle!!!
> 
> Not a real hassle, I just point out warnings from my builds to people
> when I get bored. :-)
> 
> I assume that patch will make it into linux-next at some point.

Might be a good time to move it ahead.  ;-)

Hmmm...  Should I ask the git developers about some way of marking
commits as being interdependent?  "Don't take commit #1 unless you also
take commit #2?"

							Thanx, Paul
