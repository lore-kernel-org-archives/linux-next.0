From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 15 Jul 2016 13:26:09 -0700
Message-ID: <3225f94c-9c82-f1b9-7083-5b012739c26c@zytor.com>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net>
 <20160715150903.GA2523@redhat.com> <20160715152436.GB2523@redhat.com>
 <20160715154326.GC2523@redhat.com>
 <20160715154930.GC3115@twins.programming.kicks-ass.net>
 <20160715162800.GE2523@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160715162800.GE2523@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-next.vger.kernel.org

On 07/15/16 09:28, Arnaldo Carvalho de Melo wrote:
> Em Fri, Jul 15, 2016 at 05:49:30PM +0200, Peter Zijlstra escreveu:
>> On Fri, Jul 15, 2016 at 12:43:26PM -0300, Arnaldo Carvalho de Melo wrote:
>>> Ok, same results, it works, queuing this one, ack?
>>
>> Sure. Although I'm still somewhat puzzled by the duplicated effort of
>> __BITS_PER_LONG and BITS_PER_LONG.
> 
> Well, I also can't think of something to justify that, would have to dig
> deeper to figure out why that duplication was introduced.
> 
> Thanks, will queue this one up and be done with it. For the moment. :-)
> 

I'm wondering if there are issues related to compat.

	-hpa
