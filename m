From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Fri, 6 Feb 2015 01:14:55 +0100
Message-ID: <CA+icZUV=umTsNRB7568SKdLQ35-=nH2544=XEE5xrfpn_pb_-A@mail.gmail.com>
References: <20150205005716.GS5370@linux.vnet.ibm.com>
	<54D3186F.7030500@sr71.net>
	<20150205130343.6ac0eda9@gandalf.local.home>
	<20150205130802.289a8be0@gandalf.local.home>
	<54D3B253.3050000@sr71.net>
	<20150205183412.GI5370@linux.vnet.ibm.com>
	<54D3B7F5.9070209@sr71.net>
	<20150205184537.GJ5370@linux.vnet.ibm.com>
	<CA+icZUX_fi-O3kXymLCPfJ8Sx0yG=m5=pWzJDJpu-iHTyjM78Q@mail.gmail.com>
	<20150205145816.7c38a7df@gandalf.local.home>
	<CA+icZUUC7vD_FBUWV+WLBx2M-iXvR8E90zWGxmUWQcdmbHiH2A@mail.gmail.com>
	<20150205152201.49d55905@gandalf.local.home>
	<CA+icZUV9SeWKrWN6Q8-Us-VpOgaz2sXX-RT2he4rwJmOzGQjOw@mail.gmail.com>
	<CA+icZUXkv2JV0kurGdvOPPavyrY2hb9rjTZ1yQn13gai=qobcw@mail.gmail.com>
	<20150205170952.525bdee6@gandalf.local.home>
	<CA+icZUX_f_M7EmV3OM_CeosjfqoMSkJrCgUBm0LKFFurFGRvGQ@mail.gmail.com>
	<20150205181141.6f1d532a@gandalf.local.home>
	<CA+icZUVTpQrVUkUBeAP+=tGaHE0GPBsPOOYeB+Rwke-7UkKRew@mail.gmail.com>
	<20150205191226.47b146c5@gandalf.local.home>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:46512 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbbBFAO5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2015 19:14:57 -0500
In-Reply-To: <20150205191226.47b146c5@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On Fri, Feb 6, 2015 at 1:12 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Fri, 6 Feb 2015 00:53:41 +0100
> Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
>> > See that if (IS_ENABLED(CONFIG_LOCKDEP))?
>> >
>>
>> I have here...
>>
>> CONFIG_LOCKDEP=y
>
> Yep, I knew that (you wouldn't get splats without it).
>
>
>> Which old patch?
>> "tlb: Don't do trace_tlb_flush() on offline CPUs" ?
>
> Yeah, that one. In other words, just add this patch on the kernel you
> just tested.
>
> Thanks,
>

Do you have a name with label for your patch?

- Sedat -
