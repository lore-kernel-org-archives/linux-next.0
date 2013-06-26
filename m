From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: please add queue for removal of __cpuinit and
 friends.
Date: Wed, 26 Jun 2013 17:38:22 +1000
Message-ID: <20130626173822.957f35baad3637092bb61a7d@canb.auug.org.au>
References: <20130625152702.GA27288@windriver.com>
	<20130626112202.0929939fdc416f23d4bc06fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__26_Jun_2013_17_38_22_+1000_N/ex+GbfL.Z5aE9Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:49903 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751776Ab3FZHid (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 03:38:33 -0400
In-Reply-To: <20130626112202.0929939fdc416f23d4bc06fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>

--Signature=_Wed__26_Jun_2013_17_38_22_+1000_N/ex+GbfL.Z5aE9Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 26 Jun 2013 11:22:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I will try it today and see how we go.  I assume that the current set of
> patches is based on next-20130625?

OK, its in today.  Just for info (at the end of today's linux-next):

$ git grep -l __cpuinit
arch/arm/mach-keystone/platsmp.c
arch/arm/mach-sti/platsmp.c
arch/mips/ath79/setup.c
arch/mips/cavium-octeon/octeon-irq.c
arch/mips/cavium-octeon/smp.c
arch/mips/include/asm/uasm.h
arch/mips/kernel/cevt-bcm1480.c
arch/mips/kernel/cevt-gic.c
arch/mips/kernel/cevt-r4k.c
arch/mips/kernel/cevt-sb1250.c
arch/mips/kernel/cevt-smtc.c
arch/mips/kernel/cpu-bugs64.c
arch/mips/kernel/cpu-probe.c
arch/mips/kernel/smp-bmips.c
arch/mips/kernel/smp-mt.c
arch/mips/kernel/smp-up.c
arch/mips/kernel/smp.c
arch/mips/kernel/smtc.c
arch/mips/kernel/spram.c
arch/mips/kernel/sync-r4k.c
arch/mips/kernel/traps.c
arch/mips/kernel/watch.c
arch/mips/lantiq/irq.c
arch/mips/lib/uncached.c
arch/mips/mm/c-octeon.c
arch/mips/mm/c-r3k.c
arch/mips/mm/c-r4k.c
arch/mips/mm/c-tx39.c
arch/mips/mm/cache.c
arch/mips/mm/page.c
arch/mips/mm/sc-ip22.c
arch/mips/mm/sc-mips.c
arch/mips/mm/sc-r5k.c
arch/mips/mm/sc-rm7k.c
arch/mips/mm/tlb-r3k.c
arch/mips/mm/tlb-r4k.c
arch/mips/mm/tlb-r8k.c
arch/mips/mm/tlbex.c
arch/mips/mti-malta/malta-smtc.c
arch/mips/mti-malta/malta-time.c
arch/mips/mti-sead3/sead3-time.c
arch/mips/netlogic/common/smp.c
arch/mips/netlogic/common/time.c
arch/mips/netlogic/xlr/wakeup.c
arch/mips/pci/pci-ip27.c
arch/mips/pmcs-msp71xx/msp_smtc.c
arch/mips/pmcs-msp71xx/msp_time.c
arch/mips/pnx833x/common/interrupts.c
arch/mips/powertv/time.c
arch/mips/ralink/irq.c
arch/mips/sgi-ip27/ip27-init.c
arch/mips/sgi-ip27/ip27-smp.c
arch/mips/sgi-ip27/ip27-timer.c
arch/mips/sgi-ip27/ip27-xtalk.c
arch/mips/sibyte/bcm1480/smp.c
arch/mips/sibyte/sb1250/smp.c
arch/x86/include/asm/microcode_amd.h
arch/x86/include/asm/processor.h
arch/x86/kernel/i387.c
arch/x86/kernel/microcode_amd_early.c
include/linux/init.h
scripts/tags.sh
$ git grep -l __cpuexit
arch/blackfin/mach-common/smp.c
arch/metag/kernel/smp.c
include/linux/init.h
$ git grep -l __cpuinitdata
arch/mips/cavium-octeon/octeon-irq.c
arch/mips/include/asm/uasm.h
arch/mips/kernel/cpu-bugs64.c
arch/mips/kernel/cpu-probe.c
arch/mips/kernel/sync-r4k.c
arch/mips/kernel/traps.c
arch/mips/mm/c-r4k.c
arch/mips/mm/page.c
arch/mips/mm/tlb-r4k.c
arch/mips/mm/tlbex.c
include/linux/init.h
scripts/tags.sh
$ git grep -l __cpuinitconst
include/linux/init.h
$ git grep -l __cpuexitdata
include/linux/init.h
$ git grep -l __cpuexitconst
include/linux/init.h
$ git grep -l __CPUINIT
arch/arm/kernel/head-nommu.S
arch/mips/kernel/bmips_vec.S
arch/mips/kernel/head.S
arch/mips/mm/cex-sb1.S
arch/mips/netlogic/common/smpboot.S
include/linux/init.h

So I guess the Ralf hasn't put the mips patch in his mips-for-linux-next
branch yet.  And a few more uses have crept in. :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__26_Jun_2013_17_38_22_+1000_N/ex+GbfL.Z5aE9Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRyppzAAoJEECxmPOUX5FEBugQAKArUm2Ry6zJyu3eatxEkAjI
G+YYLhHGDINVB+DsYs9nt6vWZAFjrP0OKs5ihip9hc8cfsQjgAPf550OFNQThqUJ
Po1WxWLDSA5wLIhrMm6+TrsPgEuKjk84PCMe8ZYhjKlL3GSk4GNe+QECzHMW7cUW
Qqto7sHt8xqmB39LEujHEAhoGvbnfidV2VbHMpLOW2FZBIoyYeEQ1xjvftLJcIZt
wOdUW/fTGfywk9A4oj/iopteyPeywKb2N/W8SBLoZ8tBo029UPY/OBRf5MkeD3E3
aa+88hlvmbCExq7or3ZJ5LCWbY18i/qxMHPwPeDQ0aF/leryywA2LBfKlxh1pmcN
IsndsJx1alLPedI6HsAqs3QkDQGhmlBtBW1QsB5vnHgZ2gwpwf5LvRFpIB3fdLl3
fl0tr1QnXPKq84Es6Q4Q6QIWBLdUljg9PHmNQpkXPS8CfVmKkZryBX5bJjr3W5L7
3jasUnJlXEIrIrooX18v5JRWtfaRoQJpFAIXR8CPqQ6oPfa7jU9HkLe2mxe6M1ND
ypcKqUoljm7jWYR6+oU5meQwDnioLA3M1hX+/pUxQnuGRmeNGfOn12zNRCQUUK/6
0ZHbsZi+XA+k424ETwt+kWleoabtKjURxz4oFEUemsGU7665/84AfNVRfo8oB7FC
bFg/JKkJ1t0zQCMXbXM8
=v2qR
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Jun_2013_17_38_22_+1000_N/ex+GbfL.Z5aE9Z--
