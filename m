From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [blackfin] gpio_request build fail on linux-next bisected
Date: Tue, 22 Apr 2014 12:21:06 -0400
Message-ID: <535696F2.6010009@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:64233 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaDVQUt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Apr 2014 12:20:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Miao <realmz6@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Steven,

This linux-next build fail:

http://kisskb.ellerman.id.au/kisskb/buildresult/10940572/

which fails like this:

  CC      arch/blackfin/mach-bf533/boards/stamp.o
arch/blackfin/mach-bf533/boards/stamp.c: In function 'stamp_init':
arch/blackfin/mach-bf533/boards/stamp.c:874:2: error: implicit declaration of function 'gpio_request'
arch/blackfin/mach-bf533/boards/stamp.c:876:3: error: implicit declaration of function 'gpio_direction_output'
arch/blackfin/mach-bf533/boards/stamp.c:877:3: error: implicit declaration of function 'gpio_free'
make[1]: *** [arch/blackfin/mach-bf533/boards/stamp.o] Error 1

...bisects as follows:

a0c1fb2ea74dedecd303fb0388e21ca869239db2 is the first bad commit
commit a0c1fb2ea74dedecd303fb0388e21ca869239db2
Author: Steven Miao <realmz6@gmail.com>
Date:   Mon Mar 17 13:36:51 2014 +0800

    blackfin: portmux: cleanup head file
    
    drop unused head file
    change pinmux request/free macro for backward compatiblity
    add function declaration
    
    Signed-off-by: Steven Miao <realmz6@gmail.com>

:040000 040000 6bf439b9ec79ab17c87afe720ef23e2a01ee1c1f 6a67fdde171be53f3bfd0fd290f270fbca104542 M	arch
bisect run success

Since the failure is now in mainline/master, the fix should
be aimed at rc3 and not be specific to linux-next.

Thanks,
Paul.
