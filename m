From: Guenter Roeck <linux@roeck-us.net>
Subject: Mips build errors in next-20151020
Date: Tue, 20 Oct 2015 11:48:32 -0700
Message-ID: <56268C80.5020903@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37887 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223AbbJTSsf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Oct 2015 14:48:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux MIPS Mailing List <linux-mips@linux-mips.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Alex Smith <alex.smith@imgtec.com>

Hi all,

all mips images fail to build for me in next-20151020 as follows.

Building mips:defconfig ... failed
--------------
Error log:
/tmp/cc9iCAqK.s: Assembler messages:
/tmp/cc9iCAqK.s:50: Error: can't resolve `_start' {*UND* section} - `L0' {.text section}
/tmp/cc9iCAqK.s:374: Error: can't resolve `_start' {*UND* section} - `L0' {.text section}
make[2]: *** [arch/mips/vdso/gettimeofday.o] Error 1
make[1]: *** [arch/mips/vdso] Error 2

Toolchain is "mips-poky-linux-gcc (GCC) 4.7.2".

Do I need a new toolchain ?

Thanks,
Guenter
