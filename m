From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of block tree
Date: Fri, 13 Jun 2008 17:22:29 +1000
Message-ID: <20080613172229.8cc6a483.sfr@canb.auug.org.au>
References: <20080611184729.978d62d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_17_22_29_+1000_NSENcz_RNlOi9Foo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45517 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753010AbYFMHWf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 03:22:35 -0400
In-Reply-To: <20080611184729.978d62d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__13_Jun_2008_17_22_29_+1000_NSENcz_RNlOi9Foo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Wed, 11 Jun 2008 18:47:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> [You win the prize for most conflicts in one day!  :-)]

You are still up there! :-)

> Today's linux-next merge of the block tree got conflicts in the following
> files:
>=20
> arch/powerpc/Kconfig	against the ftrace tree (trivial)
> arch/s390/kernel/time.c	against the s390 tree (function name change
> 			etr_sync_cpu_start -> clock_sync_cpu_start and
> 			etr_disable_sync_clock -> disable_sync_clock)

That one is gone.

> arch/x86/kernel/apic_32.c	against the x86 tree (set_intr_gate ->
> 				alloc_intr_gate)
> arch/x86/kernel/cpu/perfctr-watchdog.c	against the x86 tree (trivial)

Gone.

> arch/x86/kernel/i8259_64.c	against the x86 tree (set_intr_gate ->
> 				alloc_intr_gate and the part of the file was
> 				moved to irqinit_64.c)
> arch/x86/kernel/ldt.c	against the x86 tree (argument to smp_call_function
> 			changed)

Gone.

> arch/x86/kernel/nmi_32.c	against the x86 tree (file was merged
> 				into nmi.c which merged correctly)

Gone.

> arch/x86/kvm/vmx.c	against the kvm tree (trivial context and an
> 			on_each_cpu was removed)

Gone.

> arch/x86/xen/smp.c	against the cpus4096 tree (for_each_cpu_mask ->
> 			for_each_cpu_mask_nr and context)
> include/asm-x86/hw_irq_32.h	against the x86 tree (merged into hw_irq.h)
> include/asm-x86/hw_irq_64.h	against the x86 tree (merged into hw_irq.h
> 				and irq_vectors.h)
> include/asm-x86/mach-default/irq_vectors.h	against the x86 tree (merged
> 						into asm-x86/irq_vectors.h)
> include/asm-x86/mach-voyager/irq_vectors.h	against the x86 tree (merged
> 						into asm-x86/irq_vectors.h)
> (There was a bug in the above file - QIC_CALL_FUNCTION_CPI is used twice
> instead of being QIC_CALL_FUNCTION_SINGLE_CPI the second time)

That bug is still there.

> kernel/Makefile		against the sched tree (trivial context)
> kernel/rcupdate.c	against the sched tree (changed parameter to
> 			on_each_cpu)

Gone.

> net/iucv/iucv.c		against the net tree (trivial context)

Gone.

> virt/kvm/kvm_main.c	against the kvm tree (trivial context)

Gone.

> However the powerpc ppc64_defconfig build failed immediately like this:

This is fixed.

I pulled it together as best I could.  You might like to have a look at
the result when I publish the tree later tonight.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_17_22_29_+1000_NSENcz_RNlOi9Foo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhSIDUACgkQTgG2atn1QN8IVACdF8QwZSO9GAKaOkxAwIZ+mZqK
oXUAn1oFOe6mvgZzjPzRCbqeTZyzryfH
=2QKM
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_17_22_29_+1000_NSENcz_RNlOi9Foo--
