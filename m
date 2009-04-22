From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: wireless tree build failure
Date: Wed, 22 Apr 2009 15:11:57 +0200
Message-ID: <1240405917.21978.13.camel@johannes.local>
References: <20090422115738.524272c8.sfr@canb.auug.org.au>
	 <1240390746.17388.64.camel@johannes.local>
	 <20090422230333.e1f7d3db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-cX4t0+KKIZS2zkqN8Wdl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xc.sipsolutions.net ([83.246.72.84]:53531 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752087AbZDVNMh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 09:12:37 -0400
In-Reply-To: <20090422230333.e1f7d3db.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Len Brown <lenb@kernel.org>


--=-cX4t0+KKIZS2zkqN8Wdl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

> > Fun. Another rfkill problem. It'll get worse -- I have a complete rfkil=
l
> > rewrite in the pipeline. For this part it's easy, just remove
> > user_claim_unsupported use from the driver.
> >=20
> > Any suggestions on how to handle the other merge problems?
>=20
> Well, the best way (and I know this is simplistic and maybe difficult) is
> to introduce the new rewrite alongside the old code and then slowly move
> the clients of the API over.

I wish. But in this case, I don't see how that is possible without
duplicating the entire rfkill framework, moving over and then deleting
the old version.

johannes

--=-cX4t0+KKIZS2zkqN8Wdl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJ7xeUAAoJEKVg1VMiehFYToIQAL0KQgIrkhp8zmpTX021Mjug
zwCdS5BOFstHUZXffKp12ILjSEMoQpROnyBA6A6+jf00dhw+TU+jrJ9i4yFXYfvc
rdNXRc/3826J4WtMhgoxcA/QhDLvRnONbaoWILtRxC/Lsgp2m4NYV5DYlWM3pzow
doqjd9Av5780Oa52nfVmhLkr1I+RgdSOB89EYOvIJHJ8PnXGSoQxy7UgzZ4YNHNL
tdUGvnvAo0VK0klA0P6wwxvk+TqnSbMv5TbHXFBS9aeaBT6yW0+X1Trt0Mnl8lrm
zGlcjlAVi0HHleT5/Oy8KR+gUefy3eOV1aPUJA2G3U9wfqdTuU8hpv4pgorfiBTk
w0qMmb05r4rgvMa1ekFMnczdqcqnBWMcWKaRkJXLFIZcaKnIQNA8KgHKXhbdNbh0
ooz2RPl6OoyHZG12KWUfRLdcXFDAXCtqFSrfevfrxjH334+nrtnm4w4goC33ZDOS
RSF8LdxfQkGuVri705EiETgifGW1QvKmHwH9Tczv8B+XVeTsoZyGrbxysx1spDB/
y/UdqG5GFhHrzbZdilOprPVIY/0TAAMKKAyFEOtxWU4FbhJtAMY4+EAe76cXI6z/
BqTQXb+wZC0riQKsqhjO0/Wi3x3u5/pB9SKhTB6/EZ07ajRVUMGUPc1zkgrDD0wB
JePUWDOPuO6k7uJInkXK
=Szpk
-----END PGP SIGNATURE-----

--=-cX4t0+KKIZS2zkqN8Wdl--
