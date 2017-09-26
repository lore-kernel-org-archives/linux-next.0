From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 26 Sep 2017 07:15:37 +0100
Message-ID: <ACE7F7E8-BEB1-4B02-9467-AB61DBB40D72@jic23.retrosnub.co.uk>
References: <20170926135441.7396587f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926135441.7396587f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-next.vger.kernel.org



On 26 September 2017 04:54:41 BST, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>Hi Greg,
>
>After merging the staging tree, today's linux-next build (x86_64
>allmodconfig) failed like this:
>
>drivers/iio/counter/stm32-lptimer-cnt.c:181:2: error: unknown field
>'driver_module' specified in initializer
>  .driver_module = THIS_MODULE,
>  ^
>In file included from include/linux/linkage.h:6:0,
>                 from include/linux/kernel.h:6,
>                 from include/asm-generic/bug.h:15,
>                 from arch/x86/include/asm/bug.h:81,
>                 from include/linux/bug.h:4,
>                 from include/linux/bitfield.h:18,
>                 from drivers/iio/counter/stm32-lptimer-cnt.c:13:
>include/linux/export.h:35:21: error: initialization from incompatible
>pointer type [-Werror=incompatible-pointer-types]
> #define THIS_MODULE (&__this_module)
>                     ^
>drivers/iio/counter/stm32-lptimer-cnt.c:181:19: note: in expansion of
>macro 'THIS_MODULE'
>  .driver_module = THIS_MODULE,
>                   ^
>include/linux/export.h:35:21: note: (near initialization for
>'stm32_lptim_cnt_iio_info.write_raw_get_fmt')
> #define THIS_MODULE (&__this_module)
>                     ^
>drivers/iio/counter/stm32-lptimer-cnt.c:181:19: note: in expansion of
>macro 'THIS_MODULE'
>  .driver_module = THIS_MODULE,
>                   ^
>
>Caused by commit
>
>97623c0a80a6 ("iio: drop iio_info.driver_module and
>iio_trigger_ops.owner.")
>
>I have used the staging tree from next-20170922 for today.

Sorry, my mess up. Will send a patch dropping that line shortly..

Jonathan

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
