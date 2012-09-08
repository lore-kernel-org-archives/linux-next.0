From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: mmotm 2012-09-06-16-46 uploaded (drivers/misc/lis3lv02d/lis3lv02d_spi.c)
Date: Fri, 07 Sep 2012 17:50:12 -0700
Message-ID: <504A9644.4070303@xenotime.net>
References: <20120906234735.1B54B20004E@hpza10.eem.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy12-pub.bluehost.com ([50.87.16.10]:39467 "HELO
	oproxy12-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1759285Ab2IHAug (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Sep 2012 20:50:36 -0400
In-Reply-To: <20120906234735.1B54B20004E@hpza10.eem.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, linux-next@vger.kernel.org, Daniel Mack <daniel@caiaq.de>

On 09/06/2012 04:47 PM, akpm@linux-foundation.org wrote:

> The mm-of-the-moment snapshot 2012-09-06-16-46 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 



on x86_64:

CONFIG_OF and CONFIG_DTC are not enabled.


drivers/misc/lis3lv02d/lis3lv02d_spi.c:137:3: error: implicit declaration of function 'of_match_ptr'
drivers/misc/lis3lv02d/lis3lv02d_spi.c:137:3: error: initializer element is not constant
drivers/misc/lis3lv02d/lis3lv02d_spi.c:137:3: error: (near initialization for 'lis302dl_spi_driver.driver.of_match_table')


-- 
~Randy
