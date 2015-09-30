From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Sep 30
Date: Wed, 30 Sep 2015 14:54:58 +0200
Message-ID: <CAMuHMdU2GEzRFmeE6NyzPk+sgEuT8h+Vd_06wyyCtQWfxNi+cQ@mail.gmail.com>
References: <20150930161248.6deae391@canb.auug.org.au>
	<20150930081116.GA5406@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:36701 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932144AbbI3My6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2015 08:54:58 -0400
In-Reply-To: <20150930081116.GA5406@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Brian Norris <computersforpeace@gmail.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 30, 2015 at 10:11 AM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
> On Wed, Sep 30, 2015 at 04:12:48PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150929:
>
> i386 allmodconfig fails with:
> ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!
>
> arm allmodconfig fails with:
> ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
> ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
>
> Problem with:
> 7827e3acad2d ("mtd: mtdram: check offs and len in mtdram->erase")

64-bit-by-32-bit modulo calculations should use do_div().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
