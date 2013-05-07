From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 7 (bq27x00_battery)
Date: Tue, 07 May 2013 10:21:21 -0700
Message-ID: <51893811.8080102@infradead.org>
References: <20130507134922.981483ab1e5cb09e5543a6cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:59313 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752841Ab3EGRV5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 May 2013 13:21:57 -0400
In-Reply-To: <20130507134922.981483ab1e5cb09e5543a6cc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Vorontsov <cbou@mail.ru>, Rodolfo Giometti <giometti@linux.it>

On 05/06/13 20:49, Stephen Rothwell wrote:
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

on x86_64:

drivers/built-in.o: In function `bq27x00_read_i2c':
bq27x00_battery.c:(.text+0x169e20): undefined reference to `i2c_transfer'
bq27x00_battery.c:(.text+0x169e44): undefined reference to `i2c_transfer'
drivers/built-in.o: In function `bq27x00_battery_init':
bq27x00_battery.c:(.init.text+0x82af): undefined reference to `i2c_register_driver'
drivers/built-in.o: In function `bq27x00_battery_exit':
bq27x00_battery.c:(.exit.text+0xd8f): undefined reference to `i2c_del_driver'


when CONFIG_I2C=m and CONFIG_BATTERY_BQ27X00_I2C=y.


-- 
~Randy
