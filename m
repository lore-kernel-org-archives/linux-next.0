From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Date: Wed, 6 Dec 2017 13:28:45 +0900
Message-ID: <20171206042845.GA15885@jagdpanzerIV>
References: <20171206142300.64d5a70f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:38545 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754625AbdLFE2u (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Dec 2017 23:28:50 -0500
Content-Disposition: inline
In-Reply-To: <20171206142300.64d5a70f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Petr Mladek <pmladek@suse.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

Hello,

On (12/06/17 14:23), Stephen Rothwell wrote:
> Hi Petr,
> 
> After merging the printk tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> lib/vsprintf.o: In function `pointer':
> vsprintf.c:(.text+0x2260): undefined reference to `dereference_symbol_descriptor'
> 
> Caused by commit
> 
>   b77929215209 ("symbol lookup: introduce dereference_symbol_descriptor()")
> 
> I have reverted that commit for today.


thanks. will fix it.

	-ss
