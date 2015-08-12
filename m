From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Aug 2015 15:09:54 +1000
Message-ID: <20150812150954.36bc605c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48888 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753875AbbHLFJ4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Aug 2015 01:09:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/enlighten.c

between commit:

  9261e050b686 ("x86/asm/tsc, x86/paravirt: Remove read_tsc() and read_tscp() paravirt hooks")

from the tip tree and commit:

  cd6f350a5460 ("xen/PMU: Initialization code for Xen PMU")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/xen/enlighten.c
index d9cfa452da9d,a1c2e46206a9..000000000000
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@@ -1215,8 -1179,11 +1219,8 @@@ static const struct pv_cpu_ops xen_cpu_
  	.read_msr = xen_read_msr_safe,
  	.write_msr = xen_write_msr_safe,
  
- 	.read_pmc = native_read_pmc,
 -	.read_tsc = native_read_tsc,
+ 	.read_pmc = xen_read_pmc,
  
 -	.read_tscp = native_read_tscp,
 -
  	.iret = xen_iret,
  #ifdef CONFIG_X86_64
  	.usergs_sysret32 = xen_sysret32,
