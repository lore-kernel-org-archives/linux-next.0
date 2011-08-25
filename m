From: Timur Tabi <timur@freescale.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Thu, 25 Aug 2011 10:22:05 -0500
Message-ID: <4E56689D.3080202@freescale.com>
References: <20110825161843.daf46b6b4023926fcfeec387@canb.auug.org.au> <20110825140820.GA9126@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110825140820.GA9126@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

Greg KH wrote:
>> > MSR_GS is defined in arch/powerpc/include/asm/reg_booke.h which is
>> > included by arch/powerpc/include/asm/reg.h but only when defined
>> > (CONFIG_BOOKE) || defined(CONFIG_40x).
> Thanks for the report.
> 
> Timur, care to send a fixup patch for this so this gets resolved?

Is there some trick to building allyesconfig on PowerPC?  When I do try that, I
get all sorts of weird build errors, and it dies long before it gets to my
driver.  I get stuff like:

  LD      arch/powerpc/sysdev/xics/built-in.o
WARNING: arch/powerpc/sysdev/xics/built-in.o(.text+0x1310): Section mismatch in
reference from the function .icp_native_init() to the function
.init.text:.icp_native_init_one_node()
The function .icp_native_init() references
the function __init .icp_native_init_one_node().
This is often because .icp_native_init lacks a __init
annotation or the annotation of .icp_native_init_one_node is wrong.

and

  AS      arch/powerpc/kernel/head_64.o
arch/powerpc/kernel/exceptions-64s.S: Assembler messages:
arch/powerpc/kernel/exceptions-64s.S:1151: Error: attempt to move .org backwards
arch/powerpc/kernel/exceptions-64s.S:1160: Error: attempt to move .org backwards
make[1]: *** [arch/powerpc/kernel/head_64.o] Error 1

I guess I don't have the right compiler.

Anyway, I think I know how to fix the break that Stephen is seeing.  I will post
a v4 patch in a few minutes.


-- 
Timur Tabi
Linux kernel developer at Freescale
