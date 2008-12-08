From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide tree build failure
Date: Mon, 8 Dec 2008 18:10:59 +0100
Message-ID: <200812081810.59270.bzolnier@gmail.com>
References: <20081208131609.c6e0fd31.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.29]:3153 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753351AbYLHRLq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 12:11:46 -0500
Received: by yx-out-2324.google.com with SMTP id 8so489886yxm.1
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2008 09:11:44 -0800 (PST)
In-Reply-To: <20081208131609.c6e0fd31.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Borislav Petkov <petkovbb@googlemail.com>

On Monday 08 December 2008, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/built-in.o: In function `.ide_cd_do_request':
> ide-cd.c:(.text+0x11a97c): undefined reference to `.ide_cd_get_xferlen'
> drivers/built-in.o:(.toc1+0x83b8): undefined reference to `ide_cd_expiry'

I see, BLK_DEV_IDECD needs to select IDE_ATAPI now.  I updated
ide-atapi-accomodate-transfer-length-calculation-for-ide-cd.patch
accordingly so ppc64_defconfing should build fine again.

Thanks,
Bart
