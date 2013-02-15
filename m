From: Joe Millenbach <jmillenbach@gmail.com>
Subject: Re: linux-next: Tree for Feb 13 (virtio_console)
Date: Thu, 14 Feb 2013 16:51:17 -0800
Message-ID: <CADwDc1AvrGP-YPd_h6jvfiUObvS3RWrt20ujTi3_cE_TrnHv9g@mail.gmail.com>
References: <20130213193532.162080d7c0557a307ab451ac@canb.auug.org.au>
	<511BEC55.5090801@infradead.org>
	<87sj4zk3ai.fsf@rustcorp.com.au>
	<511D30B4.5020201@infradead.org>
	<511D330A.2050407@infradead.org>
	<20130215105519.1d8de65d4f9195eeb9306c13@canb.auug.org.au>
	<20130215000229.GA5164@kroah.com>
	<20130215112313.f0952009747b754447fc45c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:50977 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935143Ab3BOAvU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Feb 2013 19:51:20 -0500
In-Reply-To: <20130215112313.f0952009747b754447fc45c7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Shah <amit.shah@redhat.com>, virtualization@lists.linux-foundation.org, Randy Dunlap <rdunlap@infradead.org>, Josh Triplett <josh@joshtriplett.org>, Jamey Sharp <jamey@minilop.net>

On Thu, Feb 14, 2013 at 4:23 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> On Thu, 14 Feb 2013 16:02:29 -0800 Greg KH <greg@kroah.com> wrote:
>> On Fri, Feb 15, 2013 at 10:55:19AM +1100, Stephen Rothwell wrote:
>> >
>> > Also, has someone checked to see if any of the CONFIG_ symbols that had a
>> > dependency on TTY added are selected anywhere else?
>>
>> Joe did all of that I think.  Joe?
>
> OK, good.
>

I tried to find all of them, but I can't guarantee they're all fixed :
).  I tried to search out the features that used the tty driver (using
two initialization functions), and tried enabling all features while
disabling TTY on my x86 64 bit machine.  In addition to stubbing out
functions that the kernel's initialization required.

Any other suggestions for finding problems proactively are appreciated.

- Joe
