From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [next] new fail in linux-next s390 smp
Date: Fri, 26 Jun 2015 13:49:01 -0400
Message-ID: <20150626174901.GB4633@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:46038 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752086AbbFZRtI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2015 13:49:08 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Holzheu <holzheu@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, schwidefsky@de.ibm.com

Seen in allnoconfig:

http://kisskb.ellerman.id.au/kisskb/buildresult/12450623/

arch/s390/kernel/setup.c: In function 'setup_arch':
arch/s390/kernel/setup.c:875:2: error: implicit declaration of function
'smp_save_dump_cpus'
make[2]: *** [arch/s390/kernel/setup.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [arch/s390/kernel] Error 2
make: *** [arch/s390] Error 2
make: *** Waiting for unfinished jobs....
1592a8e456436024b6c662f423ce672e672169bb is the first bad commit
commit 1592a8e456436024b6c662f423ce672e672169bb
Author: Michael Holzheu <holzheu@linux.vnet.ibm.com>
Date:   Tue May 26 19:05:23 2015 +0200

    s390/kdump: fix nosmt kernel parameter
    
    It turned out that SIGP set-multi-threading can only be done once.
    Therefore switching to a different MT level after switching to
    sclp.mtid_prev in the dump case fails.
    
    As a symptom specifying the "nosmt" parameter currently fails for
    the kdump kernel and the kernel starts with multi-threading enabled.
    
    So fix this and issue diag 308 subcode 1 call after collecting the
    CPU states for the dump. Also enhance the diag308_reset() function
to
    be usable also with enabled lowcore protection and prefix register
!= 0.
    After the reset it is possible to switch the MT level again. We have
    to do the reset very early in order not to kill the already
initialized
    console. Therefore instead of kmalloc() the corresponding memblock
    functions have to be used. To avoid copying the sclp cpu code into
    sclp_early, we now use the simple sigp loop method for CPU
detection.
    
    Signed-off-by: Michael Holzheu <holzheu@linux.vnet.ibm.com>
    Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>

:040000 040000 5430eab17daadf67943ab0b5d1979e88c9417e7b
4610519e89468a4c09080f463c31e51fbc2fb4f4 M      arch
:040000 040000 46b9da2c2a089589353ad9a55358803989cd9eb7
100d2243c38ece214cffc72f296a8860cff1a0e5 M      drivers
bisect run success
