From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: x86 tree build failure
Date: Wed, 25 Jun 2008 13:17:50 +1000
Message-ID: <20080625131750.463ac507.sfr@canb.auug.org.au>
References: <20080617134615.d70be9f6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_13_17_50_+1000_xZWm7FMhFJX4Fdgt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44691 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752962AbYFYDSE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 23:18:04 -0400
In-Reply-To: <20080617134615.d70be9f6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__25_Jun_2008_13_17_50_+1000_xZWm7FMhFJX4Fdgt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi All,

On Tue, 17 Jun 2008 13:46:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) after merging the x86 tree
> failed like this:
>=20
> In file included from arch/x86/kernel/setup_64.c:34:
> include/linux/acpi.h:97:1: warning: "NR_NODE_MEMBLKS" redefined
> In file included from include/acpi/platform/aclinux.h:59,
>                  from include/acpi/platform/acenv.h:140,
>                  from include/acpi/acpi.h:54,
>                  from include/linux/acpi.h:39,
>                  from arch/x86/kernel/setup_64.c:34:
> include2/asm/acpi.h:165:1: warning: this is the location of the previous =
definition
>=20
> NR_NODE_MEMBLKS is defined in linux/acpi.h if CONFIG_HAVE_ARCH_PARSE_SRAT
> is defined and in asm-x86/acpi.h if CONFIG_ACPI_NUMA and CONFIG_X86_64
> are defined ...
>=20
> Lots of the above, as well as:
>=20
> arch/x86/mm/srat_64.c:101: error: syntax error before 'do'
> arch/x86/mm/srat_64.c:108: error: syntax error before 'do'
> arch/x86/mm/srat_64.c:113: error: syntax error before 'if'

This came back today (as Ingo said it would) to fix it, I have added the
following patches to linux-next:

acpi-acpi_numa_init-build-fix
ia64, acpi: fix Altix boot breakage in ACPI
acpi: fix boot breakage on Altix

All these have been incorporated into the commit that merges the x86 tree
so bisection should not fail.

What you need to do now is plan how you are going to get this into Linus'
tree ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_13_17_50_+1000_xZWm7FMhFJX4Fdgt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhuN4ACgkQTgG2atn1QN+gAQCePp49hx+CBNSiHPX8FX8JLqN5
z/UAn1x5KY2JQBKpvIKyZklSIl8vegSp
=dHpJ
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_13_17_50_+1000_xZWm7FMhFJX4Fdgt--
