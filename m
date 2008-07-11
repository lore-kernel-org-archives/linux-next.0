From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Warnings while compiling for i386
Date: Fri, 11 Jul 2008 20:21:33 +1000
Message-ID: <20080711202133.57fa3727.sfr@canb.auug.org.au>
References: <1215770936.2995.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Jul_2008_20_21_33_+1000_mbJbRjWHzJ=Ur7bL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41810 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752855AbYGKKVv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 06:21:51 -0400
In-Reply-To: <1215770936.2995.27.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: vibi_sreenivasan@cms.com
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__11_Jul_2008_20_21_33_+1000_mbJbRjWHzJ=Ur7bL
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(Add some CC's)

On Fri, 11 Jul 2008 15:38:56 +0530 vibi sreenivasan <vibi_sreenivasan@cms.c=
om> wrote:
>
> hello ,
> 	I am getting alot of warnings while compiling for i386 architecture.
> 	i am using default configuration for i386 & my compiler version is
> 4.1.1
> =09
> 	following are warnings
>=20
> arch/x86/kernel/smpboot.c: In function =E2=80=98do_boot_cpu=E2=80=99:
> arch/x86/kernel/smpboot.c:943: warning: label =E2=80=98restore_state=E2=
=80=99 defined
> but not used
> *
> *
> arch/x86/mm/pgtable.c: In function =E2=80=98pgd_mop_up_pmds=E2=80=99:
> arch/x86/mm/pgtable.c:194: warning: unused variable =E2=80=98pmd=E2=80=99
> CC      arch/x86/mm/pgtable_32.o
> arch/x86/mm/pgtable_32.c:144: warning: =E2=80=98fixmaps=E2=80=99 defined =
but not used
> *
> *
> kernel/sched.c:7743: warning: initialization from incompatible pointer
> type
> kernel/sched.c:7743: warning: initialization from incompatible pointer
> type
> *
> *
> sound/core/pcm_native.c: In function =E2=80=98snd_pcm_fasync=E2=80=99:
> sound/core/pcm_native.c:3262: warning: label =E2=80=98out=E2=80=99 define=
d but not used
> *
> *
> WARNING: modpost: Found 6 section mismatch(es).
> *
> *
> RELOCS  arch/x86/boot/compressed/vmlinux.relocs
> WARNING: Absolute relocations present
> Offset     Info     Type     Sym.Value Sym.Name
> c103405d 00807601   R_386_32 c1357371  __start_notes
> c13627a8 0098e101   R_386_32 c14a5efc  __start___kcrctab
> c13627bc 00984101   R_386_32 c14a5efc  __start___kcrctab_gpl
> c13627c8 00797001   R_386_32 c14a5efc  __start___ksymtab_gpl_future
> c13627cc 0082ba01   R_386_32 c14a5efc  __stop___ksymtab_gpl_future
> c13627d0 00802801   R_386_32 c14a5efc  __start___kcrctab_gpl_future
> c153c1fe 008e7401   R_386_32 c1357371  __stop_notes
> c153c204 00807601   R_386_32 c1357371  __start_notes
>=20
> Thanks & Regards
> vibi sreenivasan
>=20
>=20
>=20


--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Jul_2008_20_21_33_+1000_mbJbRjWHzJ=Ur7bL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh3NC0ACgkQjjKRsyhoI8zW6ACgg4ig8Cy1lZ3Bd/OhpDSq+sWp
lNQAoLIK+fAadTTyXVdwrSzCaUu1X36h
=6+WY
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Jul_2008_20_21_33_+1000_mbJbRjWHzJ=Ur7bL--
