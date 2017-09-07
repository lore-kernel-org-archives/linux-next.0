From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 7 (iio/adc/stm32)
Date: Thu, 7 Sep 2017 08:45:29 -0700
Message-ID: <279c9bde-d174-e78a-407c-a9fd9aa6a0d5@infradead.org>
References: <20170907162457.0a04ae1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44986 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752200AbdIGPpb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Sep 2017 11:45:31 -0400
In-Reply-To: <20170907162457.0a04ae1e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>

On 09/06/17 23:24, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v4.15 related material to your linux-next
> included branches until after v4.14-rc1 has been released.
> 
> Changes since 20170906:
> 

on i386:

CONFIG_STM32_ADC_CORE=y
CONFIG_STM32_ADC=y
CONFIG_IIO_STM32_LPTIMER_TRIGGER=m
CONFIG_IIO_STM32_TIMER_TRIGGER=y


causes:
drivers/iio/adc/stm32-adc.o: In function `stm32_adc_get_trig_extsel':
stm32-adc.c:(.text+0x9d6): undefined reference to `is_stm32_lptim_trigger'

due to builtin code trying to call code in a loadable module.


-- 
~Randy
