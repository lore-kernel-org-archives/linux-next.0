From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Oct 4
Date: Thu, 4 Oct 2018 16:21:42 +0200
Message-ID: <CAMuHMdXfhbFi8HYtqd6BeACyG64_eQvoiSQ7DMpyOmdXEXPymg@mail.gmail.com>
References: <20181004183449.36bcc93b@canb.auug.org.au> <20181004134644.GA9130@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004134644.GA9130@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 4, 2018 at 3:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
> Time for a status report.
>
> Build results:
>         total: 135 pass: 121 fail: 14
> Failed builds:
>         arm:allmodconfig
>         i386:allyesconfig
>         i386:allmodconfig
>         m68k:defconfig
>         m68k:allmodconfig
>         m68k:sun3_defconfig
>         mips:allmodconfig
>         parisc:allmodconfig
>         powerpc:ppc6xx_defconfig
>         s390:defconfig
>         s390:allmodconfig
>         s390:allnoconfig
>         sparc32:allmodconfig
>         xtensa:allmodconfig

Most (all?) 32-bit builds are broken due to commit 571ed1fd2390f74e
("SUNRPC: Replace krb5_seq_lock with a lockless scheme"), presumably fixed
by Arnd's "SUNRPC: use cmpxchg64() in gss_seq_send64_fetch_and_inc"
(https://lore.kernel.org/patchwork/patch/994909/).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
