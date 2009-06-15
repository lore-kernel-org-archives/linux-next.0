From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide tree build failure
Date: Mon, 15 Jun 2009 18:14:12 +0200
Message-ID: <200906151814.13305.bzolnier@gmail.com>
References: <20090615113430.21122e44.sfr@canb.auug.org.au> <20090615053514.GA13226@liondog.tnic>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f210.google.com ([209.85.219.210]:35402 "EHLO
	mail-ew0-f210.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760318AbZFOQtZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2009 12:49:25 -0400
In-Reply-To: <20090615053514.GA13226@liondog.tnic>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <petkovbb@googlemail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 15 June 2009 07:35:14 Borislav Petkov wrote:
> Hi,
> 
> On Mon, Jun 15, 2009 at 11:34:30AM +1000, Stephen Rothwell wrote:
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/ide/ide-tape.c: In function 'idetape_chrdev_open':
> > drivers/ide/ide-tape.c:1515: error: implicit declaration of function 'idetape_read_position'
> > 
> > Caused by commit 55ce3a129ea2e8faba4a11bb5dbc305590d1c20c ("ide-tape: fix
> > READ POSITION cmd handling") interacting with the later merge
> > 8dcce4081305d3d1629190edd112e6473c315cbc ("Merge branch
> > 'bp-remove-pc-buf' into for-next").
> > 
> > I have used the ide tree from next-20090612 for today.
> 
> Ah, the function got renamed in 55ce3a129ea2e8faba4a11bb5dbc305590d1c20c. Here's
> a fix:
> 
> ---
> From: Borislav Petkov <petkovbb@gmail.com>
> Date: Mon, 15 Jun 2009 07:32:04 +0200
> Subject: [PATCH] ide-tape: fix build issue
> 
> This fixes
> 
> drivers/ide/ide-tape.c: In function `idetape_chrdev_open':
> drivers/ide/ide-tape.c:1515: error: implicit declaration of function `idetape_read_position'
> make[1]: *** [drivers/ide/ide-tape.o] Error 1
> 
> Signed-off-by: Borislav Petkov <petkovbb@gmail.com>

thanks, applied
