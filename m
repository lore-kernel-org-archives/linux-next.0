From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Fri, 29 Jan 2016 13:03:39 +0100
Message-ID: <CAMuHMdUy-cqeN8COO4rdpY-mOH+6gth40wB31-edkj8CO5PFCw@mail.gmail.com>
References: <20160112164034.0fe945a7@canb.auug.org.au>
	<20160112163835.GD347@kvack.org>
	<20160127134024.0fababf6@canb.auug.org.au>
	<20160129113056.GP10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:33812 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752302AbcA2MDk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2016 07:03:40 -0500
In-Reply-To: <20160129113056.GP10826@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin LaHaise <bcrl@kvack.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Jan 29, 2016 at 12:30 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
>> Background: new aio code is adding __get_user() calls referencing 64
>> bit quantities (__u64 and __s64).
>
> There's lots more architectures which do not support 64-bit get_user()
> _or_ __get_user(): avr32, blackfin, metag for example, and m68k which
> has this interesting thing "/* case 8: disabled because gcc-4.1 has a
> broken typeof \" in its *get_user() implementation.

And if you enable it again, you get lots of "warning: cast to pointer from
integer of different size", like you mentioned.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
