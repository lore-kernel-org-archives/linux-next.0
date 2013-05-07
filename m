From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: linux-next: Tree for May 7 (iio)
Date: Tue, 07 May 2013 20:12:46 +0200
Message-ID: <5189441E.6020606@metafoo.de>
References: <20130507134922.981483ab1e5cb09e5543a6cc@canb.auug.org.au> <51893523.9000105@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51893523.9000105-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 05/07/2013 07:08 PM, Randy Dunlap wrote:
> On 05/06/13 20:49, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v3.11 destined work to your linux-next included
>> branches until after v3.10-rc1 is released.
>>
>> I am receiving a (un)reasonable number of conflicts from there being
>> multiple copies of some commits in various trees.   Please clean this up
>> and resist the temptataion to rebase your trees on the way to your
>> upstream ...
>>
>> Changes since 20130506:
>>
> 
> on x86_64:
> 
> when CONFIG_AD5446=y and CONFIG_I2C=m:
> 
> drivers/built-in.o: In function `ad5622_write':
> ad5446.c:(.text+0xae0b5): undefined reference to `i2c_master_send'
> drivers/built-in.o: In function `ad5446_init':
> ad5446.c:(.init.text+0x4f28): undefined reference to `i2c_register_driver'
> drivers/built-in.o: In function `ad5446_i2c_unregister_driver':
> ad5446.c:(.exit.text+0xc73): undefined reference to `i2c_del_driver'
> 

My fault, will fix it. Thanks for reporting.

- Lars
