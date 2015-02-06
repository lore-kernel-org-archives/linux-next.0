From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code on offline CPU
Date: Fri, 06 Feb 2015 15:06:53 -0500
Message-ID: <20150206200653.009919583@goodmis.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Paul,

I found a much better fix than adding the rcu_nocheck(). Simply have the
rcu check inside the condition check as well. This way the rcu splat
will only happen if the condition is set too. The condition doesn't need
the tracepoint enabled.

Now I'm thinking that I should push the first patch through my tree as it
only touches tracing. The second patch you can freely take.

Neither patch really depends on the other, but both patches are required
to make the splat go away. If Sedat could test these patches together,
and give his tested-by tag, that would be great. I'll run my patch through
my full series of tests and then push to linux next. You could take the second
patch and push that through your tree (linux-next). When both arrive, the
bug will be fixed. The two do not need to come in together.

Thoughts?

-- Steve


Steven Rostedt (Red Hat) (2):
      tracing: Add condition check to RCU lockdep checks
      x86/tbl/trace: Do not trace on CPU that is offline

----
 include/linux/tracepoint.h | 2 +-
 include/trace/events/tlb.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)
