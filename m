From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: wireless tree build failure
Date: Wed, 22 Apr 2009 10:59:06 +0200
Message-ID: <1240390746.17388.64.camel@johannes.local>
References: <20090422115738.524272c8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-bB6ZR502bzoPYjOxjC2k"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xc.sipsolutions.net ([83.246.72.84]:58223 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751749AbZDVI7r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 04:59:47 -0400
In-Reply-To: <20090422115738.524272c8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Len Brown <lenb@kernel.org>


--=-bB6ZR502bzoPYjOxjC2k
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

> drivers/platform/x86/oqo-wmi.c: In function 'oqo_rfkill_init':
> drivers/platform/x86/oqo-wmi.c:767: error: 'struct rfkill' has no member =
named 'user_claim_unsupported'
>=20
> Caused by commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 ("rfkill:
> remove user_claim stuff") interacting with commit
> 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86: Add oqo-wmi
> driver for model 2 OQO backlight and rfkill control") from the acpi tree.
>=20
> I have reverted commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 for today=
.
>=20
> Johannes, maybe you could suggest a patch for the acpi guys?

Fun. Another rfkill problem. It'll get worse -- I have a complete rfkill
rewrite in the pipeline. For this part it's easy, just remove
user_claim_unsupported use from the driver.

Any suggestions on how to handle the other merge problems?

johannes

--=-bB6ZR502bzoPYjOxjC2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJ7txSAAoJEKVg1VMiehFYfZ0P/0Z02wn4KhldCKyFfJZLfSvL
GE+1Znq3Sarjh8Gikc6imhPpCTMPrjC7K+WcFJzXYjWGAwSBvkknjNHK6VfNCpOc
WNtiVVHvc7QBPn5+GeUg2Y5STLlxqvxp1Z4QjnT/BsO3jYBD6/6bKa1UmnAyp9CE
J9F8iQgzunseL74N8VqrTWi93P6tPEFDcpK+3Q0EKrD3Vldz3OKlP2KGj6Rs2Bzv
4TcMnj1zUgVgkqMjHLRvnYoQ4CeRMLLbx3lRJ8D3NkkGKH1AJ+91p0+NLeXxAtye
fbWrwwSGxNB9Q/MRFXiBaInU4o20JGrxxIjTvZlEiR28ylI7zDmwtAQ2d/EXYT1z
IsKOb0KBjA3jU8ovCc7U1S273BUoiUO9pQeb5b7eiJg4xE4yrlOgOhsbtlVOvLku
4klNvEirbSfaTPQc+j7aIrpx80QhXyOn7wZqYyGAr3S4lL1YD8lhklb1Vxp8+n1/
6ivsC3GqAQo/4zFiG5X+rLv+cqkbwwzotVwZfi3zfnjLF1HG0Qi9DLCvF/lZJOnj
fmJFHG7xdfBJDa7nig1qvTfeLkspaVCWP0j3Nog7gy2MXtp5D0XcEsrYcqTS3fbd
bpfCASQuL5mcD8wSDDNXNvUGnoKhkq/6BVVMtwq9/vghXRpKw+XroYIfcpPkJOSv
yWPqc+PJF0RVlCf4PS/a
=wul9
-----END PGP SIGNATURE-----

--=-bB6ZR502bzoPYjOxjC2k--
