From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: wireless tree build failure
Date: Wed, 22 Apr 2009 23:03:33 +1000
Message-ID: <20090422230333.e1f7d3db.sfr@canb.auug.org.au>
References: <20090422115738.524272c8.sfr@canb.auug.org.au>
	<1240390746.17388.64.camel@johannes.local>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Apr_2009_23_03_33_+1000_0/3N+_Z/r_76nbFQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33163 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752087AbZDVNDp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 09:03:45 -0400
In-Reply-To: <1240390746.17388.64.camel@johannes.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Len Brown <lenb@kernel.org>

--Signature=_Wed__22_Apr_2009_23_03_33_+1000_0/3N+_Z/r_76nbFQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Wed, 22 Apr 2009 10:59:06 +0200 Johannes Berg <johannes@sipsolutions.net=
> wrote:
>
> Fun. Another rfkill problem. It'll get worse -- I have a complete rfkill
> rewrite in the pipeline. For this part it's easy, just remove
> user_claim_unsupported use from the driver.
>=20
> Any suggestions on how to handle the other merge problems?

Well, the best way (and I know this is simplistic and maybe difficult) is
to introduce the new rewrite alongside the old code and then slowly move
the clients of the API over.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Apr_2009_23_03_33_+1000_0/3N+_Z/r_76nbFQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknvFaUACgkQjjKRsyhoI8w9UACdEVZSVJtThVmYfQLG/vIiNIy4
VEEAnjA/ogm8vA/p4j5dHGMiVZA2qp5n
=IdKX
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Apr_2009_23_03_33_+1000_0/3N+_Z/r_76nbFQ--
