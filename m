From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] firmware: fix GOOGLE_SMI kconfig dependency warning
Date: Mon, 23 May 2011 08:15:48 -0700
Message-ID: <4DDA7A24.6050909@oracle.com>
References: <20110520165507.cba539d5.sfr@canb.auug.org.au>	<20110522173802.c0766c64.randy.dunlap@oracle.com> <BANLkTi=T4JsDZ7EX18AHcwG8nd50FzHGtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:42498 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755415Ab1EWPQW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2011 11:16:22 -0400
In-Reply-To: <BANLkTi=T4JsDZ7EX18AHcwG8nd50FzHGtg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Waychison <mikew@google.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>

On 05/22/11 22:39, Mike Waychison wrote:
> 
> On May 22, 2011 5:38 PM, "Randy Dunlap" <randy.dunlap@oracle.com
> <mailto:randy.dunlap@oracle.com>> wrote:
>>
>> From: Randy Dunlap <randy.dunlap@oracle.com
> <mailto:randy.dunlap@oracle.com>>
>>
>> Is it meaningful/useful to enable EFI_VARS but not EFI?
>> That's what GOOGLE_SMI does.  Make it enable EFI also.
>>
>> Fixes this kconfig dependency warning:
>>
>> warning: (GOOGLE_SMI) selects EFI_VARS which has unmet direct
> dependencies (EFI)
>>
>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com
> <mailto:randy.dunlap@oracle.com>>
>> Cc: Mike Waychison <mikew@google.com <mailto:mikew@google.com>>
> 
> Acked.
> 
> Is this a new warning?  I haven't seen it before which is weird because
> we don't use efi boot.

It's not new for 20110520, but I don't know when it began.

>> ---
>>  drivers/firmware/google/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- linux-next-20110520.orig/drivers/firmware/google/Kconfig
>> +++ linux-next-20110520/drivers/firmware/google/Kconfig
>> @@ -13,6 +13,7 @@ menu "Google Firmware Drivers"
>>  config GOOGLE_SMI
>>        tristate "SMI interface for Google platforms"
>>        depends on ACPI && DMI
>> +       select EFI
>>        select EFI_VARS
>>        help
>>          Say Y here if you want to enable SMI callbacks for Google
> 


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
