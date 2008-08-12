From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide tree build failure
Date: Tue, 12 Aug 2008 11:15:02 +0200
Message-ID: <200808121115.03065.bzolnier@gmail.com>
References: <20080812111801.7c701498.sfr@canb.auug.org.au> <20080812073619.GA30453@gollum.tnic>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ik-out-1112.google.com ([66.249.90.182]:39719 "EHLO
	ik-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753274AbYHLJbw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 05:31:52 -0400
Received: by ik-out-1112.google.com with SMTP id c28so2808604ika.5
        for <linux-next@vger.kernel.org>; Tue, 12 Aug 2008 02:31:49 -0700 (PDT)
In-Reply-To: <20080812073619.GA30453@gollum.tnic>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: petkovbb@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>

On Tuesday 12 August 2008, Borislav Petkov wrote:
> On Tue, Aug 12, 2008 at 11:18:01AM +1000, Stephen Rothwell wrote:
> > Hi Bart,
> > 
> > The linux-next build for 20080808 and later failed like this (on at least
> > sparc, mips and m68k):
> > 
> > drivers/ide/ide-floppy.c:223: error: implicit declaration of function `sg_page'
> > drivers/ide/ide-floppy.c:232: error: implicit declaration of function `sg_virt'
> > drivers/ide/ide-floppy.c:242: error: implicit declaration of function `sg_next'
> > 
> > Caused by commit 788fc238e7b95dae0ff1e2e7c97351289277deea ("ide-floppy:
> > use scatterlists for pio transfers") which intrduced usages of the sg_
> > routines but did not include <linux/scatterlist.h>.
> 
> Thanks and sorry about that. I am pretty sure I did include it but probably in
> an older version of the patch and forgot to refresh it before sending. Bart, can
> you please add the include-line?

Done.
