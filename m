From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the tip-core tree
Date: Fri, 27 Mar 2009 13:55:15 +1100
Message-ID: <20090327135515.548a7dfa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37376 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753039AbZC0CzZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 22:55:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/extable.c between commit 4a44bac1f98223ed77e47bf3b42fcfd10cddd85f
("symbols, stacktrace: look up init symbols after module symbols") from
the tip-core tree and commit 17d40c1282099b665622670e7e152b498f53be2e
("module:remove-module_text_address") from the rr tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/extable.c
index cd9250d,384f0da..0000000
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@@ -76,19 -58,7 +76,19 @@@ int __kernel_text_address(unsigned lon
  {
  	if (core_kernel_text(addr))
  		return 1;
- 	if (__module_text_address(addr))
 -	return is_module_text_address(addr);
++	if (is_module_text_address(addr))
 +		return 1;
 +	/*
 +	 * There might be init symbols in saved stacktraces.
 +	 * Give those symbols a chance to be printed in
 +	 * backtraces (such as lockdep traces).
 +	 *
 +	 * Since we are after the module-symbols check, there's
 +	 * no danger of address overlap:
 +	 */
 +	if (init_kernel_text(addr))
 +		return 1;
 +	return 0;
  }
  
  int kernel_text_address(unsigned long addr)
