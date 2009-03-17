From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the x86 tree
Date: Tue, 17 Mar 2009 13:43:21 +1100
Message-ID: <20090317134321.012a058a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60531 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752485AbZCQCnY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 22:43:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Matias Zabaljauregui <zabaljauregui@gmail.com>, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/lguest/boot.c between commit
ccbeed3a05908d201b47b6c3dd1a373138bba566 ("x86: make lazy %gs optional on
x86_32") from the x86 tree and commit lguest_load_tls ("This patch allow
us to use KVM hypercalls") from the rr tree.

Just context changes.  I fixed it up (see below) and can carry the fix
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/lguest/boot.c
index 9fe4dda,4cb0674..0000000
--- a/arch/x86/lguest/boot.c
+++ b/arch/x86/lguest/boot.c
@@@ -283,8 -311,8 +316,8 @@@ static void lguest_load_tls(struct thre
  	/* There's one problem which normal hardware doesn't have: the Host
  	 * can't handle us removing entries we're currently using.  So we clear
  	 * the GS register here: if it's needed it'll be reloaded anyway. */
 -	loadsegment(gs, 0);
 +	lazy_load_gs(0);
- 	lazy_hcall(LHCALL_LOAD_TLS, __pa(&t->tls_array), cpu, 0);
+ 	lazy_hcall2(LHCALL_LOAD_TLS, __pa(&t->tls_array), cpu);
  }
  
  /*G:038 That's enough excitement for now, back to ploughing through each of
