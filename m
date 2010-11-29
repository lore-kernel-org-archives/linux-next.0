From: Valdis.Kletnieks@vt.edu
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Mon, 29 Nov 2010 11:59:04 -0500
Message-ID: <8825.1291049944@localhost>
References: <4CE2F914.9070106@free.fr> <24422.1290656467@localhost>
            <20101126182355.62615dff@mat-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1291049944_5346P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:52234 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429Ab0K2RA0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Nov 2010 12:00:26 -0500
In-Reply-To: Your message of "Fri, 26 Nov 2010 18:23:55 +0100."
             <20101126182355.62615dff@mat-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mat <castet.matthieu@free.fr>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, Kees Cook <kees.cook@canonical.com>

--==_Exmh_1291049944_5346P
Content-Type: text/plain; charset=us-ascii

On Fri, 26 Nov 2010 18:23:55 +0100, mat said:

> Le Wed, 24 Nov 2010 22:41:07 -0500,
> Valdis.Kletnieks@vt.edu a =E9crit :

> > This is incompatible with CONFIG_JUMP_LABEL:
> >
> > [  252.093624] BUG: unable to handle kernel paging request at
> > ffffffffa0680764 [  252.094008] IP: [<ffffffff81225ee0>]
> > generic_swap+0xa/0x1a [  252.094008] PGD 1a1e067 PUD 1a22063 PMD
> > 1093ac067 PTE 8000000109786161 [  252.094008] Oops: 0003 [#1] PREEMPT
> > SMP

> > > +config DEBUG_SET_MODULE_RONX
> > > +	bool "Set loadable kernel module data as NX and text as RO"
> > > +	default n
> > > +	depends on X86 && MODULES
> >
> > 	depends on X86 && MODULES && !JUMP_LABEL
> could you try the attached patch ?
> 
> on module load, we sort the __jump_table section. So we should make it
> writable.

> diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_la
bel.h
> index f52d42e..574dbc2 100644
> --- a/arch/x86/include/asm/jump_label.h
> +++ b/arch/x86/include/asm/jump_label.h
> @@ -14,7 +14,7 @@
>  	do {							\
>  		asm goto("1:"					\
>  			JUMP_LABEL_INITIAL_NOP			\
> -			".pushsection __jump_table,  \"a\" \n\t"\
> +			".pushsection __jump_table,  \"aw\" \n\t"\

Confirming that fixes the issue I was seeing, thanks...

--==_Exmh_1291049944_5346P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFM89vYcC3lWbTT17ARAjZYAJwIelyIEE0f7SOzWmergTbL9PEncQCfYKXH
5ABgu3cvaJfj1igKBmps0IM=
=LO7U
-----END PGP SIGNATURE-----

--==_Exmh_1291049944_5346P--
