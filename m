From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add UML to linux-next
Date: Thu, 26 Mar 2015 11:06:39 +1100
Message-ID: <20150326110639.11f821a4@canb.auug.org.au>
References: <5511DE72.6040109@nod.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Zcm1yk4cH3ySYgwXSw03g3n"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54354 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751729AbbCZAGr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2015 20:06:47 -0400
In-Reply-To: <5511DE72.6040109@nod.at>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-next@vger.kernel.org

--Sig_/Zcm1yk4cH3ySYgwXSw03g3n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Tue, 24 Mar 2015 23:00:18 +0100 Richard Weinberger <richard@nod.at> wrot=
e:
>
> can you please add the following tree to linux-next?
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git linux-next
>=20
> It is a shame that this did not happen long before, but from now own UML =
will use linux-next.

Added form today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/Zcm1yk4cH3ySYgwXSw03g3n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVE02UAAoJEMDTa8Ir7ZwVymIP/RkbySK7q+7vueHHrWpSCiVP
eNInkX/fzkdlNnJ4g8O1MQof9biaJHg2mPM5lfbODBWvIRXc0AQ/KHMxU3oQdpVx
shTQUjst7LwwLoiGc17XBiX1KQ2VK1ITQcEg9UVJnH2WGOfKbuHoM76KT1+JJPtv
5E7jg+iBdYzagk+nU3WZao1qPMzlK/3YNA52Bpu5nSOgUtHVc8vGycA/2AW5napb
zqwYlLa4LDE/BhodPq+D29XSwzeGHt58RzmptFtAbC3SpseQBJrVXwJaoa1zfdn9
yluXqjqOk2HJkDcH7NUE8nfn9VBgKh8EGGdEJu13OM8U6yWvwITlFhlx6q4uQNCN
+X1EUj9t/OHxN+WCorbSXhMB+KRC04vEUykkkkXFEi/NajoFBXTIOz/N5Q/3UMvt
Dhk//l9zJvTpiWGLYgJRqM7zaspr/nsSt6U7ZtBEG8nN854VBgDdPAg3TqvPuP5b
iw4xA8jN6QqwOHo5qz78z6zJvnRpcMOURZu8Mulib+RrtEcJd/iX8D6VXW38w17l
je2mXN1V1iDD8CnYVC5XqJw3qI0dhVeThyUbldKYQM2mUBZyww2YV1Yd2PpFFW6n
MiFnlKS8WpFuzP2dnzU9xHoKNqw/idIoyLr6tbPcwn99eIpbkJWl/JjjdS2Aa/F5
YzPCIXurYg6AV7OcHwdu
=iPgQ
-----END PGP SIGNATURE-----

--Sig_/Zcm1yk4cH3ySYgwXSw03g3n--
