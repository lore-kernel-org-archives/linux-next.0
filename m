From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next:  ide/sparc build failure
Date: Tue, 8 Jul 2008 19:48:32 +0200
Message-ID: <200807081948.32605.bzolnier@gmail.com>
References: <20080708224803.8ce5aa56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.28]:1788 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753475AbYGHSu4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 14:50:56 -0400
Received: by yw-out-2324.google.com with SMTP id 9so1214191ywe.1
        for <linux-next@vger.kernel.org>; Tue, 08 Jul 2008 11:50:56 -0700 (PDT)
In-Reply-To: <20080708224803.8ce5aa56.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

On Tuesday 08 July 2008, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next build (sparc allmodconfig) failed like this:
> 
> drivers/ide/setup-pci.c:203: error: `DMA_32BIT_MASK' undeclared (first use in this function)
> drivers/ide/setup-pci.c:203: error: (Each undeclared identifier is reported only once
> drivers/ide/setup-pci.c:203: error: for each function it appears in.)
> 
> Caused by commit 711304186fe494bee4b9c94b3c195b167b2d4b87 ("ide: remove
> needless includes from setup-pci.c").  Seems like it was overdone.

indeed...

> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

thanks, fixed in the guilty patch now
