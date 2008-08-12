From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: ide tree build failure
Date: Tue, 12 Aug 2008 09:36:19 +0200
Message-ID: <20080812073619.GA30453@gollum.tnic>
References: <20080812111801.7c701498.sfr@canb.auug.org.au>
Reply-To: petkovbb@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.157]:22784 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507AbYHLHgX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 03:36:23 -0400
Received: by fg-out-1718.google.com with SMTP id 19so1268483fgg.17
        for <linux-next@vger.kernel.org>; Tue, 12 Aug 2008 00:36:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20080812111801.7c701498.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>

On Tue, Aug 12, 2008 at 11:18:01AM +1000, Stephen Rothwell wrote:
> Hi Bart,
> 
> The linux-next build for 20080808 and later failed like this (on at least
> sparc, mips and m68k):
> 
> drivers/ide/ide-floppy.c:223: error: implicit declaration of function `sg_page'
> drivers/ide/ide-floppy.c:232: error: implicit declaration of function `sg_virt'
> drivers/ide/ide-floppy.c:242: error: implicit declaration of function `sg_next'
> 
> Caused by commit 788fc238e7b95dae0ff1e2e7c97351289277deea ("ide-floppy:
> use scatterlists for pio transfers") which intrduced usages of the sg_
> routines but did not include <linux/scatterlist.h>.

Thanks and sorry about that. I am pretty sure I did include it but probably in
an older version of the patch and forgot to refresh it before sending. Bart, can
you please add the include-line?

> 
> I will add an include of <linux/scatterlist.h> near the top of
> drivers/ide/ide-floppy.c in linux-next today.  It would be good if the
> above patch was fixed up, or another patch added to the ide tree fixing
> this.


-- 
Regards/Gruss,
    Boris.
