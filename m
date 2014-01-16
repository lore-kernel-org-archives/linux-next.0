From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 16 Jan 2014 14:51:08 -0800
Message-ID: <52D8625C.1000902@zytor.com>
References: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au>	<20140116121955.GQ31570@twins.programming.kicks-ass.net>	<20140117074628.88698f59939c9002b7c12968@canb.auug.org.au>	<20140116222536.GX30183@twins.programming.kicks-ass.net> <20140117093426.ee8e3d1bb2e95c9f67ec625b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:44940 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750750AbaAPWwA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jan 2014 17:52:00 -0500
In-Reply-To: <20140117093426.ee8e3d1bb2e95c9f67ec625b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/16/2014 02:34 PM, Stephen Rothwell wrote:
> Hi Peter,
> 
> On Thu, 16 Jan 2014 23:25:36 +0100 Peter Zijlstra
> <peterz@infradead.org> wrote:
>> 
>> On Fri, Jan 17, 2014 at 07:46:28AM +1100, Stephen Rothwell
>> wrote:
>>> 
>>> On Thu, 16 Jan 2014 13:19:55 +0100 Peter Zijlstra
>>> <peterz@infradead.org> wrote:
>>>> 
>>>> I think the below ought to work
>>> 
>>> To be clear, all you did was replace the body of mwait_idle()
>>> with
>>> 
>>> mwait_idle_with_hints(0, 0);
>> 
>> Pretty much, and add the asm/mwait.h include, otherwise you'll
>> end up with a compile fail.
>> 
>>> (and the comment above it)?  I need to apply in incremental
>>> patch in the merge commit.
>> 
>> I don't think I touched the comment at all.
> 

In retrospect this bit probably should have gone through the idle
tree.  That was my bad, I need to coordinate with Len better.

	-hpa
