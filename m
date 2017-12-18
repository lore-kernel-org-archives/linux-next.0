From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Mon, 18 Dec 2017 09:52:50 +0100
Message-ID: <CAMuHMdVp7fv7m0cedzRoDtG_k6OW9GEGOoWiTfc87nJxpp4o3g@mail.gmail.com>
References: <20171218142826.63e7a0c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171218142826.63e7a0c0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, Dec 18, 2017 at 4:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> .config:4300:warning: symbol value '' invalid for SERIAL_SH_SCI_NR_UARTS
> *
> * Restart config...
> *
> *
> * Serial drivers
> *
> 8250/16550 and compatible serial support (SERIAL_8250) [M/y/?] m
>         .
>         .
>         .
> SuperH SCI(F) serial port support (SERIAL_SH_SCI) [M/n/y] m
>   Maximum number of SCI(F) serial ports (SERIAL_SH_SCI_NR_UARTS) [] (NEW) aborted!
>
> Console input/output is redirected. Run 'make oldconfig' to update configuration.
>
>
> Caused by commit
>
>   f6731485a519 ("tty: serial: sh-sci: Hide number of ports config question")
>
> I have used the tty tree from next-20171215 for today.

Sorry, silly misunderstanding of Kconfig behavior on my side.
Patch sent.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
