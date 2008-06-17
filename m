From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: x86 tree build failure
Date: Tue, 17 Jun 2008 13:46:15 +1000
Message-ID: <20080617134615.d70be9f6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Jun_2008_13_46_15_+1000_foWylBipYKw77IWw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36606 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751386AbYFQDq1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 23:46:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__17_Jun_2008_13_46_15_+1000_foWylBipYKw77IWw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) after merging the x86 tree
failed like this:

In file included from arch/x86/kernel/setup_64.c:34:
include/linux/acpi.h:97:1: warning: "NR_NODE_MEMBLKS" redefined
In file included from include/acpi/platform/aclinux.h:59,
                 from include/acpi/platform/acenv.h:140,
                 from include/acpi/acpi.h:54,
                 from include/linux/acpi.h:39,
                 from arch/x86/kernel/setup_64.c:34:
include2/asm/acpi.h:165:1: warning: this is the location of the previous de=
finition

NR_NODE_MEMBLKS is defined in linux/acpi.h if CONFIG_HAVE_ARCH_PARSE_SRAT
is defined and in asm-x86/acpi.h if CONFIG_ACPI_NUMA and CONFIG_X86_64
are defined ...

Lots of the above, as well as:

arch/x86/mm/srat_64.c:101: error: syntax error before 'do'
arch/x86/mm/srat_64.c:108: error: syntax error before 'do'
arch/x86/mm/srat_64.c:113: error: syntax error before 'if'

and it went down hill from here ...

srat_64.c is built if CONFIG_X86_32 is *not* 'y' and CONFIG_ACPI_NUMA is
'y' while in include/linux/acpi.h, acpi_numa_slit_init,
acpi_numa_processor_affinity_init, acpi_numa_memory_affinity_init and
acpi_numa_arch_fixup are all macros if CONFIG_HAVE_ARCH_PARSE_SRAT is
defined.

So we have CONFIG_X86_64, CONFIG_ACPI_NUMA and
CONFIG_HAVE_ARCH_PARSE_SRAT all defined.

I have no idea how (or time) to fix this, so the x86 tree is dropped for
today.  If you guys are going to auto generate a tree for me each day,
then you need to test build it a bit, please.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Jun_2008_13_46_15_+1000_foWylBipYKw77IWw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhXM4cACgkQTgG2atn1QN9WYACghiUMizAFEbmjfk/mMGeZQPvF
TyEAniFvluT/cFpfcTnJo/qDUp+XU+el
=GQOK
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Jun_2008_13_46_15_+1000_foWylBipYKw77IWw--
