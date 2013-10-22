From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH -next] staging/iio/adc: MXS_LRADC depends on INPUT
Date: Tue, 22 Oct 2013 06:51:03 +0200
Message-ID: <201310220651.03499.marex@denx.de>
References: <CA+r1Zhjo08EEoHsWkeDDKoc8Le6eDq4fZxZaa1Jc8cfOLsLsMg@mail.gmail.com> <526603EB.3060504@infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:49386 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268Ab3JVEvN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2013 00:51:13 -0400
In-Reply-To: <526603EB.3060504@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jim Davis <jim.epost@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org

Dear Randy Dunlap,

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> mxs-lradc.c uses many input_() functions so it should
> depend on INPUT to fix build errors.
> 
> drivers/built-in.o: In function `mxs_lradc_ts_unregister':
> drivers/staging/iio/adc/mxs-lradc.c:905: undefined reference to
> `input_unregister_device' drivers/staging/iio/adc/mxs-lradc.c:905:
> undefined reference to `input_unregister_device' drivers/built-in.o: In
> function `input_report_abs':
> include/linux/input.h:399: undefined reference to `input_event'
> include/linux/input.h:399: undefined reference to `input_event'
> include/linux/input.h:399: undefined reference to `input_event'
> drivers/built-in.o: In function `input_report_key':
> include/linux/input.h:389: undefined reference to `input_event'
> drivers/built-in.o: In function `input_sync':
> include/linux/input.h:414: undefined reference to `input_event'
> drivers/built-in.o:include/linux/input.h:389: more undefined references to
> `input_event' follow
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Marek Vasut <marex@denx.de>

Thanks!

Best regards,
Marek Vasut
