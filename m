From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Automated Build Infrastructure
Date: Mon, 17 Nov 2008 14:45:35 +1100
Message-ID: <20081117144535.6981ecef.sfr@canb.auug.org.au>
References: <A938C8A5-205C-4DBF-A242-3966757C02E6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__17_Nov_2008_14_45_35_+1100_Tw3OLArUrsyH18Vf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37578 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755498AbYKQDps (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 22:45:48 -0500
In-Reply-To: <A938C8A5-205C-4DBF-A242-3966757C02E6@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Holden <aciddeath@gmail.com>
Cc: linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

--Signature=_Mon__17_Nov_2008_14_45_35_+1100_Tw3OLArUrsyH18Vf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Sun, 16 Nov 2008 20:32:39 -0700 Richard Holden <aciddeath@gmail.com> wro=
te:
>
> Does anyone have any scripts to kick off compilation when Stephen =20
> releases a new linux-next? I've started to plan out my own but wanted =20
> to see if anyone had something first so I don't reinvent the wheel.

In case it helps, your most reliable trigger would be the LATEST-IS file
in http://www.kernel.org/pub/linux/kernel/people/sfr/linux-next/
changing.  I think Randy Dunlap (cc'd) has some stuff.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__17_Nov_2008_14_45_35_+1100_Tw3OLArUrsyH18Vf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkg6N8ACgkQjjKRsyhoI8zfgwCgp0EAf/2PAcq44I68fnG67KIx
H/EAmwTmJGTHM2LsDiJ2911k2YhG1pNo
=uJZu
-----END PGP SIGNATURE-----

--Signature=_Mon__17_Nov_2008_14_45_35_+1100_Tw3OLArUrsyH18Vf--
