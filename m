From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Date: Thu, 7 Dec 2017 10:26:31 +0900
Message-ID: <20171207012631.GC1119@jagdpanzerIV>
References: <20171207113707.0ce273dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f46.google.com ([74.125.83.46]:42856 "EHLO
        mail-pg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751941AbdLGB0g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Dec 2017 20:26:36 -0500
Content-Disposition: inline
In-Reply-To: <20171207113707.0ce273dd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Petr Mladek <pmladek@suse.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>

On (12/07/17 11:37), Stephen Rothwell wrote:
[..]
> include/linux/kallsyms.h: In function 'dereference_symbol_descriptor':
> include/linux/kallsyms.h:63:8: error: implicit declaration of function '__module_address' [-Werror=implicit-function-declaration]
>   mod = __module_address((unsigned long)ptr);
>         ^
> include/linux/kallsyms.h:67:9: error: implicit declaration of function 'dereference_module_function_descriptor' [-Werror=implicit-function-declaration]
>    ptr = dereference_module_function_descriptor(mod, ptr);
>          ^
> 
> and many more ...
> 
> Caused by commit
> 
>   78675fe41d57 ("symbol lookup: introduce dereference_symbol_descriptor()")
> 
> I have used the printk tree from next-20171206 (with its version of the
> above patch reverted due to yesterday's error) for today.

will fix   :(

	-ss
