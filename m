From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 12 (chrome/wilco_ec/)
Date: Tue, 12 Feb 2019 16:04:57 -0800
Message-ID: <c9279497-c1cf-98d2-0fae-3349a75ebc55@infradead.org>
References: <20190212175059.1ea4c16c@canb.auug.org.au>
 <94edf49b-6b37-2dac-a2db-ad454b105fd1@infradead.org>
 <CAHX4x87=Myx45wBYtFY=rwz8jVmYY-tYVQjnzod-V8HaWJSy+g@mail.gmail.com>
 <CAHX4x87nRpTR5880y6hc=r7k0OFV9YKate21U=2kkqC-ihdmCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHX4x87nRpTR5880y6hc=r7k0OFV9YKate21U=2kkqC-ihdmCQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>
List-Id: linux-next.vger.kernel.org

On 2/12/19 3:49 PM, Nick Crews wrote:
> OK, here is the patch to fix this problem. We had the dependency backwards.
> 
> Should I re-send out the entire patch series to the LKML with this fix in it?
> 
> 
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 462eb9dfa4f2..b69561050868 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -95,7 +95,7 @@ config CROS_EC_LPC
>  
>  config CROS_EC_LPC_MEC
>         bool "ChromeOS Embedded Controller LPC Microchip EC (MEC) variant"
> -       depends on CROS_EC_LPC || WILCO_EC
> +       depends on CROS_EC_LPC
>         default n
>         help
>           If you say Y here, a variant LPC protocol for the Microchip EC
> diff --git a/drivers/platform/chrome/wilco_ec/Kconfig b/drivers/platform/chrome/wilco_ec/Kconfig
> index d8e2cddb4712..6ea2d3f64ce5 100644
> --- a/drivers/platform/chrome/wilco_ec/Kconfig
> +++ b/drivers/platform/chrome/wilco_ec/Kconfig
> @@ -1,6 +1,6 @@
>  config WILCO_EC
>         tristate "ChromeOS Wilco Embedded Controller"
> -       depends on ACPI && X86
> +       depends on ACPI && X86 && CROS_EC_LPC_MEC
>         select CROS_EC_LPC_MEC
>         help
>           If you say Y here, you get support for talking to the ChromeOS
> 
> 

Hi Nick,

Your emails contain html and are not being archived by lore.kernel.org
or by marc.info.  Please fix that (no html) and resend the patch.

I don't know the answer to your question.  I would expect that whoever
merged the current drivers/platform/chrome/wilco_ec/ source files
could/would just take the new Kconfig patch and merge it also.


-- 
~Randy
