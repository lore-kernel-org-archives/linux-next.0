From: Peter Oberparleiter <oberpar@linux.ibm.com>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Mon, 10 Sep 2018 15:27:20 +0200
Message-ID: <1de08f6a-7c9e-1a75-e3bd-e8bcf99f5e35@linux.ibm.com>
References: <20180824133206.4218c2e5@canb.auug.org.au>
 <20180824172053.20fa197294f51496dcec5605@kernel.org>
 <20180824204756.e787765461975cd1e27502dc@kernel.org>
 <20180824224211.2934d7c0@canb.auug.org.au>
 <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
 <20180828072333.36af4d5d@canb.auug.org.au>
 <20180828094341.d20d8fbcb9dca310d44df951@kernel.org>
 <f0ca0036-abe1-4252-6d30-b810dd22097d@linux.ibm.com>
 <20180907014209.49e2940f74615a1e4f544ffd@kernel.org>
 <ebad9c9d-a7d0-44cc-f000-bf5e500fcd24@linux.ibm.com>
 <20180908125749.9c903e507a33046d5586e841@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180908125749.9c903e507a33046d5586e841@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arnd@arndb.de
List-Id: linux-next.vger.kernel.org

On 08.09.2018 05:57, Masami Hiramatsu wrote:
> On Fri, 7 Sep 2018 14:50:59 +0200
> Peter Oberparleiter <oberpar@linux.ibm.com> wrote:
> 
>> On 06.09.2018 18:42, Masami Hiramatsu wrote:
>>> Peter Oberparleiter <oberpar@linux.ibm.com> wrote:
>>>> I've attached a quick fix that should address both problems. I'd
>>>> appreciate if this patch could get some testing before I post proper fix
>>>> patches.
>>>
>>> Hmm, I'm still not able to reproduce it on powerpc cross build even with
>>> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y ... So, sorry I couldn't test this patch.
>>
>> Maybe this is related to the compiler/binutils versions used. I'm using
>> Fedora 28's gcc-powerpc64 and binutils-powerpc64 packages:
>>
>> powerpc64-linux-gnu-gcc (GCC) 7.1.1 20170622 (Red Hat Cross 7.1.1-3)
>> GNU ld version 2.29.1-4.fc28
>>
>> For reference I'm also attaching the config that I used to reproduce the
>> problem on kernel v4.18.
>>
>>>> diff --git a/arch/arm/kernel/vmlinux.lds.h b/arch/arm/kernel/vmlinux.lds.h
>>>> index ae5fdff18406..2ca33277a28b 100644
>>>> --- a/arch/arm/kernel/vmlinux.lds.h
>>>> +++ b/arch/arm/kernel/vmlinux.lds.h
>>>> @@ -48,6 +48,7 @@
>>>>
>>>>  #define ARM_DISCARD							\
>>>>  		*(.ARM.exidx.exit.text)					\
>>>> +		*(.ARM.exidx.text.exit)					\
>>>
>>> BTW, why would we need this?
>>
>> That's necessary to fix one of the two ARM linker failures reported via
>> https://lkml.org/lkml/2018/8/24/345
>>
>>>>> `.text.exit' referenced in section `.ARM.exidx.text.exit' of
>>>>> kernel/trace/trace_clock.o: defined in discarded section `.text.exit'
>>>>> of kernel/trace/trace_clock.o
>>
>> Section ".ARM.exidx.text.exit" refers to ".text.exit" which was
>> discarded. With the change above, the extraneous section
>> ".ARM.exidx.text.exit" is also discarded, resolving the linker failure.
> 
> OK, so your patch fixes following issue too?
> 
> https://patchwork.kernel.org/patch/10584685/

Yes it does, by discarding the text.exit section unconditionally. I
don't think we need to keep any exit-related section introduced by GCOV
profiling. It is my understanding that the code contained in such a
section is only relevant for user-space profiling, to process profiling
data when a program ends.

Also discarding .ARM.exidx.text.exit seems to be more consistent to how
.ARM.exidx.exit.text is handled.

> In that case, we should drop above patch.

Yes, I agree.

-- 
Peter Oberparleiter
Linux on Z Development - IBM Germany
