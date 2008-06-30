From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Mon, 30 Jun 2008 16:09:58 +1000
Message-ID: <20080630160958.ed96d469.sfr@canb.auug.org.au>
References: <20080630155912.ef5a1204.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_16_09_58_+1000_Pom0=sWfqyGIsoCu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48498 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752408AbYF3GKB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 02:10:01 -0400
In-Reply-To: <20080630155912.ef5a1204.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Zhao Yakui <yakui.zhao@intel.com>, Li Shaohua <shaohua.li@intel.com>

--Signature=_Mon__30_Jun_2008_16_09_58_+1000_Pom0=sWfqyGIsoCu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Jun 2008 15:59:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Len, Ingo,
>=20
> Today's linux-next merge of the acpi tree got a conflict in
> Documentation/kernel-parameters.txt between commits "ACPI : Create
> "idle=3Dnomwait" bootparam" and "ACPI: Create "idle=3Dhalt" bootparam"
> different version of which appear in the x86 and acpi trees ("ACPI :
> Create "idle=3Dnomwait" bootparam" in the acpi tree is different from the
> version that was in that tree on Friday (thus this conflict comes up
> again)).
>=20
> Please sort this out ...

This also caused conflicts in arch/ia64/kernel/process.c,
arch/x86/kernel/process.c, drivers/acpi/processor_core.c,
include/asm-ia64/processor.h and include/asm-x86/processor.h.

I fixed it up by using the acpi tree's versions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_16_09_58_+1000_Pom0=sWfqyGIsoCu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoeLYACgkQjjKRsyhoI8yK5QCfQ4zFU4rUkUOWVYmIE2clYgdi
unYAn0Tnf8/7BSJMcwIZKN0ruuA4JOK5
=1ReN
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_16_09_58_+1000_Pom0=sWfqyGIsoCu--
