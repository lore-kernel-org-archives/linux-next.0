From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 10:34:12 -0800
Message-ID: <20150205183412.GI5370@linux.vnet.ibm.com>
References: <20150205001019.GA12362@linux.vnet.ibm.com>
 <CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com>
 <20150205005716.GS5370@linux.vnet.ibm.com>
 <CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
 <20150205015144.GT5370@linux.vnet.ibm.com>
 <CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
 <54D3186F.7030500@sr71.net>
 <20150205130343.6ac0eda9@gandalf.local.home>
 <20150205130802.289a8be0@gandalf.local.home>
 <54D3B253.3050000@sr71.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e38.co.us.ibm.com ([32.97.110.159]:45083 "EHLO
	e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752702AbbBESeU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2015 13:34:20 -0500
Received: from /spool/local
	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 5 Feb 2015 11:34:19 -0700
Content-Disposition: inline
In-Reply-To: <54D3B253.3050000@sr71.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Hansen <dave@sr71.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, sedat.dilek@gmail.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On Thu, Feb 05, 2015 at 10:11:31AM -0800, Dave Hansen wrote:
> On 02/05/2015 10:08 AM, Steven Rostedt wrote:
> > --- a/include/trace/events/tlb.h
> > +++ b/include/trace/events/tlb.h
> > @@ -13,11 +13,13 @@
> >  	{ TLB_LOCAL_SHOOTDOWN,		"local shootdown" },		\
> >  	{ TLB_LOCAL_MM_SHOOTDOWN,	"local mm shootdown" }
> >  
> > -TRACE_EVENT(tlb_flush,
> > +TRACE_EVENT_CONDITION(tlb_flush,
> >  
> >  	TP_PROTO(int reason, unsigned long pages),
> >  	TP_ARGS(reason, pages),
> >  
> > +	TP_CONDITION(cpu_online(smp_processor_id())),
> 
> That's a pretty reasonable fix, although it would be nice if the
> debugging was easier to hit.

Looks very good to me!

Unless someone else speaks up, I will carry this patch.

>                               Did I actually need to be
> onlining/offlining CPUs to hit the splat that Sedat was reporting?

Yep, you do need to offline at least one CPU to hit that splat.

							Thanx, Paul
