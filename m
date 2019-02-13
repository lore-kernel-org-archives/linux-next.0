From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 12 (chrome/wilco_ec/)
Date: Wed, 13 Feb 2019 13:29:06 -0800
Message-ID: <7ec90d13-844d-5fe7-3ae3-d65152ebf37e@infradead.org>
References: <20190212175059.1ea4c16c@canb.auug.org.au>
 <94edf49b-6b37-2dac-a2db-ad454b105fd1@infradead.org>
 <CAHX4x87=Myx45wBYtFY=rwz8jVmYY-tYVQjnzod-V8HaWJSy+g@mail.gmail.com>
 <CAHX4x87nRpTR5880y6hc=r7k0OFV9YKate21U=2kkqC-ihdmCQ@mail.gmail.com>
 <6913db72-85b3-0b7d-5e38-9cbb6ec4c8c2@infradead.org>
 <CAHX4x84H3Z+5zeUR_WCa4vwcARWtxxxKVQCnQObcThqntFPM6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHX4x84H3Z+5zeUR_WCa4vwcARWtxxxKVQCnQObcThqntFPM6Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>
List-Id: linux-next.vger.kernel.org

On 2/13/19 9:26 AM, Nick Crews wrote:
> Randy,
> 
> No, I didn't test it, I'm sorry, of course I should done that.
> Sorry for the formatting too, I'm new to this and wasn't sure what
> tool to use. The following version of the patch was made with
> "git format-patch" and now I'm replying in plaintext, it hopefully is better.
> 

Hi Nick,

A few small comments:

> From 0cfb3db970636983c1570827b7793e31e352716e Mon Sep 17 00:00:00 2001
> From: Nick Crews <ncrews@chromium.org>
> Date: Tue, 12 Feb 2019 16:46:15 -0700
> Subject: [PATCH] FROMLIST: wilco_ec: Fix Kconfig dependencies

delete FROMLIST:

The Subject should include a subsystem reference, e.g.:

[PATCH] chrome: fix wilco_ex Kconfig dependencies


> 
> In the initial version of the Wilco EC Driver, the
> dependency order was wrong. It before was possible to
> select CONFIG_WILCO_EC and CONFIG_CROS_EC_LPC without
> having CONFIG_CROS_EC_LPC_MEC. This was wrong, since
> WILCO_EC depends upon CONFIG CROS_EC_LPC_MEC, not the
> other way around.
> 

More importantly, the patch is still whitespace-damaged.
The Kconfig file lines that begin with "bool", "depends", "help", etc.
should contain a tab.  Maybe your email client mangled the whitespace.

You might need to take a look at Documentation/process/email-clients.rst
for some hints.

Or if you email the patch with "git send-email", it might be fine.

Aside from that, after I fixed the whitespace, the kernel build does work
without errors.

Thanks.

> ---
>  drivers/platform/chrome/Kconfig          | 2 +-
>  drivers/platform/chrome/wilco_ec/Kconfig | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 462eb9dfa4f2..b69561050868 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -95,7 +95,7 @@ config CROS_EC_LPC
> 
>  config CROS_EC_LPC_MEC
>   bool "ChromeOS Embedded Controller LPC Microchip EC (MEC) variant"
> - depends on CROS_EC_LPC || WILCO_EC
> + depends on CROS_EC_LPC
>   default n
>   help
>     If you say Y here, a variant LPC protocol for the Microchip EC
> diff --git a/drivers/platform/chrome/wilco_ec/Kconfig
> b/drivers/platform/chrome/wilco_ec/Kconfig
> index d8e2cddb4712..de097690fce3 100644
> --- a/drivers/platform/chrome/wilco_ec/Kconfig
> +++ b/drivers/platform/chrome/wilco_ec/Kconfig
> @@ -1,7 +1,6 @@
>  config WILCO_EC
>   tristate "ChromeOS Wilco Embedded Controller"
> - depends on ACPI && X86
> - select CROS_EC_LPC_MEC
> + depends on ACPI && X86 && CROS_EC_LPC_MEC
>   help
>     If you say Y here, you get support for talking to the ChromeOS
>     Wilco EC over an eSPI bus. This uses a simple byte-level protocol
> --
> 2.20.1
> 
> 
> On Tue, Feb 12, 2019 at 5:13 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 2/12/19 3:49 PM, Nick Crews wrote:
>>> OK, here is the patch to fix this problem. We had the dependency backwards.
>>>
>>> Should I re-send out the entire patch series to the LKML with this fix in it?
>>>
>>>
>>> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
>>> index 462eb9dfa4f2..b69561050868 100644
>>> --- a/drivers/platform/chrome/Kconfig
>>> +++ b/drivers/platform/chrome/Kconfig
>>> @@ -95,7 +95,7 @@ config CROS_EC_LPC
>>>
>>>  config CROS_EC_LPC_MEC
>>>         bool "ChromeOS Embedded Controller LPC Microchip EC (MEC) variant"
>>> -       depends on CROS_EC_LPC || WILCO_EC
>>> +       depends on CROS_EC_LPC
>>>         default n
>>>         help
>>>           If you say Y here, a variant LPC protocol for the Microchip EC
>>> diff --git a/drivers/platform/chrome/wilco_ec/Kconfig b/drivers/platform/chrome/wilco_ec/Kconfig
>>> index d8e2cddb4712..6ea2d3f64ce5 100644
>>> --- a/drivers/platform/chrome/wilco_ec/Kconfig
>>> +++ b/drivers/platform/chrome/wilco_ec/Kconfig
>>> @@ -1,6 +1,6 @@
>>>  config WILCO_EC
>>>         tristate "ChromeOS Wilco Embedded Controller"
>>> -       depends on ACPI && X86
>>> +       depends on ACPI && X86 && CROS_EC_LPC_MEC
>>>         select CROS_EC_LPC_MEC
>>>         help
>>>           If you say Y here, you get support for talking to the ChromeOS
>>>
>>>
>>
>> Nick,
>>
>> Did you test this?
>>
>> When I apply the patch (by hand, since it was whitespace-mangled/damaged),
>> I get this:
>>
>> rdunlap@midway:linux-next-20190212> make ARCH=x86_64 O=X64 oldconfig
>> make[1]: Entering directory '/home/rdunlap/lnx/next/linux-next-20190212/X64'
>>   GEN     Makefile
>> scripts/kconfig/conf  --oldconfig Kconfig
>> drivers/platform/chrome/Kconfig:84:error: recursive dependency detected!
>> drivers/platform/chrome/Kconfig:84:     symbol CROS_EC_LPC_MEC is selected by WILCO_EC
>> drivers/platform/chrome/wilco_ec/Kconfig:1:     symbol WILCO_EC depends on CROS_EC_LPC_MEC
>> For a resolution refer to Documentation/kbuild/kconfig-language.txt
>> subsection "Kconfig recursive dependency limitations"
>>
>>
>>
>>
>> --
>> ~Randy


-- 
~Randy
