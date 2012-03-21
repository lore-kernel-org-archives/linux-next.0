From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dma-mapping: convert ARCH_HAS_DMA_SET_COHERENT_MASK
 to kconfig symbol
Date: Wed, 21 Mar 2012 16:15:55 +0800
Message-ID: <CAN1soZwXh6DviO5CHcj_ogM1VK23V2c4CKZf+iMmeP43rwtW9w@mail.gmail.com>
References: <4F68CD9C.3090001@windriver.com>
	<1332296149-28110-1-git-send-email-robherring2@gmail.com>
	<alpine.LFD.2.02.1203202230230.24151@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:52063 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120Ab2CUIP5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Mar 2012 04:15:57 -0400
Received: by bkcik5 with SMTP id ik5so665264bkc.19
        for <linux-next@vger.kernel.org>; Wed, 21 Mar 2012 01:15:56 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.02.1203202230230.24151@xanadu.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Rob Herring <robherring2@gmail.com>, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Haojian Zhuang <haojian.zhuang@marvell.com>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Halasa <khc@pm.waw.pl>

On Wed, Mar 21, 2012 at 10:30 AM, Nicolas Pitre <nico@fluxnic.net> wrote:
> On Tue, 20 Mar 2012, Rob Herring wrote:
>
>> From: Rob Herring <rob.herring@calxeda.com>
>>
>> The only users of ARCH_HAS_DMA_SET_COHERENT_MASK are 2 ARM platforms:
>> ixp4xx and pxa cm_x2xx. We've been getting lucky that the define is
>> implicitly included before dma-mapping.h, but the removal of io.h broke
>> things (c334bc1 ARM: make mach/io.h include optional). Since memory.h
>> is the correct place, but no longer exists, convert the define to a
>> kconfig entry.
>>
>> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>> Cc: Russell King <linux@arm.linux.org.uk>
>> Cc: Imre Kaloz <kaloz@openwrt.org>
>> Cc: Krzysztof Halasa <khc@pm.waw.pl>
>> Cc: Eric Miao <eric.y.miao@gmail.com>
>> Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
>> Cc: Vinod Koul <vinod.koul@intel.com>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>
> Acked-by: Nicolas Pitre <nico@linaro.org>
>
Acked.

Imre & Krzysztof,

Do you mind that I merge these patches into arch-pxa git tree? Since a
lot of files in arch-pxa are changed.

Best Regards
Haojian
