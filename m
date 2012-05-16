From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: question about the sound tree
Date: Thu, 17 May 2012 09:24:38 +1000
Message-ID: <20120517092438.fce7979fcd25c1fca03268f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__17_May_2012_09_24_38_+1000_JldZFZi/mr0hW.GM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:51543 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760747Ab2EPXYx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 19:24:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Dave Airlie <airlied@linux.ie>

--Signature=_Thu__17_May_2012_09_24_38_+1000_JldZFZi/mr0hW.GM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

I am just curious as to why the drm tree has been merged into the sound
tree.  This, of course, means that the drm tree has to remain stable (at
least up to commit 218c872bf828 "Merge tag
'drm-intel-next-2012-05-06-merged' of
git://people.freedesktop.org/~danvet/drm-intel into drm-core-next").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__17_May_2012_09_24_38_+1000_JldZFZi/mr0hW.GM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPtDc2AAoJEECxmPOUX5FEnXIP/RxlQ+/9Civmqt0l0THGDYPi
uZ2CTl3kh4++TBMF+q+wSoQs3YH45zLFTRXlwaxFpn4zuXOSVdZeZYSNI0gG+jIA
pn+R+j+9ehLHyElGw4Q2cnTEZq379HD5JK0PAg+vdogw+j2dyNu111fito/zhfmb
BKs9Nj+1uYaqs13z902H6Hu7c157uBDclSfOn/6FosHov6InQHXm8kEzf+i1nzNB
6vUG4uofFXgzqP2GqB8VhPt/pCo/ncbhfH/LRzbisya0BzZaDTMoU1zyM4P6ZPtn
hl/H0Oa0HgvawOsPTFz2s5zA3gf4IXUgd1PgYkI3oeeXpeINros+xan1O4u5LnOI
JtrDns7cj3p+UFlGgyK6DeWP4e4VvMbvv5z87X9aIcHBbXzkLZXSxnfHKHQsmwFQ
aBMWCszUcoJ9jj6qeMGVzm0pcHm0chDkLiXBFw/oTyW5iNM8luiT+eZ/p1qU+KIa
hBb7dSiEZc0THEVkcrjk8gSDbkoOzzkUGvs7XxgU5B2blK1WAMMt7Y3zXv64mQH3
a4fYEQgaHGwVDoXWSzDa4x2GGW9xs4Ol36hqvMlNZbQy2KVjoSiye9BuCLQz9OTD
6EcwCEDtb/8uv3H9SX3V9cLi01XcqgyR04ENbjVXdv0ULkk08H0gBrfUAD4IUx+8
Vondzl1alVfiiRGLkjfp
=PEI/
-----END PGP SIGNATURE-----

--Signature=_Thu__17_May_2012_09_24_38_+1000_JldZFZi/mr0hW.GM--
