From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Mon, 16 Jul 2012 13:57:08 +0900
Message-ID: <50039F24.60102@samsung.com>
References: <20120716140917.f780e8c3c7c74f1db1fed0ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59684 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932Ab2GPE5h (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jul 2012 00:57:37 -0400
In-reply-to: <20120716140917.f780e8c3c7c74f1db1fed0ae@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Myungjoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Stephen,

On 07/16/2012 01:09 PM, Stephen Rothwell wrote:

> Hi Anton,
> 
> After merging the battery tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/built-in.o: In function `charger_manager_probe':
> charger-manager.c:(.text+0x11d61a): undefined reference to `extcon_register_interest'
> charger-manager.c:(.text+0x11d7b6): undefined reference to `extcon_unregister_interest'
> drivers/built-in.o: In function `charger_manager_remove':
> charger-manager.c:(.devexit.text+0x8f3): undefined reference to `extcon_unregister_interest'
> 
> Caused by commit bee737bccb03 ("charger-manager: Use EXTCON Subsystem to
> detect charger cables for charging").
> 
> I have used the battery tree from next-20120713 for today.


I'm so sorry, It is my mistake.
So, I resend below patch to fix build break of charger-manager.
- http://lkml.org/lkml/2012/7/16/5

Best Regards,
Chanwoo Choi
