From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 4
Date: Thu, 4 Oct 2018 18:33:02 -0700
Message-ID: <01c4a73c-7901-2fbb-8f87-95ff21dc5126@roeck-us.net>
References: <20181004183449.36bcc93b@canb.auug.org.au>
 <20181004134644.GA9130@roeck-us.net>
 <CAMuHMdXfhbFi8HYtqd6BeACyG64_eQvoiSQ7DMpyOmdXEXPymg@mail.gmail.com>
 <20181005094445.4d0b68bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005094445.4d0b68bc@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On 10/04/2018 04:44 PM, Stephen Rothwell wrote:
> Hi Geert,
> 
> On Thu, 4 Oct 2018 16:21:42 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> On Thu, Oct 4, 2018 at 3:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> Time for a status report.
>>>
>>> Build results:
>>>          total: 135 pass: 121 fail: 14
>>> Failed builds:
>>>          arm:allmodconfig
>>>          i386:allyesconfig
>>>          i386:allmodconfig
>>>          m68k:defconfig
>>>          m68k:allmodconfig
>>>          m68k:sun3_defconfig
>>>          mips:allmodconfig
>>>          parisc:allmodconfig
>>>          powerpc:ppc6xx_defconfig
>>>          s390:defconfig
>>>          s390:allmodconfig
>>>          s390:allnoconfig
>>>          sparc32:allmodconfig
>>>          xtensa:allmodconfig
>>
>> Most (all?) 32-bit builds are broken due to commit 571ed1fd2390f74e
>> ("SUNRPC: Replace krb5_seq_lock with a lockless scheme"), presumably fixed
>> by Arnd's "SUNRPC: use cmpxchg64() in gss_seq_send64_fetch_and_inc"
>> (https://lore.kernel.org/patchwork/patch/994909/).
> 
> I have added that patch to the nfs tree merge in linux-next today.
> 

Most of the boot failures are hopefully fixed with
https://lore.kernel.org/patchwork/patch/995254/

Guenter
