From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-01-02-14-35 uploaded (musb)
Date: Fri, 03 Jan 2014 12:47:47 -0800
Message-ID: <52C721F3.2020101@infradead.org>
References: <20140102223649.D8FB931C206@corp2gmr1-1.hot.corp.google.com> <52C6FA1E.4030607@infradead.org> <20140103200226.GD18722@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140103200226.GD18722@saruman.home>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: akpm@linux-foundation.org, USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 01/03/14 12:02, Felipe Balbi wrote:
> On Fri, Jan 03, 2014 at 09:57:50AM -0800, Randy Dunlap wrote:
>> On 01/02/14 14:36, akpm@linux-foundation.org wrote:
>>> The mm-of-the-moment snapshot 2014-01-02-14-35 has been uploaded to
>>>
>>>    http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>
>> on x86_64:
>>
>> when CONFIG_USB is not enabled:
>>
>> drivers/built-in.o: In function `musb_init':
>> musb_core.c:(.init.text+0x45fc): undefined reference to `usb_disabled'
> 
> already have a patch for that. Waiting for Greg to merge ;-)

Thanks.

> commit 89f836a8c56bfea6585a09f7afff7094968a4fd0
> Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Date:   Thu Dec 26 09:24:52 2013 -0300
> 
>     usb: musb: Remove usb_disable() check in module_init()
>     
>     Removing the check to usb_disable() before registering the platform
>     driver allows to build this driver when !USB && USB_GADGET, to be
>     used in gadget-only mode.
>     
>     Also, use module_platform_driver() to register the platform driver.
>     
>     Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>     Signed-off-by: Felipe Balbi <balbi@ti.com>

-- 
~Randy
