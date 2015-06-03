From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: bisect of ARM - implicit declaration of function
 'arch_irqs_disabled'
Date: Tue, 2 Jun 2015 21:51:26 -0400
Message-ID: <20150603015125.GJ29898@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:48457 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919AbbFCBvc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2015 21:51:32 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org

Hi Arnd,

While testing linux-next and some stuff I have pending, I came across a
build fail that I then found was also in Jun2 linux-next:

http://kisskb.ellerman.id.au/kisskb/buildresult/12435853/

A quick bisect leads to:

make[1]: Leaving directory '/home/paul/builds/arm-efm32_defconfig'
cb1293e2f594558ccc3995acf9c9d7400b3add36 is the first bad commit
commit cb1293e2f594558ccc3995acf9c9d7400b3add36
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue May 26 15:40:44 2015 +0100

    ARM: 8375/1: disable some options on ARMv7-M


A google search led me to this:

  http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/320678.html

...but I did not see that in linux-next.

Anyway just a heads up on what I found.  I have not investigated
further than that.

Paul.
--
