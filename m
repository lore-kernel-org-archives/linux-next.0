From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code
 on offline CPU
Date: Fri, 6 Feb 2015 23:51:19 +0100
Message-ID: <CA+icZUWnT6o5aS+iRV7fLC95PXHjEyK8TDgUyWcG6bZU0yTX9w@mail.gmail.com>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206213856.GN5418@linux.vnet.ibm.com>
	<CA+icZUWBJ5-0pyreVdTduaOPg8StccZhcu6=vdD_Zny8CCMZDw@mail.gmail.com>
	<20150206173548.48f53ed7@gandalf.local.home>
	<20150206224836.GU5418@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:43813 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622AbbBFWvU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 17:51:20 -0500
In-Reply-To: <20150206224836.GU5418@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 6, 2015 at 11:48 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Fri, Feb 06, 2015 at 05:35:48PM -0500, Steven Rostedt wrote:
>> On Fri, 6 Feb 2015 23:13:02 +0100
>> Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>
>>
>> > OK, so both patches go through Steve's tree.
>>
>> The second patch will require acks from those that maintain the files I
>> touch.
>
> Yep, that is required either way.  I will give it an Acked-by in the hope
> that this helps.  You have another version on the way, or have I lost
> count?  ;-)
>

Working on x85 and probably using ed as $EDITOR, it will take some time.

- Sedat -
