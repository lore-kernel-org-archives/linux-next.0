From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 3 (objtool)
Date: Fri, 5 Apr 2019 13:53:27 -0700
Message-ID: <15ed85f4-bf2e-da91-71c1-46875d1c6e3f@infradead.org>
References: <20190403192407.13a99513@canb.auug.org.au>
 <d37e0909-cacc-7c6c-4376-33891fa69f53@infradead.org>
 <20190403205305.tqqwttjytunzgtub@treble>
 <6a2455b9-5c02-99dc-e41c-e6b7d1c3118d@infradead.org>
 <20190404171618.6u36y5zu3euvd4zp@treble>
 <9e4eb742-f306-7aea-a3d7-9abbb244bb55@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9e4eb742-f306-7aea-a3d7-9abbb244bb55@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On 4/4/19 1:51 PM, Randy Dunlap wrote:
> On 4/4/19 10:16 AM, Josh Poimboeuf wrote:
>> On Wed, Apr 03, 2019 at 03:29:17PM -0700, Randy Dunlap wrote:
>>> On 4/3/19 1:53 PM, Josh Poimboeuf wrote:
>>>> On Wed, Apr 03, 2019 at 08:02:43AM -0700, Randy Dunlap wrote:
>>>>> On 4/3/19 1:24 AM, Stephen Rothwell wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> Changes since 20190402:
>>>>>>
>>>>>
>>>>> on x86_64:
>>>>>
>>>>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x909: unreachable instruction
>>>>
>>>> Your .o file looks odd.  I can't recreate the issue when I build the
>>>> same object.
>>>
>>> This (randconfig) build has tracing enabled?  Could that have anything to do
>>> with it?
>>
>> No, I can't see any reasonable explanation for it other than a buggy
>> toolchain.
>>
>>> The randconfig file is attached.
>>
>> I still can't recreate with your randconfig.
>>
>>>> Did the issue only just now show up?  Can you bisect it?  What version
>>>> of binutils are you using?
>>>
>>>> ld -v
>>> GNU ld (GNU Binutils; openSUSE Leap 42.3) 2.31.1.20180828-19
>>>
>>>
>>> My build logs show it first occurred (in my randconfig builds) in
>>> linux-next-20190204.
>>
>> It seems really odd.  Can you do a bisect?
>>
> 
> Sure, I'll give it a try.
> 

That didn't work very well.  First I narrowed the problem down to between
4.16 (good) and 4.17-rc1 (bad), then I did the git bisects, and ended up
pointing to a SCSI driver patch.

I'm inclined to suspect that it's a padding problem, i.e. toolchain problem
like you suggested.

-- 
~Randy
