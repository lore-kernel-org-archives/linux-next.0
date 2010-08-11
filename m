From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [lm-sensors] [PATCH -next] hwmon: jc42 depends on I2C
Date: Wed, 11 Aug 2010 20:15:11 +0200
Message-ID: <20100811201511.04216a64@hyperion.delvare>
References: <20100811140009.6ff33109.sfr@canb.auug.org.au>
	<20100811103511.41428e62.randy.dunlap@oracle.com>
	<1281548611.5745.287.camel@groeck-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:8246 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752617Ab0HKSPb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Aug 2010 14:15:31 -0400
In-Reply-To: <1281548611.5745.287.camel@groeck-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: guenter.roeck@ericsson.com
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>

On Wed, 11 Aug 2010 10:43:31 -0700, Guenter Roeck wrote:
> On Wed, 2010-08-11 at 13:35 -0400, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > jc42 uses i2c interfaces, so it should depend on I2C.
> > 
> > drivers/hwmon/jc42.c:426: error: implicit declaration of function 'i2c_check_functionality'
> > drivers/hwmon/jc42.c:521: error: implicit declaration of function 'i2c_smbus_read_word_data'
> > drivers/hwmon/jc42.c:529: error: implicit declaration of function 'i2c_smbus_write_word_data'
> > drivers/hwmon/jc42.c:580: error: implicit declaration of function 'i2c_add_driver'
> > drivers/hwmon/jc42.c:585: error: implicit declaration of function 'i2c_del_driver'
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > Cc:	lm-sensors@lm-sensors.org
> Acked-by: Guenter Roeck <guenter.roeck@ericsson.com>

Applied, thanks.

-- 
Jean Delvare
