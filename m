From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import of rr series failed
Date: Fri, 14 Oct 2011 10:36:38 +1100
Message-ID: <20111014103638.accaae53bac0e74da3c787bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__14_Oct_2011_10_36_38_+1100__ON+EoywXGA23+kt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:34393 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752717Ab1JMXgy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Oct 2011 19:36:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__14_Oct_2011_10_36_38_+1100__ON+EoywXGA23+kt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Importing the rr series today I got this error:

$ git am ../quilt/rr/virtio:dont_add_config_to_list_for_per_vq_vector.patch
Patch format detection failed.

I added a From line to the top using the address from the first SOB line.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Oct_2011_10_36_38_+1100__ON+EoywXGA23+kt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIbBAEBCAAGBQJOl3YGAAoJEECxmPOUX5FES9QP9i+12Y1/2nsT3nfJFMW4Lt+F
ADVxumChCPp3kJsSukQ9mYBQEOPqxLgMmiqmNyQDYJIMrRFoCtSm5MCtWKNMSVGN
tWWdkXZ2GDYIU14w0M8VspZe0uuOSsIl3CA+Gli1HCKSIDRV06z5YGpi/sT7xQG7
O7jQEGgTnB26SACSDO7dvTNVH0zH+HWXgoEBNgd4mzk0/dP6OPHLLxjGvdj0e95G
TYYjGWKsRXC2mvwe0b5anqKJQBSHzKdyb8cXkHH307KofsBGgvFMdEKUT/aT2f71
AyZOffOzcYkZ6kCd6P4MG58XMb4ejj3lN7zpK74+Gw0XywbVaZ4Kuy0SoLaonibJ
RaXnYktEyHI0pRk5jfKtucatbS7/gdB3baF7mC+EUgBeCMcosxNbViC7nqrPHRXU
hKAHnu7gxEFpS6wbal2YNa95/2u4Wl1zQtCEtDzkUla+xd7LWDSPVa5dhK5Sb4pS
Dbgkx61pr4i7Ib745wvj0BM1jSfRngwbnL8TXmqP9wmkCQL6Btg5GITEn9f78ltG
2RABftFSU4yRCWAmZSGiDqcu0Klta2nFsyW92gTa8qcaC3vGgQeWLt99jQOnsYe5
+wvmL1ZN1DKPwMBblrlnGIFW6TZD4ZFIh8R9lqOlSyDRDc/wm2VZQ6mxwdpHZh0j
zzNuOWsb6x05UJUMOUM=
=Q5NG
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Oct_2011_10_36_38_+1100__ON+EoywXGA23+kt--
