From: "Borislav Petkov" <petkovbb@googlemail.com>
Subject: Re: linux-next: ide tree build failure
Date: Mon, 8 Dec 2008 18:49:17 +0100
Message-ID: <9ea470500812080949v51b6c91by76e72d5a96e05320@mail.gmail.com>
References: <20081208131609.c6e0fd31.sfr@canb.auug.org.au>
	 <200812081810.59270.bzolnier@gmail.com>
Reply-To: petkovbb@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:6053 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbYLHRtS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 12:49:18 -0500
Received: by yx-out-2324.google.com with SMTP id 8so499995yxm.1
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2008 09:49:17 -0800 (PST)
In-Reply-To: <200812081810.59270.bzolnier@gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Dec 8, 2008 at 6:10 PM, Bartlomiej Zolnierkiewicz
<bzolnier@gmail.com> wrote:
> On Monday 08 December 2008, Stephen Rothwell wrote:
>> Hi Bart,
>>
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> drivers/built-in.o: In function `.ide_cd_do_request':
>> ide-cd.c:(.text+0x11a97c): undefined reference to `.ide_cd_get_xferlen'
>> drivers/built-in.o:(.toc1+0x83b8): undefined reference to `ide_cd_expiry'
>
> I see, BLK_DEV_IDECD needs to select IDE_ATAPI now.  I updated
> ide-atapi-accomodate-transfer-length-calculation-for-ide-cd.patch
> accordingly so ppc64_defconfing should build fine again.

Ups, sorry for that one.

-- 
Regards/Gruss,
Boris
