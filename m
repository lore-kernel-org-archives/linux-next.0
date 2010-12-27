From: Jeff Garzik <jeff@garzik.org>
Subject: Re: linux-next: build warning after merge of the Linus' tree
Date: Sun, 26 Dec 2010 19:49:13 -0500
Message-ID: <4D17E289.2040505@garzik.org>
References: <20101227095812.0f727881.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:33550 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753100Ab0L0AtR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 26 Dec 2010 19:49:17 -0500
In-Reply-To: <20101227095812.0f727881.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wu Zhangjin <wuzhangjin@gmail.com>, Zhang Le <r0bertz@gentoo.org>, Chen Jie <chenj@lemote.com>

On 12/26/2010 05:58 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
>
> drivers/ata/pata_cs5536.c:47:1: warning: "rdmsr" redefined
> In file included from arch/x86/include/asm/irqflags.h:60,
>                   from include/linux/irqflags.h:15,
>                   from arch/x86/include/asm/system.h:11,
>                   from arch/x86/include/asm/processor.h:17,
>                   from include/linux/prefetch.h:14,
>                   from include/linux/list.h:7,
>                   from include/linux/module.h:9,
>                   from drivers/ata/pata_cs5536.c:33:
> arch/x86/include/asm/paravirt.h:146:1: warning: this is the location of the previous definition
> drivers/ata/pata_cs5536.c:48:1: warning: "wrmsr" redefined
> arch/x86/include/asm/paravirt.h:154:1: warning: this is the location of the previous definition
>
> Caused by commit 9272dcc232b84ccb027d6861077934055d42764d ("pata_cs5536:
> Add support for non-X86_32 platforms").

Just sent a fix upstream.

The fix is a bit ugly ("#undef rdmsr" etc.), but that driver does not 
need anything more extensive.
