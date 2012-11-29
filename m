From: Belisko Marek <marek.belisko@gmail.com>
Subject: omap2plus_defconfig fails to build
Date: Thu, 29 Nov 2012 11:40:18 +0100
Message-ID: <CAAfyv37BA4YMRFJsN5n7EeAD7iE3hzQ2PDqBAtqCju7JdxrvTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:44556 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077Ab2K2KkS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Nov 2012 05:40:18 -0500
Received: by mail-ia0-f174.google.com with SMTP id y25so10730517iay.19
        for <linux-next@vger.kernel.org>; Thu, 29 Nov 2012 02:40:18 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi,

I've update linux-next to next-20121129 and omap2plus_defconfig fails to build:
arch/arm/mach-omap2/timer.c: In function 'omap_get_timer_dt':
arch/arm/mach-omap2/timer.c:195: error: implicit declaration of
function 'prom_add_property'

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
