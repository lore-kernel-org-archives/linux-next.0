From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: linux-next: build failure after merge of the wireless-next tree
Date: Mon, 01 Apr 2013 22:07:24 -0500
Message-ID: <515A4B6C.2080805@lwfinger.net>
References: <20130402133400.017b4ec5cd37725b32aa8079@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:65342 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758545Ab3DBDH2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Apr 2013 23:07:28 -0400
In-Reply-To: <20130402133400.017b4ec5cd37725b32aa8079@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/01/2013 09:34 PM, Stephen Rothwell wrote:
> Hi John,
>
> After merging the wireless-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:30:18: fatal error: wifi.h: No such file or directory
>
> Caused by commit f0eb856e0b6c ("rtlwifi: rtl8188ee: Add new driver").
> Forgot a file?
>
> I have used the wireless-next tree from next-20130328 for today.

Stephen,

I do not understand. File wifi.h is definitely there and is in 
drivers/net/wireless/rtlwifi/. Use of that directory as a source of include 
files is handled by "ccflags-y += -I drivers/net/wireless/rtlwifi 
-D__CHECK_ENDIAN__" in the Makefile for rtl8188ee. In fact, it builds just fine 
here.

What am I missing?

Larry
