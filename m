From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code
 on offline CPU
Date: Fri, 6 Feb 2015 23:13:02 +0100
Message-ID: <CA+icZUWBJ5-0pyreVdTduaOPg8StccZhcu6=vdD_Zny8CCMZDw@mail.gmail.com>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206213856.GN5418@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:49508 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752664AbbBFWNF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 17:13:05 -0500
In-Reply-To: <20150206213856.GN5418@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 6, 2015 at 10:38 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Fri, Feb 06, 2015 at 10:07:56PM +0100, Sedat Dilek wrote:
>> On Fri, Feb 6, 2015 at 9:06 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
>> > Paul,
>> >
>> > I found a much better fix than adding the rcu_nocheck(). Simply have the
>> > rcu check inside the condition check as well. This way the rcu splat
>> > will only happen if the condition is set too. The condition doesn't need
>> > the tracepoint enabled.
>> >
>> > Now I'm thinking that I should push the first patch through my tree as it
>> > only touches tracing. The second patch you can freely take.
>> >
>> > Neither patch really depends on the other, but both patches are required
>> > to make the splat go away. If Sedat could test these patches together,
>> > and give his tested-by tag, that would be great. I'll run my patch through
>> > my full series of tests and then push to linux next. You could take the second
>> > patch and push that through your tree (linux-next). When both arrive, the
>> > bug will be fixed. The two do not need to come in together.
>> >
>> > Thoughts?
>> >
>> > -- Steve
>> >
>> >
>> > Steven Rostedt (Red Hat) (2):
>> >       tracing: Add condition check to RCU lockdep checks
>> >       x86/tbl/trace: Do not trace on CPU that is offline
>> >
>> > ----
>> >  include/linux/tracepoint.h | 2 +-
>> >  include/trace/events/tlb.h | 4 +++-
>> >  2 files changed, 4 insertions(+), 2 deletions(-)
>> >
>>
>> Your patchset fixes the issue for me (look at the attached files for
>> more detailed information).
>>
>> I tested the "To Be Loved" (TBL VS. TLB flushes) edition against
>> Linux-next (next-20150204) where I had originally seen and reported
>> the call-trace.
>>
>> Before I forget... The Fixes-tag misses pointing to Dave Hansen's...
>>
>> commit d17d8f9dedb9dd76fd540a5c497101529d9eb25a
>> "x86/mm: Add tracepoints for TLB flushes"
>>
>> My POV is that both patches somehow belong together.
>> If you decide to push them through two different trees, please add a
>> note/reference to each other.
>
> I am fine with Steven pushing these, and have dropped his earlier
> version from my tree.
>

OK, so both patches go through Steve's tree.

- Sedat -
