From: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Tue, 22 Sep 2015 18:16:18 +0200
Message-ID: <201509221616.t8MGGIrW017239@ignucius.se.axis.com>
References: <20150922153104.GA19024@node.dhcp.inet.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:36300 "EHLO
	bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933247AbbIVQQY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2015 12:16:24 -0400
In-reply-to: <20150922153104.GA19024@node.dhcp.inet.fi> (kirill@shutemov.name)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kirill@shutemov.name
Cc: paulmck@linux.vnet.ibm.com, starvik@axis.com, linux@roeck-us.net, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, minchan@kernel.org, linux-cris-kernel@axis.com

> From: "Kirill A. Shutemov" <kirill@shutemov.name>
> Date: Tue, 22 Sep 2015 17:31:04 +0200

> On Tue, Sep 22, 2015 at 08:18:35AM -0700, Paul E. McKenney wrote:
> > On Tue, Sep 22, 2015 at 03:57:06PM +0200, Hans-Peter Nilsson wrote:
> > > I guess you hit the right spot, but I'd think people would be
> > > more comfortable with aligning to sizeof (void *).
> > 
> > I would indeed prefer sizeof(void *).
> 
> Do you prefer to have the attribute set for whole structure or for ->next?
> I think attribute on ->next is more appropriate from documentation POV.

Speaking of the documentation POV, I'd recommend adding an
explanatory comment.  Here's hoping this was obvious! ;)

brgds, H-P
