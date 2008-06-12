From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 12 Jun 2008 17:24:03 +1000
Message-ID: <20080612172403.4b04713b.sfr@canb.auug.org.au>
References: <20080611192748.686236fd.sfr@canb.auug.org.au>
	<20080611095951.GB14033@elte.hu>
	<18512.32267.636550.47385@cargo.ozlabs.ibm.com>
	<20080612053335.GA22035@bubble.grove.modra.org>
	<20080612170505.6049fa75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Jun_2008_17_24_03_+1000_ye=IN12V4AWEL/g/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51464 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752356AbYFLHYN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 03:24:13 -0400
In-Reply-To: <20080612170505.6049fa75.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alan Modra <amodra@bigpond.net.au>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

--Signature=_Thu__12_Jun_2008_17_24_03_+1000_ye=IN12V4AWEL/g/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Jun 2008 17:05:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> So, I will disable FTRACE on powerpc for now by removing HAVE_FTRACE from
> being selected in arch/powerpc/Kconfig.

That got rid of the initial errors, but now it fails for relocations
on .memcmp and some others.

Next guess:  I have reverted commit
a7815807f749669d3e06529b2d448390f2ef0f9d ("kbuild: simplify vmlinux link
stage") and powerpc allmodconfig builds again.  (even with FTRACE reenabled)

[For those that came in late (Sam):  a powerpc allyesconfig build was
getting errors like this:

net/ipx/af_ipx.c:1830: relocation truncated to fit: R_PPC64_REL24 against s=
ymbol `._mcount' defined in .text section in vmlinux.o

which I surmised was caused by ftrace adding -pg to KBUILD_CFLAGS.]

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Jun_2008_17_24_03_+1000_ye=IN12V4AWEL/g/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhQzxMACgkQTgG2atn1QN8gqwCfVJjRVc2m/05aCoihALLNkkxY
9YIAoIOn4us8r3K2H2pmucBd73DGzbJN
=TsDp
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Jun_2008_17_24_03_+1000_ye=IN12V4AWEL/g/--
