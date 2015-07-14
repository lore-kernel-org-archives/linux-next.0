From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad version of the h8300 tree
Date: Tue, 14 Jul 2015 10:00:28 +1000
Message-ID: <20150714100028.2e02b90f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l_/l13Dlp/n1uMN6ZlCYvJo"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45062 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751712AbbGNAAh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jul 2015 20:00:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/l_/l13Dlp/n1uMN6ZlCYvJo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yoshinori,

I just fetched the h8300 tree and it is full of old commits without any
Signed-off-by tags.  It looks like old work that you have accidentally
based on.  I am sorry, but I can't use it, so I will drop your tree
until it is cleaned up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/l_/l13Dlp/n1uMN6ZlCYvJo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVpFEhAAoJEMDTa8Ir7ZwVlUQP/ROiUyZ1KCELcL0a/LDaBZla
3kRumzA+vkkCyAPvchjCMgLY4ntHl7DCPRfUoNwzEL4RohaN1he2U5oebFjW8Ihy
LvTIXGS/qr1c9r4XUhP5kNI4TLkixzSoruotxb2fg008RjvijknxcxlEK49oHqPC
8r1zGElXkbJOqIjuRtlkalEpVlCAO1AiqoLtA8SMy4jORpSrrEJevpF/KNIU55yL
kTkbDxa3W/S2ut8hlAt7TT+T09FJS2T2yZQjANkOEN6GQGfVLM7gg/jK72aWYQj6
Ozyf/fpDiQmaqEv5pqw19+mTTMoNt1tQwcN0rjakdirWGz5SvJNHvfpJ7A0zwHEh
7qcwIi+8BTMsnecTQ3okD38oRXL0T7DKQWx2LHO9aGYK4OM6Q4+Bkuu4oZ7Dcg3d
HjPE6BBLqoU2CHYdoLBuPnUK7W7MvmF9Pc4HM2Kn/nC5Lu4fOlnlAHvHGt/vEbPq
hMb9EbGKyzPKITjadbAdp805XsJYPqvLuFm3x4sCCuhZB0gv4J4Na6aDPkA4t+bh
W2ColhJrv8sYu3yPvi41cZ5H/oyWafRLNL+hmRITLlecul8oJzNPwQBOsE81mrL9
ymEOO7lpi4vcqwtB4Vp/CYCcRXFo6twQUUaYY5K5Rgxxmf1C+oxemgyy+BG4crWi
rK/4hkwe0ClmBEFxIu5x
=HTcK
-----END PGP SIGNATURE-----

--Sig_/l_/l13Dlp/n1uMN6ZlCYvJo--
