From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Sat, 7 Feb 2015 14:14:07 -0800
Message-ID: <20150207221407.GF5418@linux.vnet.ibm.com>
References: <20150206200653.009919583@goodmis.org>
 <20150206200800.689573476@goodmis.org>
 <20150206232754.GA17751@linux.vnet.ibm.com>
 <20150206230206.0733828d@grimm.local.home>
 <CA+icZUX6diUTU0N3=PF1XkiwJokUKxWdAczbGjK4epv+FxpVcg@mail.gmail.com>
 <20150207102002.4edc054c@grimm.local.home>
 <20150207200948.GA5418@linux.vnet.ibm.com>
 <20150207165205.3d9d5cde@gandalf.local.home>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:58374 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756069AbbBGWON (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Feb 2015 17:14:13 -0500
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Sat, 7 Feb 2015 15:14:13 -0700
Content-Disposition: inline
In-Reply-To: <20150207165205.3d9d5cde@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Sat, Feb 07, 2015 at 04:52:05PM -0500, Steven Rostedt wrote:
> On Sat, 7 Feb 2015 12:09:48 -0800
> "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> 
> >    The tag sequence has the meaning of:
> >      git cherry-pick a1f84a3
> >      git cherry-pick 1b9508f
> >      git cherry-pick fd21073
> >      git cherry-pick <this commit>
> > 
> > Does that do what you need?
> 
> Note, for this case it really doesn't apply, because one patch does not
> depend on the other.
> 
> The real bug is that a tracepoint can be called when RCU is not
> watching (cpu is offline). That bug was introduced in 3.17 and is fixed
> by patch 2 with the conditional trace event.
> 
> When that bug was fixed, it showed that another bug exists. That is
> that lockdep should not complain if the conditional prevents the bad
> RCU from happening, and this bug was introduced in 3.18. This was fixed
> by the first patch.
> 
> They really are two entirely separate bugs, it just happens that the
> test case Sedat had happened to trigger both of them. This is why I
> really don't see why the two need to reference each other.
> 
> I'm also going to modify patch 1 to not mention porting the other
> commit (that patch 1 fixes) to 3.17 (from 3.18), as that other commit is
> just a debugging tool and not something that satisfies being
> backported, and the patch that fixes it shouldn't be backported to 3.17
> either, only to 3.18.

Thank you for the explanation!  I guess I needed to have kept a scorecard
on this one.  ;-)

							Thanx, Paul
