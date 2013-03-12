From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 12 Mar 2013 22:57:19 +1100
Message-ID: <20130312225719.c70d478eff3e77633d029386@canb.auug.org.au>
References: <20130312153047.dc10eb2392d07af8822e45f1@canb.auug.org.au>
	<513EF5DD.2010501@gaisler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__12_Mar_2013_22_57_19_+1100_e7UZIWh9GNnJ2Vsx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:47872 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755266Ab3CLL5b (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Mar 2013 07:57:31 -0400
In-Reply-To: <513EF5DD.2010501@gaisler.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Hellstrom <daniel@gaisler.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__12_Mar_2013_22_57_19_+1100_e7UZIWh9GNnJ2Vsx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Mar 2013 10:31:09 +0100 Daniel Hellstrom <daniel@gaisler.com> wr=
ote:
>
> APBPS2 driver is missing linux/slab.h required on at least PowerPC. See p=
atch below. How do you want me to proceed?

That is up to Dmitry - either a fix up patch (with SoB and commit
message) or a replacement patch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__12_Mar_2013_22_57_19_+1100_e7UZIWh9GNnJ2Vsx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRPxgfAAoJEECxmPOUX5FEsfUP/19j8nMytK98oUzSSHiKsxO3
lKnCzgeYe2fff+Np2wZL/FbY7OlpWxJU/vQr4HA+JWF44bmIHZBXVfa93Z5WpHuA
Rqr2QDPiwpwTH3EF3lOB+yCoaAjU4LgScZ/C4aOljoW78hknjnjafeQd894yu2C9
/W+hTHAsMUAjtUr4k15qVS09WtQIJuWnQ8XjvmQCmrFOlxoquGDl90P0l1pL9cGC
XCnP0dM8cK3dDLg5o0XFRIfCwlkYoRODI4dwElJrN/VgNSAk/C9l7aYQIYIkGd6b
6CYoJbmd/OeEMUEgzxhEa5yUeJQp0WVDHUc689w2uS0HBrkMKtw4VfukKsPATNxk
dyo8jHYVBCQkQhE+Z7+aFK7jOxDj3ytjfo9hq6NvlYe2k+89iwkEGmJkWWrDYXMY
0IFLn+TDCNTtxJh7gb13NIHX3IzyROrbbaga2e+YDJ5RxiZdTd3sTu3KaLcuHeft
L9kOobSm1YfbxPW0YlFb1/ksW4LynxvqKxIhf6NQdvbw8uVH8h2ThFqQ0ikWDkm/
KSRBPMXcHCgbKzjBa3lO3EGbL2uVoQnn4kYdyUWiqFgl+Mku6CaN5TzXy8J92uBR
48UZ2gSWVaJ6mNwzQgacZA+hB/h7lfc9OpmubzMt2dw8XfMAxtDAcpthqwwIdNoK
8WbCHLJBiZ5se7T/J6qy
=zSXT
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Mar_2013_22_57_19_+1100_e7UZIWh9GNnJ2Vsx--
