From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace
 code on offline CPU
Date: Fri, 6 Feb 2015 16:18:03 -0500
Message-ID: <20150206161803.30cdd90e@gandalf.local.home>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0179.hostedemail.com ([216.40.44.179]:36681 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755221AbbBFVSH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 16:18:07 -0500
In-Reply-To: <CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 6 Feb 2015 22:07:56 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:

> Your patchset fixes the issue for me (look at the attached files for
> more detailed information).

So I can add your Tested-by tag?

> 
> I tested the "To Be Loved" (TBL VS. TLB flushes) edition against
> Linux-next (next-20150204) where I had originally seen and reported
> the call-trace.
> 
> Before I forget... The Fixes-tag misses pointing to Dave Hansen's...
> 
> commit d17d8f9dedb9dd76fd540a5c497101529d9eb25a
> "x86/mm: Add tracepoints for TLB flushes"

Sure, I can add that, and even Cc stable for 3.17+.

> 
> My POV is that both patches somehow belong together.
> If you decide to push them through two different trees, please add a
> note/reference to each other.

The second patch should reference the first one.

But the first patch is a much broader change and more generic which
could affect many other locations as well. It is specific to
tracepoints, where the tlb one is specific to a single instance. As the
first patch affects all tracepoints, I want it in my tree.


-- Steve
