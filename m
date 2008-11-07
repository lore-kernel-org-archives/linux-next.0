From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Sat, 8 Nov 2008 09:54:29 +1100
Message-ID: <20081108095429.1ade66c9.sfr@canb.auug.org.au>
References: <20081107202541.85d6a823.sfr@canb.auug.org.au>
	<1226076005.9309.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__8_Nov_2008_09_54_29_+1100_qbjP68k3qunPTFNw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51957 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751065AbYKGWyi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 17:54:38 -0500
In-Reply-To: <1226076005.9309.9.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Josh Boyer <jwboyer@linux.vnet.ibm.com>

--Signature=_Sat__8_Nov_2008_09_54_29_+1100_qbjP68k3qunPTFNw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hollis,

On Fri, 07 Nov 2008 10:40:05 -0600 Hollis Blanchard <hollisb@us.ibm.com> wr=
ote:
>
> Hi Stephen, it looks like Josh accidentally set the following options in
> ppc44x_defconfig:
> +CONFIG_VIRTUALIZATION=3Dy
> +CONFIG_KVM=3Dy
> +CONFIG_KVM_BOOKE_HOST=3Dy
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/jwboyer/powerpc-4xx.git;a=3Dc=
ommitdiff;h=3D8531b7a805833649591fa324cadbab7d6b667f4b
>=20
> Since then, CONFIG_KVM_BOOKE_HOST was renamed to CONFIG_KVM_440.
> Unfortunately I don't have the right Kconfig constraint in place to
> catch that, leading to this problem. I will submit a patch for this
> today.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__8_Nov_2008_09_54_29_+1100_qbjP68k3qunPTFNw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkUxyUACgkQjjKRsyhoI8wkNACdHqYXqTEUTQudiLjQh4Yuf9By
E/oAn2JR66DUOXqrFSPCY7hvCs4/F2Vi
=fcwW
-----END PGP SIGNATURE-----

--Signature=_Sat__8_Nov_2008_09_54_29_+1100_qbjP68k3qunPTFNw--
