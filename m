From: Ingo Molnar <mingo@elte.hu>
Subject: Re: next-20081103: error: asm/ftrace.h: No such file or directory
Date: Mon, 3 Nov 2008 15:04:42 +0100
Message-ID: <20081103140442.GC14472@elte.hu>
References: <20081103183214.aac32543.sfr@canb.auug.org.au> <20081103135814.GB3432@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:45523 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755904AbYKCOFE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 Nov 2008 09:05:04 -0500
Content-Disposition: inline
In-Reply-To: <20081103135814.GB3432@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, srostedt@redhat.com


* Alexey Dobriyan <adobriyan@gmail.com> wrote:

> Alpha is busted:
> 
>   CC      init/main.o
> In file included from include/linux/interrupt.h:12,
>                  from include/linux/rtc.h:102,
>                  from include/linux/efi.h:19,
>                  from init/main.c:45:
> include/linux/hardirq.h:8:24: error: asm/ftrace.h: No such file or directory

should be solved in the latest ftrace tree.

	Ingo
