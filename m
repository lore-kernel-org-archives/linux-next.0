From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: build failure in drivers/mfd/aat2870-core.c
Date: Wed, 28 Sep 2011 18:10:27 -0400
Message-ID: <4E839B53.3010201@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:35519 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485Ab1I1WKg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 18:10:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>, jinyoungp@nvidia.com
Cc: linux-next@vger.kernel.org

Hi folks,

I was testing an x86_64 allyesconfig in today's next tree,
and came across this compile error:

In file included from /home/paul/4.x/module.h/linux-2.6.git/arch/x86/in=
clude/asm/uaccess.h:575,
                 from /home/paul/4.x/module.h/linux-2.6.git/include/lin=
ux/uaccess.h:5,
                 from /home/paul/4.x/module.h/linux-2.6.git/drivers/mfd=
/aat2870-core.c:27:
In function =91copy_from_user=92,
    inlined from =91aat2870_reg_write_file=92 at /home/paul/4.x/module.=
h/linux-2.6.git/drivers/mfd/aat2870-core.c:304:
/home/paul/4.x/module.h/linux-2.6.git/arch/x86/include/asm/uaccess_64.h=
:64: error: call to =91copy_from_user_overflow=92 declared with attribu=
te error: copy_from_user() buffer size is not provably correct
make[3]: *** [drivers/mfd/aat2870-core.o] Error 1

I wasn't sure if any of you were aware of this yet. as I didn't
see it mentioned in the recent linux-next traffic

Paul.
