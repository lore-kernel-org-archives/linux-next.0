From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with the x86 tree
Date: Tue, 17 Feb 2009 11:42:02 +1100
Message-ID: <20090217114202.54584bdc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53698 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751252AbZBQAmI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Feb 2009 19:42:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in
arch/x86/Kconfig between commits e0ec9483dbe8f534e0f3ef413f9eba9a5ff78050
("x86/Voyager: remove KVM Kconfig quirk") and
49793b0341a802cf5ee4179e837a2eb20f12c9fe ("x86/Voyager: remove KGDB
Kconfig quirk") from the x86 tree and commit
9a5fd902273d01170fd033691bd70b142baa7309 ("ftrace: change function graph
tracer to use new in_nmi") from the ftrace tree.

Just context changes.  I fixed it up as in tip/master (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/Kconfig
index 1042d69,8fc9a84..0000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -34,8 -34,9 +34,9 @@@ config X8
  	select HAVE_FUNCTION_TRACER
  	select HAVE_FUNCTION_GRAPH_TRACER
  	select HAVE_FUNCTION_TRACE_MCOUNT_TEST
+ 	select HAVE_FTRACE_NMI_ENTER if DYNAMIC_FTRACE
 -	select HAVE_KVM if ((X86_32 && !X86_VOYAGER && !X86_VISWS && !X86_NUMAQ) || X86_64)
 -	select HAVE_ARCH_KGDB if !X86_VOYAGER
 +	select HAVE_KVM
 +	select HAVE_ARCH_KGDB
  	select HAVE_ARCH_TRACEHOOK
  	select HAVE_GENERIC_DMA_COHERENT if X86_32
  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
