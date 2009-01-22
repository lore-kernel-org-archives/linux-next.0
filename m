From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide tree build failure
Date: Thu, 22 Jan 2009 14:22:34 +0100
Message-ID: <200901221422.34187.bzolnier@gmail.com>
References: <20090122125700.bde1fabe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.186]:1357 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428AbZAVNWR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jan 2009 08:22:17 -0500
Received: by nf-out-0910.google.com with SMTP id d3so673175nfc.21
        for <linux-next@vger.kernel.org>; Thu, 22 Jan 2009 05:22:15 -0800 (PST)
In-Reply-To: <20090122125700.bde1fabe.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


Hi,

On Thursday 22 January 2009, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/ide/ide-eh.c: In function 'do_reset1':
> drivers/ide/ide-eh.c:341: error: implicit declaration of function 'ndelay'
> 
> The immediate cause is commit 891ac63a7b4e11f13cfdbef59c77d489edd8e0ba
> ("ide: move error handling code to ide-eh.c").
> 
> I have dropped the ide tree for today.

Yeah, ide-eh.c should explicitly include <linux/delay.h>
(on x86 it gets pulled indirectly so I haven't noticed it).

Should be fixed now.

Thanks,
Bart
