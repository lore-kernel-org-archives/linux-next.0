From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Thu, 9 Apr 2015 07:57:11 +1000
Message-ID: <20150409075711.615f0421@canb.auug.org.au>
References: <20150408184954.1356280d@canb.auug.org.au>
	<20150408151350.GA8490@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/39qm5IobiLgPVpxzqQKMjDn"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57929 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753897AbbDHV5U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Apr 2015 17:57:20 -0400
In-Reply-To: <20150408151350.GA8490@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>

--Sig_/39qm5IobiLgPVpxzqQKMjDn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Wed, 8 Apr 2015 17:13:51 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
>=20
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next merge of the akpm tree got a conflict in
> > arch/x86/kernel/cpu/common.c between commit 6b51311c9765
> > ("x86/asm/entry/64: Use a define for an invalid segment selector") from
> > the tip tree and commit f28c11e4b695 ("arch/x86/kernel/cpu/common.c:
> > fix warning") from the akpm tree.
>=20
> So f28c11e4b695 doesn't appear to be in linux-next as fetched a minute=20
> ago:
>=20
>  triton:~/linux.trees.git> git log f28c11e4b695 --
>  fatal: bad revision 'f28c11e4b695'
>  triton:~/linux.trees.git> git describe
>  next-20150408
>=20
> How am I supposed to fetch and interpret such sha1's?

Sorry, this was a special case.  This was a patch in the part of
Andrew's series that gets rebased on top of the rest of linux-next each
day (as that part has dependencies on other things in linux-next).  In
this case, the resolution was to drop the patch entirely as it had
become unnecessary.

This was it:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: arch/x86/kernel/cpu/common.c: fix warning

x86_64 allnoconfig:

arch/x86/kernel/cpu/common.c: In function 'syscall_init':
arch/x86/kernel/cpu/common.c:1225: warning: right shift count >=3D width of=
 type

Fixes: a76c7f4604937bc ("x86/asm/entry/64: Fold syscall32_cpu_init() into i=
ts sole user")
Cc: Denys Vlasenko <dvlasenk@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/x86/kernel/cpu/common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN arch/x86/kernel/cpu/common.c~arch-x86-kernel-cpu-commonc-fix-warn=
ing arch/x86/kernel/cpu/common.c
--- a/arch/x86/kernel/cpu/common.c~arch-x86-kernel-cpu-commonc-fix-warning
+++ a/arch/x86/kernel/cpu/common.c
@@ -1222,7 +1222,7 @@ void syscall_init(void)
 	wrmsrl_safe(MSR_IA32_SYSENTER_EIP, (u64)ia32_sysenter_target);
 #else
 	wrmsrl(MSR_CSTAR, ignore_sysret);
-	wrmsrl_safe(MSR_IA32_SYSENTER_CS, 0);
+	wrmsrl_safe(MSR_IA32_SYSENTER_CS, 0ULL);
 	wrmsrl_safe(MSR_IA32_SYSENTER_ESP, 0ULL);
 	wrmsrl_safe(MSR_IA32_SYSENTER_EIP, 0ULL);
 #endif
_

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/39qm5IobiLgPVpxzqQKMjDn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJaQ+AAoJEMDTa8Ir7ZwVtrgP/j9i7lENErCEzNMFZ+mmVAGs
MNZVRpXZ1Esu7+yS1LoHmxPrgzbPUi0d8ayX9NDFqzvn0RNM8XqrCEyliCxpZVXf
2fZCEwOwSfXyXmKqU/sR0Lx1itxrjlUdTvEJtHN5WnDSX2JStG/3JPB9j+uS6QfK
OHEtRFqcZRluADryodt9Z7MWYUAbp40n8B0Kx9AUwtVoEwwu5MOqtkk3RKb7yrxm
HAfDLcHwcqbA+21Sqy5NLcO5KkTDnDtgXBlJEL9zEQARFoJnxbK1Krf1ikAPMNFL
spauvjYosjm4ANJv7ccYJUuZDcKRBqNRl4nVwCRzhnoZQrzfZjUzwZMAF222HLnV
xd/EmTn3QDLXhqnwr2okMDc6BfHD1fA+5pP/gH5HqEXwOUOlrWRVsSl4zk+HrD/p
hM89m8ywh7sDyetCRSXwiUpgvhkrl4p6hi7SScSbjr95imJ8WxuKCtZxpQFVNvSj
C48XwB7zsP4DTERl1D9h+2UPfj6/xAhI7ZOkPMW6aNG3MUVDsNw4cAYg/itBjw9W
ASxj8Pp3EfeqrmVZHLuBhE5EVZXLv1tv6kvTtXEeBmQUxa0EPbe5mYRxSm8jDjLq
o5dZstyWeYXQZ2q/FXejODizFLJvI8MNVQdoBQVDWPp3/x3ctsB23Djn+w8Xklpq
EX3mmeW5uJUDeQxN/a6E
=uaTB
-----END PGP SIGNATURE-----

--Sig_/39qm5IobiLgPVpxzqQKMjDn--
