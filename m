From: Nathan Lynch <Nathan_Lynch@mentor.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 30 Mar 2015 10:24:23 -0500
Message-ID: <55196AA7.3040107@mentor.com>
References: <20150330171334.6f377ba7@canb.auug.org.au> <20150330071536.GF24899@n2100.arm.linux.org.uk> <20150330190812.5512205f@canb.auug.org.au> <5519646C.9010802@mentor.com> <20150330150838.GL24899@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:37299 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803AbbC3PY2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2015 11:24:28 -0400
In-Reply-To: <20150330150838.GL24899@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/30/2015 10:08 AM, Russell King - ARM Linux wrote:
> On Mon, Mar 30, 2015 at 09:57:48AM -0500, Nathan Lynch wrote:
>> On 03/30/2015 03:08 AM, Stephen Rothwell wrote:
>>> Hi Russell,
>>>
>>> On Mon, 30 Mar 2015 08:15:37 +0100 Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
>>>>
>>>> I'll drop the VDSO stuff from the ARM tree; I can't see a way to keep
>>>> it in my tree and keep my tree buildable without dragging in the tip
>>>> tree.
>>>
>>> Does it affect your tree on its own?  If not, then it can be fixed when
>>> merged as I have done, or if you look at the tip tree, all you really
>>> need to merge is tip timers/core branch (which I am sure the tip guys
>>> can tell you if it is stable enough) which is about 28 commits ...
>>>
>>>> The ARM VDSO stuff will just have to wait for 4.2 instead.
>>>
>>> If that works for you.
>>
>> FWIW, Stephen's merge fix is correct and I have run my vdso tests
>> without problems on OMAP5 with next-20150330.
> 
> Hopefully, I can pull the tip stuff but if not, I'll try to remember
> to include Stephen's patch with my pull request, but I can't make any
> guarantees - Stephen's email will very quickly get buried in my mailbox,
> and I'll most likely forget about it too... I'm notoriously bad with
> email...

OK, let me know if I can help.

I'm happy to remind you about it when the merge window opens.
