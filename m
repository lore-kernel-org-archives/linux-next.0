From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 8 (gpio-mcp23s08)
Date: Wed, 08 May 2013 10:57:27 -0700
Message-ID: <518A9207.5030309@infradead.org>
References: <20130508140122.e4747b58be4333060b7a248a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:41174 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757010Ab3EHR6G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 May 2013 13:58:06 -0400
In-Reply-To: <20130508140122.e4747b58be4333060b7a248a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, Linus Walleij <linus.walleij@linaro.org>

On 05/07/13 21:01, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v3.11 destined work to your linux-next included
> branches until after v3.10-rc1 is released.
> 
> I am receiving a (un)reasonable number of conflicts from there being
> multiple copies of some commits in various trees.   Please clean this up
> and resist the temptataion to rebase your trees on the way to your
> upstream ...
> 
> Changes since 20130506:
> 
> <crickets :-)>
> 


on i386:

drivers/built-in.o: In function `mcp23017_write':
gpio-mcp23s08.c:(.text+0x20e9): undefined reference to `i2c_smbus_write_word_data'
drivers/built-in.o: In function `mcp23017_read':
gpio-mcp23s08.c:(.text+0x2103): undefined reference to `i2c_smbus_read_word_data'
drivers/built-in.o: In function `mcp23008_write':
gpio-mcp23s08.c:(.text+0x2164): undefined reference to `i2c_smbus_write_byte_data'
drivers/built-in.o: In function `mcp23008_read':
gpio-mcp23s08.c:(.text+0x217f): undefined reference to `i2c_smbus_read_byte_data'
drivers/built-in.o: In function `mcp23s08_init':
gpio-mcp23s08.c:(.init.text+0x1ae): undefined reference to `i2c_register_driver'
drivers/built-in.o: In function `mcp23s08_exit':
gpio-mcp23s08.c:(.exit.text+0x22): undefined reference to `i2c_del_driver'


when CONFIG_I2C=m and CONFIG_GPIO_MCP23S08=y.


-- 
~Randy
