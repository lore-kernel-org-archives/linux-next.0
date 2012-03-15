From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 15 (staging/android/ram_console.c)
Date: Thu, 15 Mar 2012 14:39:56 -0700
Message-ID: <4F6261AC.7030903@xenotime.net>
References: <20120315185935.a0c475a30b2836765273a1e5@canb.auug.org.au> <4F62118A.2070403@xenotime.net> <20120315210333.GA6647@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:54323 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932420Ab2COVj5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 17:39:57 -0400
In-Reply-To: <20120315210333.GA6647@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org, Brian Swetland <swetland@google.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 03/15/2012 02:03 PM, Greg Kroah-Hartman wrote:

> On Thu, Mar 15, 2012 at 08:58:02AM -0700, Randy Dunlap wrote:
>> On 03/15/2012 12:59 AM, Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> News: the build system (see below) has had its toolchains for most
>>> architectures updated to gcc 4.6.3.  People might like to check the build
>>> results and consider if this change has caused any problems.  There are
>>> also a number of architectures that are building today for the first
>>> time.  Thanks to Tony Breeds for his efforts in providing toolchains.
>>>
>>> Changes since 20120314:
>>
>>
>>
>> on x86_64 when CONFIG_PRINTK is not enabled:
>>
>>
>> drivers/staging/android/ram_console.c:99:6: error: 'dmesg_restrict' undeclared (first use in this function)
> 
> This patch should solve this, right?
> 
> 
> diff --git a/drivers/staging/android/ram_console.c b/drivers/staging/android/ram_console.c
> index 2918bc1..ce140ff 100644
> --- a/drivers/staging/android/ram_console.c
> +++ b/drivers/staging/android/ram_console.c
> @@ -85,6 +85,10 @@ static int __init ram_console_module_init(void)
>  	return platform_driver_probe(&ram_console_driver, ram_console_probe);
>  }
>  
> +#ifndef CONFIG_PRINTK
> +#define dmesg_restrict	0
> +#endif
> +
>  static ssize_t ram_console_read_old(struct file *file, char __user *buf,
>  				    size_t len, loff_t *offset)
>  {


Yes, thanks.

Acked-by: Randy Dunlap <rdunlap@xenotime.net>


-- 
~Randy
