From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] olpc: fix olpc-xo1-sci.c build when INPUT=m
Date: Fri, 13 Jan 2012 14:34:17 -0800
Message-ID: <4F10B169.4070807@xenotime.net>
References: <20120110164454.b595335a42321c80fba56ea7@canb.auug.org.au> <4F0CADDB.5010303@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:34157 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1759249Ab2AMVgO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Jan 2012 16:36:14 -0500
In-Reply-To: <4F0CADDB.5010303@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86 maintainers <x86@kernel.org>, Andres Salomon <dilinger@queued.net>, Chris Ball <cjb@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>Andrew Morton <akpm@linux-foundation.org>

On 01/10/2012 01:30 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Fix build errors when CONFIG_INPUT=m.
> This is not pretty, but all of the OLPC kconfig options
> are bool instead of tristate.


ping.

This patch is still needed in linux-next (20120113).


> arch/x86/built-in.o: In function `send_lid_state':
> olpc-xo1-sci.c:(.text+0x1d323): undefined reference to `input_event'
> olpc-xo1-sci.c:(.text+0x1d338): undefined reference to `input_event'
> arch/x86/built-in.o: In function `free_ebook_switch':
> olpc-xo1-sci.c:(.text+0x1d529): undefined reference to `input_unregister_device'
> olpc-xo1-sci.c:(.text+0x1d533): undefined reference to `input_free_device'
> arch/x86/built-in.o: In function `free_power_button':
> olpc-xo1-sci.c:(.text+0x1d549): undefined reference to `input_unregister_device'
> olpc-xo1-sci.c:(.text+0x1d553): undefined reference to `input_free_device'
> arch/x86/built-in.o: In function `send_ebook_state':
> olpc-xo1-sci.c:(.text+0x1d632): undefined reference to `input_event'
> olpc-xo1-sci.c:(.text+0x1d647): undefined reference to `input_event'
> arch/x86/built-in.o: In function `xo1_sci_intr':
> olpc-xo1-sci.c:(.text+0x1d78e): undefined reference to `input_event'
> olpc-xo1-sci.c:(.text+0x1d7a3): undefined reference to `input_event'
> olpc-xo1-sci.c:(.text+0x1d7be): undefined reference to `input_event'
> arch/x86/built-in.o:olpc-xo1-sci.c:(.text+0x1d7d3): more undefined references to `input_event' follow
> arch/x86/built-in.o: In function `free_lid_switch':
> olpc-xo1-sci.c:(.text+0x1d7fd): undefined reference to `input_unregister_device'
> olpc-xo1-sci.c:(.text+0x1d807): undefined reference to `input_free_device'
> arch/x86/built-in.o: In function `setup_lid_switch':
> olpc-xo1-sci.c:(.devinit.text+0x155): undefined reference to `input_allocate_device'
> olpc-xo1-sci.c:(.devinit.text+0x1a4): undefined reference to `input_register_device'
> olpc-xo1-sci.c:(.devinit.text+0x1ce): undefined reference to `input_unregister_device'
> olpc-xo1-sci.c:(.devinit.text+0x1d8): undefined reference to `input_free_device'
> arch/x86/built-in.o: In function `xo1_sci_probe':
> olpc-xo1-sci.c:(.devinit.text+0x235): undefined reference to `input_allocate_device'
> olpc-xo1-sci.c:(.devinit.text+0x285): undefined reference to `input_register_device'
> olpc-xo1-sci.c:(.devinit.text+0x299): undefined reference to `input_free_device'
> olpc-xo1-sci.c:(.devinit.text+0x2e1): undefined reference to `input_register_device'
> olpc-xo1-sci.c:(.devinit.text+0x2f5): undefined reference to `input_free_device'
> olpc-xo1-sci.c:(.devinit.text+0x54c): undefined reference to `input_allocate_device'
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc:	Andres Salomon <dilinger@queued.net>
> Cc:	Chris Ball <cjb@laptop.org>
> Cc:	Jon Nettleton <jon.nettleton@gmail.com>
> ---
>  arch/x86/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20120110.orig/arch/x86/Kconfig
> +++ linux-next-20120110/arch/x86/Kconfig
> @@ -2132,6 +2132,7 @@ config OLPC_XO1_RTC
>  config OLPC_XO1_SCI
>  	bool "OLPC XO-1 SCI extras"
>  	depends on OLPC && OLPC_XO1_PM
> +	depends on INPUT=y
>  	select POWER_SUPPLY
>  	select GPIO_CS5535
>  	select MFD_CORE
> 


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
