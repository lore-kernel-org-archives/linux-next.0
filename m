From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: RE: linux-next: build warning after merge of the rtc tree
Date: Fri, 13 Jan 2017 08:42:00 +0000
Message-ID: <f7eec548c3214003ac7bf3c94ba70153@SFHDAG3NODE2.st.com>
References: <20170113141809.4784c004@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39570 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751222AbdAMImL (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Jan 2017 03:42:11 -0500
In-Reply-To: <20170113141809.4784c004@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>

Hi Stephen,

I'm going to send a patch to fix this warning.
Thanks,

Regards,
Amelie

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: vendredi 13 janvier 2017 04:18
> To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Amelie
> DELAUNAY <amelie.delaunay@st.com>; Mathieu Poirier
> <mathieu.poirier@linaro.org>
> Subject: linux-next: build warning after merge of the rtc tree
> 
> Hi Alexandre,
> 
> After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> In file included from drivers/rtc/rtc-stm32.c:14:0:
> drivers/rtc/rtc-stm32.c: In function 'stm32_rtc_probe':
> drivers/rtc/rtc-stm32.c:653:51: warning: large integer implicitly truncated to
> unsigned type [-Woverflow]
>   regmap_update_bits(rtc->dbp, PWR_CR, PWR_CR_DBP, ~PWR_CR_DBP);
>                                                    ^
> include/linux/regmap.h:73:42: note: in definition of macro
> 'regmap_update_bits'
>   regmap_update_bits_base(map, reg, mask, val, NULL, false, false)
>                                           ^
> drivers/rtc/rtc-stm32.c: In function 'stm32_rtc_remove':
> drivers/rtc/rtc-stm32.c:675:51: warning: large integer implicitly truncated to
> unsigned type [-Woverflow]
>   regmap_update_bits(rtc->dbp, PWR_CR, PWR_CR_DBP, ~PWR_CR_DBP);
>                                                    ^
> include/linux/regmap.h:73:42: note: in definition of macro
> 'regmap_update_bits'
>   regmap_update_bits_base(map, reg, mask, val, NULL, false, false)
>                                           ^
> 
> Introduced by commit
> 
>   4e64350f42e2 ("rtc: add STM32 RTC driver")
> 
> --
> Cheers,
> Stephen Rothwell
