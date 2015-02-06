From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code
 on offline CPU
Date: Fri, 6 Feb 2015 15:04:04 -0800
Message-ID: <20150206230404.GX5418@linux.vnet.ibm.com>
References: <20150206200653.009919583@goodmis.org>
 <CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
 <20150206213856.GN5418@linux.vnet.ibm.com>
 <CA+icZUWBJ5-0pyreVdTduaOPg8StccZhcu6=vdD_Zny8CCMZDw@mail.gmail.com>
 <20150206173548.48f53ed7@gandalf.local.home>
 <20150206224836.GU5418@linux.vnet.ibm.com>
 <CA+icZUWnT6o5aS+iRV7fLC95PXHjEyK8TDgUyWcG6bZU0yTX9w@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:46945 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754885AbbBFXEN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 18:04:13 -0500
Received: from /spool/local
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 6 Feb 2015 16:04:12 -0700
Content-Disposition: inline
In-Reply-To: <CA+icZUWnT6o5aS+iRV7fLC95PXHjEyK8TDgUyWcG6bZU0yTX9w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 06, 2015 at 11:51:19PM +0100, Sedat Dilek wrote:
> On Fri, Feb 6, 2015 at 11:48 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Fri, Feb 06, 2015 at 05:35:48PM -0500, Steven Rostedt wrote:
> >> On Fri, 6 Feb 2015 23:13:02 +0100
> >> Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >>
> >>
> >> > OK, so both patches go through Steve's tree.
> >>
> >> The second patch will require acks from those that maintain the files I
> >> touch.
> >
> > Yep, that is required either way.  I will give it an Acked-by in the hope
> > that this helps.  You have another version on the way, or have I lost
> > count?  ;-)
> 
> Working on x85 and probably using ed as $EDITOR, it will take some time.

The 8085, I remember it well!  And Cromemco's text editor, which seemed
quite fancy at the time.  But it would take some doing to fit a git
implementation into 64K of memory.  ;-)

							Thanx, Paul
