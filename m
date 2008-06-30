From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Mon, 30 Jun 2008 11:03:56 +0200
Message-ID: <20080630090356.GB1701@elte.hu>
References: <20080630155912.ef5a1204.sfr@canb.auug.org.au> <20080630160958.ed96d469.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35963 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753035AbYF3JEU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 05:04:20 -0400
Content-Disposition: inline
In-Reply-To: <20080630160958.ed96d469.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Zhao Yakui <yakui.zhao@intel.com>, Li Shaohua <shaohua.li@intel.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Mon, 30 Jun 2008 15:59:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Len, Ingo,
> > 
> > Today's linux-next merge of the acpi tree got a conflict in 
> > Documentation/kernel-parameters.txt between commits "ACPI : Create 
> > "idle=nomwait" bootparam" and "ACPI: Create "idle=halt" bootparam" 
> > different version of which appear in the x86 and acpi trees ("ACPI : 
> > Create "idle=nomwait" bootparam" in the acpi tree is different from 
> > the version that was in that tree on Friday (thus this conflict 
> > comes up again)).
> > 
> > Please sort this out ...
> 
> This also caused conflicts in arch/ia64/kernel/process.c,
> arch/x86/kernel/process.c, drivers/acpi/processor_core.c,
> include/asm-ia64/processor.h and include/asm-x86/processor.h.
> 
> I fixed it up by using the acpi tree's versions.

hm, this was caused by the ACPI tree doing a non-append rebase instead 
of the trivial delta fix like the one below. I've added the one below to 
the x86 tree.

	Ingo

----------------->
commit 4fb0b0af57439fa62cf24a39b65f6b6ba148fba6
Author: Ingo Molnar <mingo@elte.hu>
Date:   Mon Jun 30 11:00:59 2008 +0200

    doc: Documentation/kernel-parameters.txt, fix whitespace
    
    based on:
    
    | commit ce4bd94fad0fa934c0de1ba1932e7e61bc142176
    | Author: Zhao Yakui <yakui.zhao@intel.com>
    | Date:   Fri Jun 20 03:44:11 2008 -0400
    |
    |     ACPI : Create "idle=nomwait" bootparam
    
    Signed-off-by: Ingo Molnar <mingo@elte.hu>

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index 39baaba..0f7268a 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -785,7 +785,7 @@ and is between 256 and 4096 characters. It is defined in the file
 			See Documentation/ide/ide.txt.
 
 	idle=		[X86]
-			Format: idle=poll or idle=mwait, idle = halt, idle=nomwait
+			Format: idle=poll or idle=mwait, idle=halt, idle=nomwait
 			Poll forces a polling idle loop that can slightly improves the performance
 			of waking up a idle CPU, but will use a lot of power and make the system
 			run hot. Not recommended.
@@ -793,9 +793,9 @@ and is between 256 and 4096 characters. It is defined in the file
 			to not use it because it doesn't save as much power as a normal idle
 			loop use the MONITOR/MWAIT idle loop anyways. Performance should be the same
 			as idle=poll.
-			idle = halt . Halt is forced to be used for CPU idle.
+			idle=halt . Halt is forced to be used for CPU idle.
 			In such case C2/C3 won't be used again.
-			idle = nomwait. disable Mwait for CPU C-state.
+			idle=nomwait. disable Mwait for CPU C-state.
 			In such case C2C3_FFH access mode will be disabled.
 
 	ide-pci-generic.all-generic-ide [HW] (E)IDE subsystem
