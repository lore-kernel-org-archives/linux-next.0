From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] mtd: fix sbc2_flash build when PCI is not enabled
Date: Mon, 16 Apr 2012 18:25:23 -0700
Message-ID: <4F8CC683.7060908@xenotime.net>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au> <4F8C780D.9010702@xenotime.net> <CAP=VYLr6TtABMNz1EBY2T6vYdhpR5X6S3yQTtvvqV0D7c9U5Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:58753 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755077Ab2DPWZT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 18:25:19 -0400
In-Reply-To: <CAP=VYLr6TtABMNz1EBY2T6vYdhpR5X6S3yQTtvvqV0D7c9U5Lw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Tim Hockin <thockin@sun.com>

On 04/16/2012 03:20 PM, Paul Gortmaker wrote:

> On Mon, Apr 16, 2012 at 3:50 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
>> From: Randy Dunlap <rdunlap@xenotime.net>
>>
>> sbc2_flash.c is a PCI driver, but its build fails when CONFIG_PCI
> 
> Minor nit -- above line and subject reference sbc2, when fail comes
> from scb2 source module.

Ack.  I noticed later that I had botched that.

Thanks.

> Paul.
> --
> 
>> is not enabled, so make it depend on PCI.
>>
>> drivers/mtd/maps/scb2_flash.c:237:1: warning: data definition has no type or storage class
>> drivers/mtd/maps/scb2_flash.c:237:1: warning: type defaults to 'int' in declaration of 'module_pci_driver'
>> drivers/mtd/maps/scb2_flash.c:237:1: warning: parameter names (without types) in function declaration
>>
>> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
>> Cc:     David Woodhouse <dwmw2@infradead.org>
>> Cc:     linux-mtd@lists.infradead.org
>> ---
>>  drivers/mtd/maps/Kconfig |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-next-20120416.orig/drivers/mtd/maps/Kconfig
>> +++ linux-next-20120416/drivers/mtd/maps/Kconfig
>> @@ -224,7 +224,7 @@ config MTD_CK804XROM
>>
>>  config MTD_SCB2_FLASH
>>        tristate "BIOS flash chip on Intel SCB2 boards"
>> -       depends on X86 && MTD_JEDECPROBE
>> +       depends on X86 && MTD_JEDECPROBE && PCI
>>        help
>>          Support for treating the BIOS flash chip on Intel SCB2 boards
>>          as an MTD device - with this you can reprogram your BIOS.
>> --


-- 
~Randy
