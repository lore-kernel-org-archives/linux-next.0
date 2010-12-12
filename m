From: Rakib Mullick <rakib.mullick@gmail.com>
Subject: Re: linux-next: Tree for December 10 (x86 nmi_watchdog)
Date: Sun, 12 Dec 2010 13:32:31 +0600
Message-ID: <AANLkTim9w7607d5sNbZ+U89QJhp4cxR7Lhy+4z90DPmB@mail.gmail.com>
References: <20101210135746.0cf6cbcd.sfr@canb.auug.org.au>
	<20101210092533.4f426650.randy.dunlap@oracle.com>
	<AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
	<AANLkTinRaGcEzGaRZSvGzRAubNtRUnHstru_0E0aCdrd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:39565 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304Ab0LLHcc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 12 Dec 2010 02:32:32 -0500
In-Reply-To: <AANLkTinRaGcEzGaRZSvGzRAubNtRUnHstru_0E0aCdrd@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Don Zickus <dzickus@redhat.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

On Sun, Dec 12, 2010 at 12:26 PM, Rakib Mullick <rakib.mullick@gmail.com> wrote:
> On Sun, Dec 12, 2010 at 11:27 AM, Rakib Mullick <rakib.mullick@gmail.com> wrote:
>> On Fri, Dec 10, 2010 at 11:25 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
>>> On Fri, 10 Dec 2010 13:57:46 +1100 Stephen Rothwell wrote:
>>>
>
> NO. I don't think this is the correct one. Cause we don't want
> touch_softlockup_watchdog() to be called if
> CONFIG_HARDLOCKUP_DETECTOR=y.
>
I think simply removing touch_softlockup_watchdog() definition from
hw_nmi.c is right. Am I right, Don?

thanks,
rakib
