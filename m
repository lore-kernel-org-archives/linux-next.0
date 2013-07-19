From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 2 (platform/x86/samsung-laptop)
Date: Fri, 19 Jul 2013 10:19:14 -0700
Message-ID: <51E97512.4040500@infradead.org>
References: <20130502173537.c8aa671a1b22abe2ec341b87@canb.auug.org.au> <5182DA15.6030901@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34899 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208Ab3GSRUJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Jul 2013 13:20:09 -0400
In-Reply-To: <5182DA15.6030901@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 05/02/13 14:26, Randy Dunlap wrote:
> On 05/02/13 00:35, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v3.11 destined work to your linux-next included
>> branches until after v3.10-rc1 is released.
>>
>> Changes since 20130501:
>>
> 
> 
> when CONFIG_ACPI_VIDEO=m and CONFIG_SAMSUNG_LAPTOP=y:
> 
> drivers/built-in.o: In function `samsung_init':
> samsung-laptop.c:(.init.text+0x94ba): undefined reference to `acpi_video_unregister'
> 
> 
> 

This build error still happens in linux-next of 20130719...

-- 
~Randy
