From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Tue, 14 Jan 2014 16:20:36 +0100
Message-ID: <CAMuHMdUt2jCVLHr9mbV8JVnY4+vv5vEKNfk1=FoSnZ+nx6qhNw@mail.gmail.com>
References: <20140114155331.88d170d3c991b9465c23a537@canb.auug.org.au>
	<20140114125153.GY7572@laptop.programming.kicks-ass.net>
	<52D55479.9010802@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52D55479.9010802@zytor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <davidlohr@hp.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 14, 2014 at 4:15 PM, H. Peter Anvin <hpa@zytor.com> wrote:
> On 01/14/2014 04:51 AM, Peter Zijlstra wrote:
>> On Tue, Jan 14, 2014 at 03:53:31PM +1100, Stephen Rothwell wrote:
>>> Hi Andrew,
>>>
>>> Today's linux-next merge of the akpm-current tree got a conflict in
>>> kernel/futex.c between commit a52b89ebb6d4 ("futexes: Increase hash table
>>> size for better performance") from the tip tree and commit 61beee6c76e5
>>> ("futex: switch to USER_DS for futex test") from the akpm-current tree.
>>>
>>> @@@ -2869,10 -2748,13 +2871,13 @@@
>>>       * implementation, the non-functional ones will return
>>>       * -ENOSYS.
>>>       */
>>> +    fs = get_fs();
>>> +    set_fs(USER_DS);
>>>      if (cmpxchg_futex_value_locked(&curval, NULL, 0, 0) == -EFAULT)
>>>              futex_cmpxchg_enabled = 1;
>>> +    set_fs(fs);
>>>
>>
>> This seems terribly broken, the *futex_value*() ops should not need
>> that; they are supposed to access userspace without any of that.
>
> I am *guessing* that m68k is has get_fs() == KERNEL_DS at the point that
> futex_init() is called.  This would seem a bit of a peculiarity to m68k,
> and as such it would seem like it would be better for it to belong in
> the m68k-specific code, but since futex_init() is init code and only
> called once anyway it shouldn't cause any harm...

Yes it does. So when getting the exception on 68030, we notice it's a kernel
space access error, not a user space access error, and crash.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
