From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: "amba: Remove AMBA level regulator support" commit.
Date: Fri, 13 Apr 2012 14:30:57 +0200
Message-ID: <CACRpkdYfRVkUqhuNw3iwHNFZJwG=2MAqtzZyK6qytFOzqUrosQ@mail.gmail.com>
References: <20120413012230.GA30438@windriver.com>
	<CAAQ0ZWReL=+bm9UOnt2=Dfy0zeWbJe3=y3pPzUKRzm2y277kFQ@mail.gmail.com>
	<20120413103207.GL24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:33213 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751677Ab2DMMa6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Apr 2012 08:30:58 -0400
Received: by ghrr11 with SMTP id r11so1554382ghr.19
        for <linux-next@vger.kernel.org>; Fri, 13 Apr 2012 05:30:57 -0700 (PDT)
In-Reply-To: <20120413103207.GL24211@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Shawn Guo <shawn.guo@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, broonie@opensource.wolfsonmicro.com, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vinod Koul <vinod.koul@intel.com>

On Fri, Apr 13, 2012 at 12:32 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Apr 13, 2012 at 10:01:52AM +0800, Shawn Guo wrote:
>> That's because Mark's patch removes "#include
>> <linux/regulator/consumer.h>" included indirectly by
>> drivers/dma/ste_dma40.c from linux/amba/bus.h. =A0The ste_dma40.c sh=
ould
>> really directly includes consumer.h.
>
> Okay, I'll drop this patch because it's causing regressions, so it ca=
n't
> be pushed as a 'fix' during -rc.

Actually *not* having Marks patch also causes a regression on Ux500,
albeit not at compile time, but at runtime.

So for me as ux500 maintainer it's perfectly OK to have compilation
broken until that DMA patch arrives (should just be an issue of the
DMA maintainer picking it up), but if others feel differently
by all means hold it off until the other one arrives.

Yours,
Linus Walleij
