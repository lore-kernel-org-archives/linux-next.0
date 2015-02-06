From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Fri, 6 Feb 2015 23:32:40 +0100
Message-ID: <CA+icZUWCL03z1rN0gP_YH=NGyURY2hz_iKBHFeDy10NMivi_0Q@mail.gmail.com>
References: <CA+icZUWB6XHvOxV-_b=m=c1-RvE3FVbeDeih__zZbZ23dVVJ6Q@mail.gmail.com>
	<20150206163435.3c9f070b@gandalf.local.home>
	<CA+icZUUWO_r-5_2AhNN4M65AtL6rd37rWqaz1K+=ZHBjqe5eqw@mail.gmail.com>
	<20150206164209.21ee867b@gandalf.local.home>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:32909 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755550AbbBFWcm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 17:32:42 -0500
In-Reply-To: <20150206164209.21ee867b@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 6, 2015 at 10:42 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Fri, 6 Feb 2015 22:39:52 +0100
> Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
>> Man man man you write and test your stuff still on ancient x85 arch.
>> What's coming next... revive/reinclude i386 code?
>
> Real mode for Real men! Yeah Baby!
>

I hope you enjoyed your glass of bitter lemon.

After Paul agreed that this one can also go through your tree I hope
to see an refreshed version in your linux-trace tree.

- Sedat -
