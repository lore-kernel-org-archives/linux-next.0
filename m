From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: Tree for Aug 29
Date: Mon, 1 Sep 2014 16:15:52 -0500 (CDT)
Message-ID: <alpine.DEB.2.11.1409011615210.22966@gentwo.org>
References: <20140829150713.50d78c30@canb.auug.org.au> <20140901173521.GA8259@roeck-us.net>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qmta15.emeryville.ca.mail.comcast.net ([76.96.27.228]:60425
	"EHLO qmta15.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752466AbaIAVPy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Sep 2014 17:15:54 -0400
In-Reply-To: <20140901173521.GA8259@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Mon, 1 Sep 2014, Guenter Roeck wrote:

> arch/ia64/sn/kernel/setup.c: In function 'sn_cpu_init':
> arch/ia64/sn/kernel/setup.c:632:13: error: lvalue required as left operand of assignment
> make[1]: *** [arch/ia64/sn/kernel/setup.o] Error 1
> make: *** [arch/ia64/sn/kernel/setup.o] Error 2


Subject: ia64: sn_nodepda cannot be assigned to after this_cpu conversion. Use __this_cpu_write.

There must be an explit statement to modify the percpu variable after the conversion of the
sn_nodpda macro to use this_cpu_read.

Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/arch/ia64/sn/kernel/setup.c
===================================================================
--- linux.orig/arch/ia64/sn/kernel/setup.c
+++ linux/arch/ia64/sn/kernel/setup.c
@@ -629,7 +629,7 @@ void sn_cpu_init(void)

 	cnode = nasid_to_cnodeid(nasid);

-	sn_nodepda = nodepdaindr[cnode];
+	__this_cpu_write(__sn_nodepda, nodepdaindr[cnode]);

 	pda->led_address =
 	    (typeof(pda->led_address)) (LED0 + (slice << LED_CPU_SHIFT));
