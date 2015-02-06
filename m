From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code
 on offline CPU
Date: Fri, 6 Feb 2015 22:29:07 +0100
Message-ID: <CA+icZUU3v8r3UoiUC4SeGzEf0R3Xj_0ZVmM06Fg17ULmNYHC6w@mail.gmail.com>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206161803.30cdd90e@gandalf.local.home>
	<20150206161924.53c88aae@gandalf.local.home>
	<20150206162445.2bdbc0da@gandalf.local.home>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:60752 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753702AbbBFV3I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 16:29:08 -0500
In-Reply-To: <20150206162445.2bdbc0da@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 6, 2015 at 10:24 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Fri, 6 Feb 2015 16:19:24 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
>> On Fri, 6 Feb 2015 16:18:03 -0500
>> Steven Rostedt <rostedt@goodmis.org> wrote:
>>
>>
>> > But the first patch is a much broader change and more generic which
>> > could affect many other locations as well. It is specific to
>> > tracepoints, where the tlb one is specific to a single instance. As the
>> > first patch affects all tracepoints, I want it in my tree.
>> >
>>
>> I may as well just push the first patch directly to Linus, as it does
>> fix false positives.
>>
>
> Heh, the first patch actually will be marked as fixing another patch by
> Dave Hansen: 3a630178fd5f3
>

Welcome to the "ring of fixes"!

Steve, you were wrong... It's Dave "To Be Loved".

- Sedat -
