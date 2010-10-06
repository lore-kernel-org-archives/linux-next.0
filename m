From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Wed, 6 Oct 2010 13:47:56 +1100
Message-ID: <20101006134756.a6c8730a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57958 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755999Ab0JFCr7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Oct 2010 22:47:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Jason Baron <jbaron@redhat.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/x86/kernel/module.c between commit
5336377d6225959624146629ce3fc88ee8ecda3d ("modules: Fix module_bug_list
list corruption race") from Linus' tree and commit
d9f5ab7b1c0a520867af389bab5d5fcdbd0e407e ("jump label: x86 support") from
the tip tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/module.c
index 1c355c5,5399f58..0000000
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@@ -239,7 -239,10 +239,10 @@@ int module_finalize(const Elf_Ehdr *hdr
  		apply_paravirt(pseg, pseg + para->sh_size);
  	}
  
+ 	/* make jump label nops */
+ 	jump_label_apply_nops(me);
+ 
 -	return module_bug_finalize(hdr, sechdrs, me);
 +	return 0;
  }
  
  void module_arch_cleanup(struct module *mod)
