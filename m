From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH -next] extcon: fix extcon-sm5502 build when CONFIG_I2C=m
Date: Wed, 13 Aug 2014 16:40:49 +0900
Message-ID: <53EB1681.9040602@samsung.com>
References: <53EB122E.3050407@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65154 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbaHMHky (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2014 03:40:54 -0400
In-reply-to: <53EB122E.3050407@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Dear Randy,

Thanks for your report.

I catched this issue. So, I fix this bug already. You can check it on following url:
- http://git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/commit/?h=extcon-test&id=5e519b04db6c5b42f8d8ee246c16903c130b5fd5


Best Regards,
Chanwoo Choi

On 08/13/2014 04:22 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build errors in extcon-sm5502.c by making EXTCON_SM5502 depend
> on I2C since it selects REGMAP_I2C.  The build errors happen when
> CONFIG_I2C=m and CONFIG_EXTCON_SM5502=y. This Kconfig change causes
> CONFIG_EXTCON_SM5502 to be =m when CONFIG_I2C=m.
> 
> drivers/built-in.o: In function `regmap_smbus_byte_reg_read':
> regmap-i2c.c:(.text+0x5030a): undefined reference to `i2c_smbus_read_byte_data'
> drivers/built-in.o: In function `regmap_smbus_byte_reg_write':
> regmap-i2c.c:(.text+0x50338): undefined reference to `i2c_smbus_write_byte_data'
> drivers/built-in.o: In function `regmap_smbus_word_reg_read':
> regmap-i2c.c:(.text+0x50356): undefined reference to `i2c_smbus_read_word_data'
> drivers/built-in.o: In function `regmap_smbus_word_reg_write':
> regmap-i2c.c:(.text+0x50384): undefined reference to `i2c_smbus_write_word_data'
> drivers/built-in.o: In function `regmap_i2c_read':
> regmap-i2c.c:(.text+0x503cf): undefined reference to `i2c_transfer'
> drivers/built-in.o: In function `regmap_i2c_gather_write':
> regmap-i2c.c:(.text+0x50442): undefined reference to `i2c_transfer'
> drivers/built-in.o: In function `regmap_i2c_write':
> regmap-i2c.c:(.text+0x50474): undefined reference to `i2c_master_send'
> drivers/built-in.o: In function `sm5502_muic_i2c_init':
> extcon-sm5502.c:(.init.text+0x6630): undefined reference to `i2c_register_driver'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc:	MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc:	Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/extcon/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux-next-20140813/drivers/extcon/Kconfig
> ===================================================================
> --- linux-next-20140813.orig/drivers/extcon/Kconfig
> +++ linux-next-20140813/drivers/extcon/Kconfig
> @@ -72,6 +72,7 @@ config EXTCON_PALMAS
>  
>  config EXTCON_SM5502
>  	tristate "SM5502 EXTCON support"
> +	depends on I2C
>  	select IRQ_DOMAIN
>  	select REGMAP_I2C
>  	select REGMAP_IRQ
> 
