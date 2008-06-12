From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 12 Jun 2008 17:05:05 +1000
Message-ID: <20080612170505.6049fa75.sfr@canb.auug.org.au>
References: <20080611192748.686236fd.sfr@canb.auug.org.au>
	<20080611095951.GB14033@elte.hu>
	<18512.32267.636550.47385@cargo.ozlabs.ibm.com>
	<20080612053335.GA22035@bubble.grove.modra.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Jun_2008_17_05_05_+1000_vzfSIjzIrtG6spjm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47433 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755604AbYFLHFR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 03:05:17 -0400
In-Reply-To: <20080612053335.GA22035@bubble.grove.modra.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Modra <amodra@bigpond.net.au>
Cc: Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

--Signature=_Thu__12_Jun_2008_17_05_05_+1000_vzfSIjzIrtG6spjm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Jun 2008 15:03:35 +0930 Alan Modra <amodra@bigpond.net.au> wrote:
>
> On Thu, Jun 12, 2008 at 11:38:19AM +1000, Paul Mackerras wrote:
> > Direct unconditional branches, including procedure calls, can only
> > reach +/- 32MB from the address of the branch on powerpc.  So if the
> > image grows to more than 32MB of text there is a problem unless the
> > linker is smart enough to insert trampolines.  I don't know whether
> > GNU ld is that smart.
>=20
> It is, but you need to pass --relax to enable generation of the
> trampolines.

So I tried this (added --relax to LDFLAGS_vmlinux if CONFIG FTRACE was
set) and got this;

/usr/bin/ld: --relax and -r may not be used together

So, I will disable FTRACE on powerpc for now by removing HAVE_FTRACE from
being selected in arch/powerpc/Kconfig.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Jun_2008_17_05_05_+1000_vzfSIjzIrtG6spjm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhQyqEACgkQTgG2atn1QN+8VgCeKNq4rWhMN7Uu5asxOt2++UZB
kzAAnAzNX0rPO27Bn4RbwoRBdyImeKdT
=QlV6
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Jun_2008_17_05_05_+1000_vzfSIjzIrtG6spjm--
