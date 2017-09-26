From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Tue, 26 Sep 2017 13:54:41 +1000
Message-ID: <20170926135441.7396587f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44991 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754194AbdIZDyn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Sep 2017 23:54:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/iio/counter/stm32-lptimer-cnt.c:181:2: error: unknown field 'driver_module' specified in initializer
  .driver_module = THIS_MODULE,
  ^
In file included from include/linux/linkage.h:6:0,
                 from include/linux/kernel.h:6,
                 from include/asm-generic/bug.h:15,
                 from arch/x86/include/asm/bug.h:81,
                 from include/linux/bug.h:4,
                 from include/linux/bitfield.h:18,
                 from drivers/iio/counter/stm32-lptimer-cnt.c:13:
include/linux/export.h:35:21: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
 #define THIS_MODULE (&__this_module)
                     ^
drivers/iio/counter/stm32-lptimer-cnt.c:181:19: note: in expansion of macro 'THIS_MODULE'
  .driver_module = THIS_MODULE,
                   ^
include/linux/export.h:35:21: note: (near initialization for 'stm32_lptim_cnt_iio_info.write_raw_get_fmt')
 #define THIS_MODULE (&__this_module)
                     ^
drivers/iio/counter/stm32-lptimer-cnt.c:181:19: note: in expansion of macro 'THIS_MODULE'
  .driver_module = THIS_MODULE,
                   ^

Caused by commit

  97623c0a80a6 ("iio: drop iio_info.driver_module and iio_trigger_ops.owner.")

I have used the staging tree from next-20170922 for today.

-- 
Cheers,
Stephen Rothwell
