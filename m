From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: Tree for Apr 2 (uml)
Date: Mon, 02 Apr 2012 17:59:29 +0200
Message-ID: <4F79CCE1.4040709@nod.at>
References: <20120402135538.502e6c73f0cb3e6ae0b3436f@canb.auug.org.au> <4F79C68C.1070100@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:47834 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752832Ab2DBP7f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Apr 2012 11:59:35 -0400
In-Reply-To: <4F79C68C.1070100@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 02.04.2012 17:32, Randy Dunlap wrote:
> On 04/01/2012 08:55 PM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> The merge window has closed, so -next is open for busniess.
>>
>> Changes since 20120330:
>
>
>
> uml defconfig on x86_64:
>
>    CC      arch/um/drivers/mconsole_kern.o
> arch/um/drivers/mconsole_kern.c: In function 'stack_proc':
> arch/um/drivers/mconsole_kern.c:707:2: error: implicit declaration of function 'switch_to'
> make[2]: *** [arch/um/drivers/mconsole_kern.o] Error 1
>
>

Already fixed:
http://comments.gmane.org/gmane.linux.kernel/1274493

Thanks,
//richard
