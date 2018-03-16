From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the y2038 tree
Date: Fri, 16 Mar 2018 09:14:58 +0100
Message-ID: <CAK8P3a3Vf-ubqgdH67HE6LEfR=Vg6ZCf6+77qE+ZrwUocLCWTQ@mail.gmail.com>
References: <20180316132529.45126501@canb.auug.org.au> <CABeXuvrFkASp1g5LDW0MsENqtHRiT=Vp=F5GN3XdhGzaXkHNsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABeXuvrFkASp1g5LDW0MsENqtHRiT=Vp=F5GN3XdhGzaXkHNsw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 16, 2018 at 6:23 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> Hi Arnd,
>
> Do you want me to send the fix as a patch or should I re-post the series?

Please send a fix relative to linux-next. Due to my travel next week, I might
not be able to apply it right away but maybe Stephen can add it on top until
I get back.

      Arnd

> On Thu, Mar 15, 2018 at 7:25 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Arnd,
>>
>> After merging the y2038 tree, today's linux-next build (s390 allnoconfig)
>> failed like this:
>>
>> In file included from include/linux/elf.h:5:0,
>>                  from include/linux/module.h:15,
>>                  from init/main.c:16:
>> arch/s390/include/asm/elf.h:138:1: error: unknown type name 's390_compat_regs'
>>
>> Caused by commit
>>
>>   f00689038f71 ("include: Move compat_timespec/ timeval to compat_time.h")
>>
