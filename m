From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Tue, 25 Nov 2008 17:49:48 +1100
Message-ID: <20081125174948.1459c451.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33706 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751519AbYKYGuD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 01:50:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Eduardo Habkost <ehabkost@redhat.com>

[Resent to get past vgers filters]

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
arch/x86/kernel/reboot.c between commit
14d7ca5c575853664d8fe4f225a77b8df1b7de7d ("x86: attempt reboot via port
CF9 if we have standard PCI ports") from the x86 tree and commit
87238e8d2a086678c246825bc1a9dd148bba77cb ("x86: disable VMX on all CPUs
on reboot") from the kvm tree.

Just a context change.  I fixed it up (see below) and can carry the fix
as needed.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/reboot.c
index 0acde8f,a8b9304..0000000
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@@ -39,10 -40,13 +40,16 @@@ int reboot_force
  static int reboot_cpu = -1;
  #endif
  
+ /* This is set if we need to go through the 'emergency' path.
+  * When machine_emergency_restart() is called, we may be on
+  * an inconsistent state and won't be able to do a clean cleanup
+  */
+ static int reboot_emergency;
+ 
 -/* reboot=b[ios] | s[mp] | t[riple] | k[bd] | e[fi] [, [w]arm | [c]old]
 +/* This is set by the PCI code if either type 1 or type 2 PCI is detected */
 +bool port_cf9_safe = false;
 +
 +/* reboot=b[ios] | s[mp] | t[riple] | k[bd] | e[fi] [, [w]arm | [c]old] | p[ci]
     warm   Don't set the cold reboot flag
     cold   Set the cold reboot flag
     bios   Reboot by jumping through the BIOS (only for X86_32)
