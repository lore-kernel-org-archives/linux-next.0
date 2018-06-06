From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 29 (usb/gadget/udc/aspeed-vhub)
Date: Wed, 6 Jun 2018 08:30:55 -0700
Message-ID: <be9159d4-f53e-1f1a-e87b-dfd55c458c9a@infradead.org>
References: <20180529204410.63477f88@canb.auug.org.au>
 <00c69bdc-0b70-cb82-ee1e-2718acc19582@infradead.org>
 <3731dd7511b6a0ee74b062caf616e8041382fb90.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3731dd7511b6a0ee74b062caf616e8041382fb90.camel@kernel.crashing.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On 05/29/2018 03:16 PM, Benjamin Herrenschmidt wrote:
> On Tue, 2018-05-29 at 10:04 -0700, Randy Dunlap wrote:
>> On 05/29/2018 03:44 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20180525:
>>>
>>
>> on i386:
>>
>> when builtin:
>> drivers/usb/gadget/udc/aspeed-vhub/hub.o: In function `ast_vhub_std_hub_request':
>> hub.c:(.text+0x3aa): undefined reference to `usb_gadget_get_string'
>>
>> or when modular:
>> ERROR: "usb_gadget_get_string" [drivers/usb/gadget/udc/aspeed-vhub/aspeed-vhub.ko] undefined!
>>
>>
>> Full randconfig for modular build is attached.
> 
> Somebody already sent a fix for this. Thanks. (Missing a dependency on
> LIBCOMPOSITE).

Hi,

linux-next is still having this build error.
Can we get that fix merged somewhere, please?

thanks,
-- 
~Randy
