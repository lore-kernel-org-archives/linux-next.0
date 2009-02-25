From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: cpufreq tree build failure
Date: Wed, 25 Feb 2009 15:23:40 +1100
Message-ID: <20090225152340.6945b58c.sfr@canb.auug.org.au>
References: <20090224172112.727b4043.sfr@canb.auug.org.au>
	<20090224165103.GA2998@redhat.com>
	<20090225142955.1104d5bc.sfr@canb.auug.org.au>
	<20090225034504.GA25446@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Feb_2009_15_23_40_+1100_emsHt3pXmxKyWNI4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54277 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753085AbZBYEXs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2009 23:23:48 -0500
In-Reply-To: <20090225034504.GA25446@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, Matthias-Christian Ott <ott@mirix.org>, Dominik Brodowski <linux@brodo.de>

--Signature=_Wed__25_Feb_2009_15_23_40_+1100_emsHt3pXmxKyWNI4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 24 Feb 2009 22:45:04 -0500 Dave Jones <davej@redhat.com> wrote:
>
> There were a bunch of 64bit Xeons made that lacked P-states.
> Though using p4-clockmod as a replacement isn't a good idea, but we should
> still allow it for thermal protection.
> Also some of the Atoms are 64bit capable, but also lack P-states.
>=20
> I'll nix the ifdefs and regenerate the tree.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Feb_2009_15_23_40_+1100_emsHt3pXmxKyWNI4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmkx8wACgkQjjKRsyhoI8wLqQCfSQOq96spAP1/BXKLudBU7l0t
0UYAnjfwseaLBAze7wm1dd6mds27FSuO
=B5bW
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Feb_2009_15_23_40_+1100_emsHt3pXmxKyWNI4--
