From: Nathan Lynch <Nathan_Lynch@mentor.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 30 Mar 2015 09:57:48 -0500
Message-ID: <5519646C.9010802@mentor.com>
References: <20150330171334.6f377ba7@canb.auug.org.au>	<20150330071536.GF24899@n2100.arm.linux.org.uk> <20150330190812.5512205f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150330190812.5512205f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 03/30/2015 03:08 AM, Stephen Rothwell wrote:
> Hi Russell,
> 
> On Mon, 30 Mar 2015 08:15:37 +0100 Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
>>
>> I'll drop the VDSO stuff from the ARM tree; I can't see a way to keep
>> it in my tree and keep my tree buildable without dragging in the tip
>> tree.
> 
> Does it affect your tree on its own?  If not, then it can be fixed when
> merged as I have done, or if you look at the tip tree, all you really
> need to merge is tip timers/core branch (which I am sure the tip guys
> can tell you if it is stable enough) which is about 28 commits ...
> 
>> The ARM VDSO stuff will just have to wait for 4.2 instead.
> 
> If that works for you.

FWIW, Stephen's merge fix is correct and I have run my vdso tests
without problems on OMAP5 with next-20150330.
