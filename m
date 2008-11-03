From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-20081103: voyager
Date: Mon, 3 Nov 2008 17:54:05 +0300
Message-ID: <20081103145405.GA13851@x200.localdomain>
References: <20081103183214.aac32543.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:4482 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755279AbYKCOut (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 09:50:49 -0500
Content-Disposition: inline
In-Reply-To: <20081103183214.aac32543.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com, mingo@elte.hu

On i386-voyager:

  CC      arch/x86/mach-voyager/setup.o
arch/x86/mach-voyager/setup.c: In function 'intr_init_hook':
arch/x86/mach-voyager/setup.c:30: error: implicit declaration of function 'smp_intr_init'
arch/x86/mach-voyager/setup.c: In function 'machine_specific_memory_setup':
arch/x86/mach-voyager/setup.c:65: warning: unused variable 'new_nr'
make[2]: *** [arch/x86/mach-voyager/setup.o] Error 1
  CC      arch/x86/mach-voyager/voyager_smp.o
arch/x86/mach-voyager/voyager_smp.c:67: error: conflicting types for 'phys_cpu_present_map'
arch/x86/include/asm/mpspec.h:143: error: previous declaration of 'phys_cpu_present_map' was here
arch/x86/mach-voyager/voyager_smp.c: In function 'start_secondary':
arch/x86/mach-voyager/voyager_smp.c:452: error: implicit declaration of function 'notify_cpu_starting'
arch/x86/mach-voyager/voyager_smp.c: In function 'smp_call_function_interrupt':
arch/x86/mach-voyager/voyager_smp.c:965: error: implicit declaration of function 'generic_smp_call_function_interrupt'
arch/x86/mach-voyager/voyager_smp.c: In function 'smp_call_function_single_interrupt':
arch/x86/mach-voyager/voyager_smp.c:973: error: implicit declaration of function 'generic_smp_call_function_single_interrupt'
