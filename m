From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: mmotm 2014-04-24-13-07 uploaded
Date: Tue, 29 Apr 2014 10:45:08 -0700
Message-ID: <20140429174508.GI8754@linux.vnet.ibm.com>
References: <20140427062650.GW4496@linux.vnet.ibm.com>
 <20140428135540.GA14661@linux.vnet.ibm.com>
 <535E8D14.7080405@infradead.org>
 <535E8E17.2050600@nod.at>
 <20140428200640.GG4430@linux.vnet.ibm.com>
 <535EBAE6.3080907@infradead.org>
 <20140428211535.GK4430@linux.vnet.ibm.com>
 <535F95FC.1020909@redhat.com>
 <20140429163604.GH8754@linux.vnet.ibm.com>
 <535FE1DB.2060601@redhat.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e32.co.us.ibm.com ([32.97.110.150]:52006 "EHLO
	e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932491AbaD2RpO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Apr 2014 13:45:14 -0400
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 29 Apr 2014 11:45:13 -0600
Content-Disposition: inline
In-Reply-To: <535FE1DB.2060601@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rik van Riel <riel@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, umgwanakikbuti@gmail.com

On Tue, Apr 29, 2014 at 01:31:07PM -0400, Rik van Riel wrote:
> On 04/29/2014 12:36 PM, Paul E. McKenney wrote:
> > On Tue, Apr 29, 2014 at 08:07:24AM -0400, Rik van Riel wrote:
> >> On 04/28/2014 05:15 PM, Paul E. McKenney wrote:
> >>> On Mon, Apr 28, 2014 at 01:32:38PM -0700, Randy Dunlap wrote:
> >>>> On 04/28/14 13:06, Paul E. McKenney wrote:
> >>
> >>>>> Please see below for a patch against next-20140428 that makes this build
> >>>>> for me.  This is derived from Rik's patch, my patch, and is consistent with
> >>>>> Arnd's patch.
> >>>>>
> >>>>> 							Thanx, Paul
> >>>>
> >>>> Thnx, works for me.  Finally.
> >>>
> >>> Good!
> >>>
> >>> Rik, how would you like to proceed with this?
> >>
> >> I guess this fix should go into -mm?
> > 
> > Andrew dropped the original patch, so a consolidated patch is needed.
> > I believe that something like the following is what we ended up with.
> > Does this look right to you?
> 
> That looks exactly like the one I have here :)

That is reassuring.  ;-)

							Thanx, Paul

> Andrew, should I send you the two patches?
> 
> -- 
> All rights reversed
> 
