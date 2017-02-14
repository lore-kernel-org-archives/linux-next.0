From: Dave Jiang <dave.jiang@intel.com>
Subject: =?UTF-8?B?UmU6IHJlZGVmaW5pdGlvbiBvZiDigJhuYXRpdmVfcHVkX2NsZWFy4oCZ?=
 =?UTF-8?Q?_error_on_x86?=
Date: Tue, 14 Feb 2017 12:42:01 -0700
Message-ID: <32aa9635-c0a1-4085-5ba8-8b41f5cabcbd@intel.com>
References: <CAJ1xhMXXcqi9mo4jQG5bT03ocP9aXwn2d0DMKTiA_-bCnwiLcA@mail.gmail.com>
 <CAGXu5jKpNZNdxPfPKSuE+oAHdXp8Rgv0tD_o-bR=as-N4YaPxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:3656 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752987AbdBNTmC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Feb 2017 14:42:02 -0500
In-Reply-To: <CAGXu5jKpNZNdxPfPKSuE+oAHdXp8Rgv0tD_o-bR=as-N4YaPxQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Matthew Wilcox <mawilcox@microsoft.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next <linux-next@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>



On 02/14/2017 12:31 PM, Kees Cook wrote:
> On Tue, Feb 14, 2017 at 8:14 AM, Alexander Kapshuk
> <alexander.kapshuk@gmail.com> wrote:
>> I'm getting this error on x86 when compiling next-20170214.
>> Any advice on how to fix this would be much appreciated.
>>
>>   time make -j2
>> ...
>> CC      arch/x86/kernel/asm-offsets.s
>>   GEN     scripts/gdb/linux/constants.py
>> In file included from ./include/linux/mm.h:68:0,
>>                  from ./include/linux/suspend.h:8,
>>                  from arch/x86/kernel/asm-offsets.c:12:
>> ./arch/x86/include/asm/pgtable.h:66:26: error: redefinition of
>> ‘native_pud_clear’
>>  #define pud_clear(pud)   native_pud_clear(pud)
>>                           ^
>> ./arch/x86/include/asm/pgtable-3level.h:128:20: note: in expansion of
>> macro ‘pud_clear’
>>  static inline void pud_clear(pud_t *pudp)
>>                     ^
>> In file included from ./arch/x86/include/asm/pgtable_32.h:44:0,
>>                  from ./arch/x86/include/asm/pgtable.h:581,
>>                  from ./include/linux/mm.h:68,
>>                  from ./include/linux/suspend.h:8,
>>                  from arch/x86/kernel/asm-offsets.c:12:
>> ./arch/x86/include/asm/pgtable-3level.h:124:20: note: previous
>> definition of ‘native_pud_clear’ was here
>>  static inline void native_pud_clear(pud_t *pudp)
>>                     ^
>> make[1]: *** [Kbuild:82: arch/x86/kernel/asm-offsets.s] Error 1
>> make: *** [Makefile:1033: prepare0] Error 2
>>
>> real 0m10.637s
>> user 0m9.466s
>> sys 0m2.752s
> 
> Seems like it's related to "mm, x86: add support for PUD-sized
> transparent hugepages".

Can I please get a config file to reproduce? Thanks!

> 
> -Kees
> 
