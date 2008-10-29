From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 29 Oct 2008 15:33:35 +1100
Message-ID: <20081029153335.97151847.sfr@canb.auug.org.au>
References: <20081029152849.3883d072.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Oct_2008_15_33_35_+1100_LmYh1mc8txQRiYAd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42873 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750831AbYJ2Edn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 00:33:43 -0400
In-Reply-To: <20081029152849.3883d072.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__29_Oct_2008_15_33_35_+1100_LmYh1mc8txQRiYAd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Wed, 29 Oct 2008 15:28:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rr tree got quite a few conflicts - too
> many for me to fix up right now.  I shall drop it for today and try again
> tomorrow.

The attempted merge went like this:

$ git merge quilt/rr
Renamed include/asm-x86/bigsmp/apic.h =3D> arch/x86/include/asm/bigsmp/apic=
.h
Auto-merged arch/x86/include/asm/bigsmp/apic.h
CONFLICT (rename/modify): Merge conflict in arch/x86/include/asm/bigsmp/api=
c.h
Renamed include/asm-x86/es7000/apic.h =3D> arch/x86/include/asm/es7000/apic=
.h
Auto-merged arch/x86/include/asm/es7000/apic.h
CONFLICT (rename/modify): Merge conflict in arch/x86/include/asm/es7000/api=
c.h
Renamed include/asm-x86/genapic_64.h =3D> arch/x86/include/asm/genapic_64.h
Auto-merged arch/x86/include/asm/genapic_64.h
Renamed include/asm-x86/ipi.h =3D> arch/x86/include/asm/ipi.h
Auto-merged arch/x86/include/asm/ipi.h
CONFLICT (rename/modify): Merge conflict in arch/x86/include/asm/ipi.h
Renamed include/asm-x86/mach-default/mach_apic.h =3D> arch/x86/include/asm/=
mach-default/mach_apic.h
Auto-merged arch/x86/include/asm/mach-default/mach_apic.h
CONFLICT (rename/modify): Merge conflict in arch/x86/include/asm/mach-defau=
lt/mach_apic.h
Auto-merged Documentation/lguest/lguest.c
Auto-merged arch/alpha/kernel/smp.c
Auto-merged arch/ia64/kernel/acpi.c
Auto-merged arch/ia64/kernel/perfmon.c
Auto-merged arch/ia64/kernel/setup.c
Auto-merged arch/mips/kernel/smp.c
Auto-merged arch/powerpc/kernel/machine_kexec_64.c
Auto-merged arch/powerpc/kernel/setup-common.c
Auto-merged arch/powerpc/mm/numa.c
Auto-merged arch/powerpc/platforms/cell/spu_base.c
CONFLICT (content): Merge conflict in arch/powerpc/platforms/cell/spu_base.c
Auto-merged arch/s390/Kconfig
Auto-merged arch/s390/kernel/smp.c
Auto-merged arch/sh/kernel/smp.c
Auto-merged arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/x86/Kconfig
Auto-merged arch/x86/kernel/genapic_flat_64.c
Auto-merged arch/x86/kernel/genx2apic_cluster.c
CONFLICT (content): Merge conflict in arch/x86/kernel/genx2apic_cluster.c
Auto-merged arch/x86/kernel/genx2apic_phys.c
CONFLICT (content): Merge conflict in arch/x86/kernel/genx2apic_phys.c
Auto-merged arch/x86/kernel/genx2apic_uv_x.c
CONFLICT (content): Merge conflict in arch/x86/kernel/genx2apic_uv_x.c
Auto-merged arch/x86/kernel/setup_percpu.c
Auto-merged arch/x86/kernel/smpboot.c
Auto-merged drivers/net/virtio_net.c
Auto-merged drivers/pci/pci-sysfs.c
Auto-merged drivers/pci/probe.c
Auto-merged include/linux/cpumask.h
CONFLICT (content): Merge conflict in include/linux/cpumask.h
Auto-merged include/linux/workqueue.h
Auto-merged init/Kconfig
Auto-merged init/main.c
Auto-merged kernel/Kconfig.preempt
CONFLICT (content): Merge conflict in kernel/Kconfig.preempt
Auto-merged kernel/cpu.c
CONFLICT (content): Merge conflict in kernel/cpu.c
Auto-merged kernel/irq/proc.c
Auto-merged kernel/module.c
Auto-merged kernel/panic.c
Auto-merged kernel/params.c
CONFLICT (content): Merge conflict in kernel/params.c
Auto-merged kernel/sched.c
CONFLICT (content): Merge conflict in kernel/sched.c
Auto-merged kernel/sched_stats.h
Auto-merged kernel/smp.c
Auto-merged kernel/stop_machine.c
CONFLICT (content): Merge conflict in kernel/stop_machine.c
Auto-merged kernel/time/timer_list.c
Auto-merged kernel/trace/trace.c
Auto-merged kernel/workqueue.c
Auto-merged lib/Kconfig.debug
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Auto-merged lib/cpumask.c
CONFLICT (content): Merge conflict in lib/cpumask.c
Auto-merged mm/slub.c
Auto-merged mm/vmstat.c
Auto-merged net/core/neighbour.c
Auto-merged net/ipv4/route.c

At least the move of the include files from include/asm-x86 to
arch/x86/include is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Oct_2008_15_33_35_+1100_LmYh1mc8txQRiYAd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkH558ACgkQjjKRsyhoI8wecACfURvCJuVrsJZTto2zDY/4/oPV
YPkAoLjvF//9+1w1edFy9eZ87HsK0Z8n
=nhM0
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Oct_2008_15_33_35_+1100_LmYh1mc8txQRiYAd--
