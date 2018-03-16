From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: linux-next: build failure after merge of the y2038 tree
Date: Thu, 15 Mar 2018 22:23:49 -0700
Message-ID: <CABeXuvrFkASp1g5LDW0MsENqtHRiT=Vp=F5GN3XdhGzaXkHNsw@mail.gmail.com>
References: <20180316132529.45126501@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316132529.45126501@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi Arnd,

Do you want me to send the fix as a patch or should I re-post the series?

Thanks,
Deepa

On Thu, Mar 15, 2018 at 7:25 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Arnd,
>
> After merging the y2038 tree, today's linux-next build (s390 allnoconfig)
> failed like this:
>
> In file included from include/linux/elf.h:5:0,
>                  from include/linux/module.h:15,
>                  from init/main.c:16:
> arch/s390/include/asm/elf.h:138:1: error: unknown type name 's390_compat_regs'
>
> Caused by commit
>
>   f00689038f71 ("include: Move compat_timespec/ timeval to compat_time.h")
>
> --
> Cheers,
> Stephen Rothwell
