From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Sep 30
Date: Wed, 30 Sep 2015 19:01:27 +0530
Message-ID: <20150930133127.GA7983@sudip-pc>
References: <20150930161248.6deae391@canb.auug.org.au>
 <20150930081116.GA5406@sudip-pc>
 <CAMuHMdU2GEzRFmeE6NyzPk+sgEuT8h+Vd_06wyyCtQWfxNi+cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34561 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753913AbbI3Nbh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2015 09:31:37 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdU2GEzRFmeE6NyzPk+sgEuT8h+Vd_06wyyCtQWfxNi+cQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Brian Norris <computersforpeace@gmail.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 30, 2015 at 02:54:58PM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 30, 2015 at 10:11 AM, Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> > On Wed, Sep 30, 2015 at 04:12:48PM +1000, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20150929:
> >
> > i386 allmodconfig fails with:
> > ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> > ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> >
> > arm allmodconfig fails with:
> > ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
> > ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
> >
> > Problem with:
> > 7827e3acad2d ("mtd: mtdram: check offs and len in mtdram->erase")
> 
> 64-bit-by-32-bit modulo calculations should use do_div().
Yes, already sent a patch but it showed build warnings in xtensa and
cris, so just submitted v2. Thanks.

regards
sudip
