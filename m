From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 11 (staging/iio/adc + gpio)
Date: Wed, 11 May 2011 16:40:58 -0700
Message-ID: <20110511164058.5b562771.randy.dunlap@oracle.com>
References: <20110511152508.0d5d5aa6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:63441 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754321Ab1EKXlb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 May 2011 19:41:31 -0400
In-Reply-To: <20110511152508.0d5d5aa6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Michael Hennerich <hennerich@blackfin.uclinux.org>

On Wed, 11 May 2011 15:25:08 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110510:


When GPIOLIB is not enabled and GENERIC_GPIO is not enabled: (not a new problem)

drivers/staging/iio/adc/ad7780.c:247: error: 'GPIOF_OUT_INIT_LOW' undeclared (first use in this function)

Its Kconfig entry says:

config AD7780
	tristate "Analog Devices AD7780 AD7781 ADC driver"
	depends on SPI

but surely it should depend on (or select) some GPIO kconfig symbol.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
