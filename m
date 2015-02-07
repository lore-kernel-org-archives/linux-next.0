From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Sat, 7 Feb 2015 09:13:23 +0100
Message-ID: <CA+icZUX+3nsostkVaOEBbOuXDaaXA2sQJaeZ+xS7LXjyieeHvA@mail.gmail.com>
References: <20150206200653.009919583@goodmis.org>
	<20150206200800.689573476@goodmis.org>
	<20150206232754.GA17751@linux.vnet.ibm.com>
	<20150206230206.0733828d@grimm.local.home>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:48115 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751651AbbBGINZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Feb 2015 03:13:25 -0500
In-Reply-To: <20150206230206.0733828d@grimm.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Sat, Feb 7, 2015 at 5:02 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Fri, 6 Feb 2015 15:27:54 -0800
> "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
>
>> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
>> > Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> > Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
>>
>> Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
> Both patches survived all my tests, now I just need an ack by from Dave
> and/or Peter, and I'll push it off to Linus.
>

I fell over this w/o having any experiences in using the tracing
system within the Linux-kernel.
Can you give a brief introduction?
Or can describe how you made your tests?
Did you use trace-cmd in your tests?

Thanks.

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git/
