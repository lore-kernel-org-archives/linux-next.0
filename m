From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Fri, 20 Jul 2012 20:38:11 +0200
Message-ID: <CAMuHMdWRM0y07r1nL-9fXB3nLKXMgftqhiruEeuEe4QYDA2o9Q@mail.gmail.com>
References: <20120713141345.f71b7c01f720d616d74721dd@canb.auug.org.au>
	<20120713121053.0637219f@pyramind.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120713121053.0637219f@pyramind.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, David Daney <david.daney@cavium.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: linux-next.vger.kernel.org

Hi Alan, David,

On Fri, Jul 13, 2012 at 1:10 PM, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> On Fri, 13 Jul 2012 14:13:45 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> drivers/char/mwave/mwavedd.c: In function 'register_serial_portandirq':
>> drivers/char/mwave/mwavedd.c:472:2: error: implicit declaration of function 'serial8250_register_port' [-Werror=implicit-function-declaration]
>> cc1: some warnings being treated as errors
>> drivers/misc/ibmasm/uart.c: In function 'ibmasm_register_uart':
>> drivers/misc/ibmasm/uart.c:57:2: error: implicit declaration of function 'serial8250_register_port' [-Werror=implicit-function-declaration]
>> cc1: some warnings being treated as errors
>>
>> Caused by commit 2655a2c76f80 ("8250: use the 8250 register interface not
>> the legacy one").  Grep is your friend.
>
> My fault on that one not GregKH's. I'll wrap that into the updated patch
> series. I thought I had them all but I forgot to grep off in drivers/misc.

Today's build failed because there's a new user in the MIPS tree:
arch/mips/cavium-octeon/serial.c

http://kisskb.ellerman.id.au/kisskb/buildresult/6739341/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
