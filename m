From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [SFI-devel] linux-next: sfi tree build warning
Date: Thu, 9 Jul 2009 09:45:26 +1000
Message-ID: <20090709094526.4764014c.sfr@canb.auug.org.au>
References: <20090708164400.f2138d79.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0907081123360.9604@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__9_Jul_2009_09_45_26_+1000_V13E7B_5ThqF7DWE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45384 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754173AbZGHXpc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2009 19:45:32 -0400
In-Reply-To: <alpine.LFD.2.00.0907081123360.9604@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: sfi-devel@simplefirmware.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__9_Jul_2009_09_45_26_+1000_V13E7B_5ThqF7DWE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Wed, 08 Jul 2009 11:26:48 -0400 (EDT) Len Brown <lenb@kernel.org> wrote:
>
> > Today's linux-next build (x86_64 allmodconfig) produced this warning:
>=20
> ah good, this means the SFI tree actually made it into linux-next:-)

Indeed :-)

> > arch/x86/kernel/sfi.c: In function 'sfi_init_memory_map':
> > arch/x86/kernel/sfi.c:99: warning: cast to pointer from integer of diff=
erent size
> > arch/x86/kernel/sfi.c:100: warning: cast to pointer from integer of dif=
ferent size
>=20
> This should go away when you pull the patch below for tomorrow's build.

Great, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__9_Jul_2009_09_45_26_+1000_V13E7B_5ThqF7DWE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpVL5YACgkQjjKRsyhoI8yyVQCglbHzrfSK7qnHSXV61YKIyYti
DMQAnihZrpdhJQlI8Kj0G+y46rrC3idk
=nGsn
-----END PGP SIGNATURE-----

--Signature=_Thu__9_Jul_2009_09_45_26_+1000_V13E7B_5ThqF7DWE--
