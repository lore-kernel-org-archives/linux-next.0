From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Fri, 2 Jan 2009 11:44:12 +1100
Message-ID: <20090102114412.dfb5fe90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49209 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753376AbZABAoS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Jan 2009 19:44:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Eduardo Habkost <ehabkost@redhat.com>, Jaswinder Singh Rajput <jaswinder@infradead.org>, Ingo Molnar <mingo@elte.hu>

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
arch/x86/kernel/reboot.c between commit
824877111cd7f2b4fd2fe6947c5c5cbbb3ac5bd8 ("x86, pci: move
arch/x86/pci/pci.h to arch/x86/include/asm/pci_x86.h") from the x86 tree
and commit 87238e8d2a086678c246825bc1a9dd148bba77cb ("x86: disable VMX on
all CPUs on reboot") from the kvm tree.

Just overlapping additions.  I fixed it up (see below) and can carry it
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/reboot.c
index 5b1f23b,72e0e4e..0000000
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@@ -12,7 -12,7 +12,8 @@@
  #include <asm/proto.h>
  #include <asm/reboot_fixups.h>
  #include <asm/reboot.h>
 +#include <asm/pci_x86.h>
+ #include <asm/virtext.h>
  
  #ifdef CONFIG_X86_32
  # include <linux/dmi.h>
