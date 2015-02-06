From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace
 code on offline CPU
Date: Fri, 6 Feb 2015 16:27:02 -0500
Message-ID: <20150206162702.1bf4cfb4@gandalf.local.home>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206161803.30cdd90e@gandalf.local.home>
	<20150206161924.53c88aae@gandalf.local.home>
	<CA+icZUW0sFejr5cQOg3F1i1DmH81qaUvK=nK5mWwm3Kxa0_S7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0182.hostedemail.com ([216.40.44.182]:37264 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753121AbbBFV1N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 16:27:13 -0500
In-Reply-To: <CA+icZUW0sFejr5cQOg3F1i1DmH81qaUvK=nK5mWwm3Kxa0_S7A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 6 Feb 2015 22:23:24 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:

> On Fri, Feb 6, 2015 at 10:19 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> > On Fri, 6 Feb 2015 16:18:03 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> >
> >> But the first patch is a much broader change and more generic which
> >> could affect many other locations as well. It is specific to
> >> tracepoints, where the tlb one is specific to a single instance. As the
> >> first patch affects all tracepoints, I want it in my tree.
> >>
> >
> > I may as well just push the first patch directly to Linus, as it does
> > fix false positives.
> >
> 
> To be included in 3.19-final?

Yes.

-- Steve
