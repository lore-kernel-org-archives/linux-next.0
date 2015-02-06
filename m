From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code
 on offline CPU
Date: Fri, 6 Feb 2015 14:48:36 -0800
Message-ID: <20150206224836.GU5418@linux.vnet.ibm.com>
References: <20150206200653.009919583@goodmis.org>
 <CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
 <20150206213856.GN5418@linux.vnet.ibm.com>
 <CA+icZUWBJ5-0pyreVdTduaOPg8StccZhcu6=vdD_Zny8CCMZDw@mail.gmail.com>
 <20150206173548.48f53ed7@gandalf.local.home>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:52135 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757587AbbBFWss (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 17:48:48 -0500
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 6 Feb 2015 15:48:48 -0700
Content-Disposition: inline
In-Reply-To: <20150206173548.48f53ed7@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 06, 2015 at 05:35:48PM -0500, Steven Rostedt wrote:
> On Fri, 6 Feb 2015 23:13:02 +0100
> Sedat Dilek <sedat.dilek@gmail.com> wrote:
> 
> 
> > OK, so both patches go through Steve's tree.
> 
> The second patch will require acks from those that maintain the files I
> touch.

Yep, that is required either way.  I will give it an Acked-by in the hope
that this helps.  You have another version on the way, or have I lost
count?  ;-)

							Thanx, Paul
