From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: linux-next: Tree for Jan 24 (extcon-max77693)
Date: Fri, 25 Jan 2013 10:27:04 +0900
Message-ID: <5101DF68.9020805@samsung.com>
References: <20130124171309.9742ea16b3cb15cc9e5ca3a4@canb.auug.org.au>
 <5101C386.4050802@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9262 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065Ab3AYB1I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jan 2013 20:27:08 -0500
In-reply-to: <5101C386.4050802@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/25/2013 08:28 AM, Randy Dunlap wrote:
> On 01/23/13 22:13, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20130123:
>>
> 
> 
> on i386, when CONFIG_INPUT is not enabled:
> 
> 
>  drivers/built-in.o: In function `max77693_muic_remove':
> extcon-max77693.c:(.text+0x664853): undefined reference to `input_unregister_device'
> drivers/built-in.o: In function `max77693_muic_probe':
> extcon-max77693.c:(.text+0x664971): undefined reference to `input_allocate_device'
> extcon-max77693.c:(.text+0x6649c1): undefined reference to `input_set_capability'
> extcon-max77693.c:(.text+0x6649d6): undefined reference to `input_set_capability'
> extcon-max77693.c:(.text+0x6649eb): undefined reference to `input_set_capability'
> extcon-max77693.c:(.text+0x664a00): undefined reference to `input_set_capability'
> extcon-max77693.c:(.text+0x664a15): undefined reference to `input_set_capability'
> extcon-max77693.c:(.text+0x664a20): undefined reference to `input_register_device'
> drivers/built-in.o: In function `max77693_muic_adc_handler':
> extcon-max77693.c:(.text+0x665318): undefined reference to `input_event'
> extcon-max77693.c:(.text+0x66532a): undefined reference to `input_event'
> make[1]: *** [vmlinux] Error 1
> 
> 
> 
> Needs
> 	depends on INPUT
> ??

You are right. I miss to add CONFIG_INPUT driver/extcon/Kconfig.
I will send fix patch of this build error right now.

Thank you,
Chanwoo Choi
