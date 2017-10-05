From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [Oops] CPU toggle resulted in kernel crash
Date: Fri, 06 Oct 2017 09:53:36 +1100
Message-ID: <87o9plyznz.fsf@concordia.ellerman.id.au>
References: <1507224106.3792.26.camel@abdul.in.ibm.com> <CAGXu5j+ZyeZELcdCztetQdSkipH-tAke3FAhmCS-_=3gU-tikQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33987 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751395AbdJEWxi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Oct 2017 18:53:38 -0400
In-Reply-To: <CAGXu5j+ZyeZELcdCztetQdSkipH-tAke3FAhmCS-_=3gU-tikQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>

Kees Cook <keescook@chromium.org> writes:

> On Thu, Oct 5, 2017 at 10:21 AM, Abdul Haleem
> <abdhalee@linux.vnet.ibm.com> wrote:
>> Hi,
>>
>> CPU off on in a loop for single cpu results in kernel panic for
>> 4.14.0-rc2-next-20170929
>>
>> Machine: Power 8 PowerVM LPAR
>> Kernel: 4.14.0-rc2-next-20170929
>> gcc: 5.1.1
>> config : attached
>>
>> Steps to recreate:
>> -----------------
>> The issue is not reproducible all the time.
>>
>> The trace occurred when CPU toggle operation for cpu14 in a loop for 10
>> iterations.
>>
>> the Faulting instruction address: 0xc00000000035465c
>> maps to:
>>
>> 0xc00000000035465c is in deactivate_slab (mm/slub.c:261).
>> 256
>> 257     /* Returns the freelist pointer recorded at location ptr_addr. */
>> 258     static inline void *freelist_dereference(const struct kmem_cache *s,
>> 259                                              void *ptr_addr)
>> 260     {
>> 261             return freelist_ptr(s, (void *)*(unsigned long *)(ptr_addr),
>> 262                                 (unsigned long)ptr_addr);
>> 263     }
>> 264
>> 265     static inline void *get_freepointer(struct kmem_cache *s, void *object)
>
> This looks like slub cache corruption (a NULL pointer dereference for
> the heap freelist).

Abdul, try turning on CONFIG_SLUB_DEBUG, and booting with slub_debug=FZP
on the command line.

cheers
