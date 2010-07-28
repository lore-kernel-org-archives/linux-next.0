From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: Tree for July 27 (xen)
Date: Wed, 28 Jul 2010 14:11:45 +0100
Message-ID: <alpine.DEB.2.00.1007281410030.19809@kaball-desktop>
References: <20100727160708.722c39c1.sfr@canb.auug.org.au> <4C4F27A3.5040109@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.ctxuk.citrix.com ([62.200.22.115]:15271 "EHLO
	SMTP.EU.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753477Ab0G1NK4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Jul 2010 09:10:56 -0400
In-Reply-To: <4C4F27A3.5040109@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "jeremy@goop.org" <jeremy@goop.org>, Jeremy Fitzhardinge <Jeremy.Fitzhardinge@citrix.com>

On Tue, 27 Jul 2010, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20100726:
> > 
> > 
> > The xen tree lost its build problems but gained a conflict against Linus'
> > tree.
> 
> when X86_32=y, SMP=n, X86_LOCAL_APIC=n:
> 
> drivers/built-in.o: In function `xen_callback_vector':
> (.text+0x41238): undefined reference to `first_system_vector'
> 
> alloc_intr_gate() calls alloc_system_vector(), which uses first_system_vector.

this patch should solve the issue:

---

alloc_system_vector: access first_system_vector when X86_LOCAL_APIC=y

Currently alloc_system_vector reads and writes first_system_vector
unconditionally while first_system_vector is only defined when
CONFIG_X86_LOCAL_APIC=y.
This patch makes sure first_system_vector is accessed only in that case.

Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
index 617bd56..f83e055 100644
--- a/arch/x86/include/asm/desc.h
+++ b/arch/x86/include/asm/desc.h
@@ -341,8 +341,10 @@ static inline void alloc_system_vector(int vector)
 {
 	if (!test_bit(vector, used_vectors)) {
 		set_bit(vector, used_vectors);
+#if defined(CONFIG_X86_LOCAL_APIC)
 		if (first_system_vector > vector)
 			first_system_vector = vector;
+#endif
 	} else
 		BUG();
 }
