From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: linux-next: build failure after merge of the thermal-soc tree
Date: Wed, 4 Mar 2015 15:01:52 -0400
Message-ID: <20150304190150.GA3427@developer.amazonguestwifi.org>
References: <20150304180636.78c66f79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:37143 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758277AbbCDTB5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2015 14:01:57 -0500
Content-Disposition: inline
In-Reply-To: <20150304180636.78c66f79@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javi Merino <javi.merino@arm.com>


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Mar 04, 2015 at 06:06:36PM +1100, Stephen Rothwell wrote:
> Hi Eduardo,
>=20
> After merging the thermal-soc tree, today's linux-next build (arm
> cm_x2xx_defconfig (at least)) failed like this:
>=20
> include/linux/thermal.h:408:38: error: parameter name omitted
> include/linux/thermal.h:413:1: error: expected identifier or '(' before '=
{' token
>=20
> Caused by commit ddd4dd8ddf78 ("thermal: extend the cooling device API
> to include power information").
>=20

Thanks for pointing it out. Javi has already provided a fix and I
already added in my -linus branch. I will appear in your next linux-next
build.

BR,

Eduardo Valentin

> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJU91aVAAoJEMLUO4d9pOJWLAEH/04sACYJkZ9HM60TmEqQcXQ1
M7JyZenA2WxV2z2tnZX3L3PhEv2YZSFqAcggsQNZBUIj5BsVHZzQmCwzMI7yudP+
sWN8VbVwzr+e8ZKZRM5+3WCKNf5t+u5eIr6YH+9/FkIU1EByBP1gdoI9ELl979fK
5YW+d/1c89ZR7clzGllRJ8B5DMSO/D7Gj8zXGghagIeAUDlu240n5deHPTASE/nx
F+/VSnB9wryglgHdxnXv9TOfrYjobD6SFl323cDr6Wlxt3T99hyvMViVirmfSuq0
njtoxfZpYy9ctfF/beNL7VS+fqpAG70/RNImrdkAgEezxcbNZt9iOjODyTiKMIw=
=7fDc
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
