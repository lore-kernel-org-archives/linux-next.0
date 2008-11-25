From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 18:26:26 +1100
Message-ID: <20081125182626.f1fba897.sfr@canb.auug.org.au>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
	<1227584931.7622.11.camel@localhost.localdomain>
	<20081125151345.3f0ed493.sfr@canb.auug.org.au>
	<1227587493.7622.14.camel@localhost.localdomain>
	<20081125160935.2bd3dcb2.sfr@canb.auug.org.au>
	<1227591856.7622.26.camel@localhost.localdomain>
	<20081125175708.d28d08cd.sfr@canb.auug.org.au>
	<20081125071436.GA9660@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_18_26_26_+1100_Z6bohre8FOxz+h/="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32839 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751189AbYKYH0n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 02:26:43 -0500
In-Reply-To: <20081125071436.GA9660@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Steven Rostedt <srostedt@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_18_26_26_+1100_Z6bohre8FOxz+h/=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 25 Nov 2008 08:14:36 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> i've applied the assembly constraint fix to the x86 tree and i've=20
> integrated a new version of auto-x86-next which includes the fix, and=20
> pushed it out.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_18_26_26_+1100_Z6bohre8FOxz+h/=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrqKIACgkQjjKRsyhoI8xk0ACfbCwQjPaJ3lmfj2Gg+POgmOax
xd4AoIvwtCpsiyFszEoOp/VtbLB2BhSE
=Da8H
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_18_26_26_+1100_Z6bohre8FOxz+h/=--
