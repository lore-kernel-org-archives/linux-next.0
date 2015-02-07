From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Sat, 7 Feb 2015 12:09:48 -0800
Message-ID: <20150207200948.GA5418@linux.vnet.ibm.com>
References: <20150206200653.009919583@goodmis.org>
 <20150206200800.689573476@goodmis.org>
 <20150206232754.GA17751@linux.vnet.ibm.com>
 <20150206230206.0733828d@grimm.local.home>
 <CA+icZUX6diUTU0N3=PF1XkiwJokUKxWdAczbGjK4epv+FxpVcg@mail.gmail.com>
 <20150207102002.4edc054c@grimm.local.home>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:37802 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756142AbbBGUJz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Feb 2015 15:09:55 -0500
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Sat, 7 Feb 2015 13:09:54 -0700
Content-Disposition: inline
In-Reply-To: <20150207102002.4edc054c@grimm.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Sat, Feb 07, 2015 at 10:20:02AM -0500, Steven Rostedt wrote:
> On Sat, 7 Feb 2015 09:01:34 +0100
> Sedat Dilek <sedat.dilek@gmail.com> wrote:
> 
> 
> > - Tested-by's
> > - Reference of 2/2 to 1/2
> 
> The two are together in the series and fix two different bugs. They do
> not need to reference each other.
> 
> > - CC: stable v3.17+/v3.18+ ? (1/2 has a hint for backporting in case
> > of 3.17+ which is BTW EOL, not sure if there are main distros
> > supporting linux-3.17.y)
> 
> The first patch fixes a bug introduced in 3.18. There would be no splat
> in 3.17 because the check didn't exist then. But the RCU reference
> while cpu offline (second bug) was introduced in 3.17 and that is what
> the second patch fixes.
> 
> > 
> > BTW, do you happen to know if there is a someting like a
> > "Requires-tag" or "Precondition-tag" (for example the Fixes-tag is
> > very helpful)?
> 
> We don't need more tags.
> 
> > AFAICS people place such information into the commit-message.
> > I have seen "References:" but this is more to point to a
> > bug-tracking-system (BTS).
> > 
> > EXAMPLE:
> > 
> > commit 63b03e2d2477586440741677ecac45bcf28d7b1
> > "mutex: Always clear owner field upon mutex_unlock()"
> > 
> > References: https://bugs.freedesktop.org/show_bug.cgi?id=87955
> > 
> 
> I may add that, but more appropriate would be to add the commit that
> fixes the bug to the bug report.
> 
> > Maybe ask godfather of SubmittingPatches greg-kh?
> 
> Heh, I haven't read that document in years.

Given my confusion about stable tags, I read stable_kernel_rules.txt
the other day, and found this:

 - If the patch requires other patches as prerequisites which can be
   cherry-picked, then this can be specified in the following format in
   the sign-off area:

     Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
     Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
     Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
     Cc: <stable@vger.kernel.org> # 3.3.x
    Signed-off-by: Ingo Molnar <mingo@elte.hu>

   The tag sequence has the meaning of:
     git cherry-pick a1f84a3
     git cherry-pick 1b9508f
     git cherry-pick fd21073
     git cherry-pick <this commit>

Does that do what you need?

							Thanx, Paul
