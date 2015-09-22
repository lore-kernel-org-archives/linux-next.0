From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Tue, 22 Sep 2015 09:39:22 -0700
Message-ID: <20150922163922.GV4029@linux.vnet.ibm.com>
References: <20150922153104.GA19024@node.dhcp.inet.fi>
 <201509221616.t8MGGIrW017239@ignucius.se.axis.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:55485 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758276AbbIVQj3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2015 12:39:29 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 22 Sep 2015 10:39:28 -0600
Content-Disposition: inline
In-Reply-To: <201509221616.t8MGGIrW017239@ignucius.se.axis.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>
Cc: kirill@shutemov.name, starvik@axis.com, linux@roeck-us.net, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, minchan@kernel.org, linux-cris-kernel@axis.com

On Tue, Sep 22, 2015 at 06:16:18PM +0200, Hans-Peter Nilsson wrote:
> > From: "Kirill A. Shutemov" <kirill@shutemov.name>
> > Date: Tue, 22 Sep 2015 17:31:04 +0200
> 
> > On Tue, Sep 22, 2015 at 08:18:35AM -0700, Paul E. McKenney wrote:
> > > On Tue, Sep 22, 2015 at 03:57:06PM +0200, Hans-Peter Nilsson wrote:
> > > > I guess you hit the right spot, but I'd think people would be
> > > > more comfortable with aligning to sizeof (void *).
> > > 
> > > I would indeed prefer sizeof(void *).
> > 
> > Do you prefer to have the attribute set for whole structure or for ->next?
> > I think attribute on ->next is more appropriate from documentation POV.
> 
> Speaking of the documentation POV, I'd recommend adding an
> explanatory comment.  Here's hoping this was obvious! ;)

What Hans-Peter said!  ;-)

							Thanx, Paul
