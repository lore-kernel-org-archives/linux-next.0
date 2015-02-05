From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 15:22:01 -0500
Message-ID: <20150205152201.49d55905@gandalf.local.home>
References: <20150205005716.GS5370@linux.vnet.ibm.com>
	<CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
	<20150205015144.GT5370@linux.vnet.ibm.com>
	<CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
	<54D3186F.7030500@sr71.net>
	<20150205130343.6ac0eda9@gandalf.local.home>
	<20150205130802.289a8be0@gandalf.local.home>
	<54D3B253.3050000@sr71.net>
	<20150205183412.GI5370@linux.vnet.ibm.com>
	<54D3B7F5.9070209@sr71.net>
	<20150205184537.GJ5370@linux.vnet.ibm.com>
	<CA+icZUX_fi-O3kXymLCPfJ8Sx0yG=m5=pWzJDJpu-iHTyjM78Q@mail.gmail.com>
	<20150205145816.7c38a7df@gandalf.local.home>
	<CA+icZUUC7vD_FBUWV+WLBx2M-iXvR8E90zWGxmUWQcdmbHiH2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0146.hostedemail.com ([216.40.44.146]:56832 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751192AbbBEUWG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2015 15:22:06 -0500
In-Reply-To: <CA+icZUUC7vD_FBUWV+WLBx2M-iXvR8E90zWGxmUWQcdmbHiH2A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On Thu, 5 Feb 2015 21:07:27 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:

> > Is this Paul's version of the patch or mine? If it is just mine, do you
> > know if Paul's version triggers this too?
> >
> 
> This one which entered Pauls rcu-next tree.
> 
> [1] http://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=rcu/next&id=2b27cf7317d8a99a50bead9faccd54b46b6f0c41

That's mine.

It looks like the condition will be tested before it calls and rcu
code. Which is why I was confused that it still gave a splat. Paul
posted a patch before this that did the check outside the trace point.

This one:

 http://marc.info/?l=linux-kernel&m=142310961217650&w=2

> 
> >> ( I did not build from scratch but re-invoking make "updated" the
> >> files touched by Steven's patch, see attached build-log. )
> >>
> >> Unfortunately, the call-trace remains when doing an offlining of cpu1.
> >> ( It's good to see it's reproducible. )
> >
> > Was the tracepoint enabled? Or was there some other rcu call that
> > triggered this. Or would cpu_online(smp_processor_id()) return true at
> > this point?
> >
> 
> Thanks Steve for jumping into this one!
> 
> Good point.
> I looked at my kernel-config (which I already sent :-)).
> 
> Do I need to enable...?
> 
> # CONFIG_RCU_TRACE is not set
> 
> ...or even more?
>

What I meant by the tracepoint being enabled, was not that it was
configured in (I'm assuming it was), but that you started tracing?

 echo 1 > /sys/kernel/debug/tracing/events/enable

or

 echo 1 > /sys/kernel/debug/tracing/events/tlb/tlb_flushed/enable

-- Steve
