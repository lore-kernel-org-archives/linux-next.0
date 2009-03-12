From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next 12 : arch/powerpc/sysdev/axonram build failure
Date: Thu, 12 Mar 2009 13:59:46 +0530
Message-ID: <49B8C7FA.8090805@in.ibm.com>
References: <20090312171154.11c6ec31.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp08.au.ibm.com ([202.81.31.141]:53192 "EHLO
	e23smtp08.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbZCLI3x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2009 04:29:53 -0400
Received: from d23relay02.au.ibm.com (d23relay02.au.ibm.com [202.81.31.244])
	by e23smtp08.au.ibm.com (8.13.1/8.13.1) with ESMTP id n2C8TnsC015137
	for <linux-next@vger.kernel.org>; Thu, 12 Mar 2009 19:29:49 +1100
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay02.au.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n2C8U7LF975032
	for <linux-next@vger.kernel.org>; Thu, 12 Mar 2009 19:30:07 +1100
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n2C8TnCC019354
	for <linux-next@vger.kernel.org>; Thu, 12 Mar 2009 19:29:49 +1100
In-Reply-To: <20090312171154.11c6ec31.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

Hi Stephen,

Today's next randconfig build on powerpc fails with

  CC [M]  arch/powerpc/sysdev/axonram.o
arch/powerpc/sysdev/axonram.c:108: warning: =91struct request_queue=92 =
declared inside parameter list
arch/powerpc/sysdev/axonram.c:108: warning: its scope is only this defi=
nition or declaration, which is probably not what you want
arch/powerpc/sysdev/axonram.c: In function =91axon_ram_make_request=92:
arch/powerpc/sysdev/axonram.c:110: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:118: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:121: error: implicit declaration of funct=
ion =91bio_for_each_segment=92
arch/powerpc/sysdev/axonram.c:121: error: expected =91;=92 before =91{=92=
 token
arch/powerpc/sysdev/axonram.c:112: warning: unused variable =91user_mem=
=92
arch/powerpc/sysdev/axonram.c: In function =91axon_ram_direct_access=92=
:
arch/powerpc/sysdev/axonram.c:150: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:155: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c: At top level:
arch/powerpc/sysdev/axonram.c:168: error: variable =91axon_ram_devops=92=
 has initializer but incomplete type
arch/powerpc/sysdev/axonram.c:169: error: unknown field =91owner=92 spe=
cified in initializer
arch/powerpc/sysdev/axonram.c:169: warning: excess elements in struct i=
nitializer
arch/powerpc/sysdev/axonram.c:169: warning: (near initialization for =91=
axon_ram_devops=92)
arch/powerpc/sysdev/axonram.c:170: error: unknown field =91direct_acces=
s=92 specified in initializer
arch/powerpc/sysdev/axonram.c:171: warning: excess elements in struct i=
nitializer
arch/powerpc/sysdev/axonram.c:171: warning: (near initialization for =91=
axon_ram_devops=92)
arch/powerpc/sysdev/axonram.c: In function =91axon_ram_probe=92:
arch/powerpc/sysdev/axonram.c:228: error: implicit declaration of funct=
ion =91alloc_disk=92
arch/powerpc/sysdev/axonram.c:228: warning: assignment makes pointer fr=
om integer without a cast
arch/powerpc/sysdev/axonram.c:235: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:236: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:237: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:238: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:239: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:241: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:244: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:244: error: implicit declaration of funct=
ion =91blk_alloc_queue=92
arch/powerpc/sysdev/axonram.c:245: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:251: error: implicit declaration of funct=
ion =91set_capacity=92
arch/powerpc/sysdev/axonram.c:252: error: implicit declaration of funct=
ion =91blk_queue_make_request=92
arch/powerpc/sysdev/axonram.c:252: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:253: error: implicit declaration of funct=
ion =91blk_queue_hardsect_size=92
arch/powerpc/sysdev/axonram.c:253: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:254: error: implicit declaration of funct=
ion =91add_disk=92
arch/powerpc/sysdev/axonram.c:264: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:279: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:288: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:289: error: implicit declaration of funct=
ion =91unregister_blkdev=92
arch/powerpc/sysdev/axonram.c:289: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:290: error: dereferencing pointer to inco=
mplete type
arch/powerpc/sysdev/axonram.c:291: error: implicit declaration of funct=
ion =91del_gendisk=92
arch/powerpc/sysdev/axonram.c: In function =91axon_ram_init=92:
arch/powerpc/sysdev/axonram.c:345: error: implicit declaration of funct=
ion =91register_blkdev=92
make[1]: *** [arch/powerpc/sysdev/axonram.o] Error 1
make: *** [arch/powerpc/sysdev] Error 2

CONFIG_BLOCK is not set.

Thanks
-Sachin


--=20

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
