From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 20 Jan 2014 00:56:47 -0800
Message-ID: <52DCE4CF.2060605@zytor.com>
References: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au> <20140116121955.GQ31570@twins.programming.kicks-ass.net> <20140117074628.88698f59939c9002b7c12968@canb.auug.org.au> <CAJvTdKnoNh2YAvtXraYxTct+8e6e_8Om9cAZGSTpy8UO=t=W4w@mail.gmail.com> <20140120082620.GB30183@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:41882 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750942AbaATI5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jan 2014 03:57:43 -0500
In-Reply-To: <20140120082620.GB30183@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 01/20/2014 12:26 AM, Peter Zijlstra wrote:
> On Sun, Jan 19, 2014 at 11:45:43PM -0500, Len Brown wrote:
>> +static void mwait_idle(void)
>> +{
>> +       mwait_idle_with_hints(0, 0);
>> +}
>> +
>>
>> The reason the patch above will crash Core2 machines is because
>> core2 machines don't support mwait_idle_with_hints().
>>
>> The calling sequence for old and new MWAIT instructions is different.
>> The former must be invoked with interrupts enabled,
>> and the later can be invoked with interrupts disabled,
>> which is a feature that Linux takes advantage of.
> 
> What old and new? They're the same byte sequence: 0x0f 0x01 0xc9
> 
> And your 'old' __sti_mwait(0,0) has the exact same arguments as
> mwait_idle_with_hints(0,0).
> 

The difference is the STI!

	-hpa
