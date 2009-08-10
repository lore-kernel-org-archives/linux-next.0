From: Luciano Coelho <luciano.coelho@nokia.com>
Subject: Re: linux-next: wireless tree build warnings
Date: Mon, 10 Aug 2009 20:29:03 +0300
Message-ID: <4A8058DF.4020203@nokia.com>
References: <20090810194110.fa3eef11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:53905 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932278AbZHJR32 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2009 13:29:28 -0400
In-Reply-To: <20090810194110.fa3eef11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Stephen,

ext Stephen Rothwell wrote:
> Hi John,
>
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
>
> drivers/net/wireless/wl12xx/wl1271_main.c: In function 'wl1271_irq_work':
> drivers/net/wireless/wl12xx/wl1271_main.c:184: warning: large integer implicitly truncated to unsigned type
> drivers/net/wireless/wl12xx/wl1271_boot.c: In function 'wl1271_boot_upload_firmware_chunk':
> drivers/net/wireless/wl12xx/wl1271_boot.c:103: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
> drivers/net/wireless/wl12xx/wl1271_boot.c:150: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
> drivers/net/wireless/wl12xx/wl1271_boot.c: In function 'wl1271_boot_enable_interrupts':
> drivers/net/wireless/wl12xx/wl1271_boot.c:278: warning: large integer implicitly truncated to unsigned type
>
> Introduced by commit 4749c814b34dfe02cf08da34a2a2a32f55fbd9bc ("wl1271:
> add wl1271 driver files").
>   

I'm very sorry for this.  I haven't built the kernel on 64 bit machines 
and didn't notice these warnings.  I'll fix them as soon as possible and 
send a patch.  Thanks for reporting.

-- 
Cheers,
Luca.
