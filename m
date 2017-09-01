From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma tree
Date: Fri, 1 Sep 2017 08:06:59 -0400
Message-ID: <78c70af4-21d0-94f2-6a2d-a832f24d23f4@redhat.com>
References: <20170901075046.557e345c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="s5MomclB62U2avEjfxK7qPpN2gTxgqbRJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33428 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751499AbdIAMH1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 Sep 2017 08:07:27 -0400
In-Reply-To: <20170901075046.557e345c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Kaike Wan <kaike.wan@intel.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s5MomclB62U2avEjfxK7qPpN2gTxgqbRJ
Content-Type: multipart/mixed; boundary="TUA61viMpBa7XXtcidqD7r9uIEiqlxBfi";
 protected-headers="v1"
From: Doug Ledford <dledford@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Kaike Wan <kaike.wan@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <78c70af4-21d0-94f2-6a2d-a832f24d23f4@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma tree
References: <20170901075046.557e345c@canb.auug.org.au>
In-Reply-To: <20170901075046.557e345c@canb.auug.org.au>

--TUA61viMpBa7XXtcidqD7r9uIEiqlxBfi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/31/2017 5:50 PM, Stephen Rothwell wrote:
> Hi Doug,
>=20
> Commit
>=20
>   4b9796b0a6fb ("IB/hfi1: Use accessor to determine ring size")
>=20
> is missing a Signed-off-by from its author.
>=20

What's the best way to fix this?  I can rebase, but I know Linus hates
that.  What about git note?

--=20
Doug Ledford <dledford@redhat.com>
    GPG Key ID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D


--TUA61viMpBa7XXtcidqD7r9uIEiqlxBfi--

--s5MomclB62U2avEjfxK7qPpN2gTxgqbRJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJZqU1oAAoJELgmozMOVy/dw/8P/0ZHVAN/tGWUKpshmsfhpWi1
NcFiWh939loATLVAGf+vdfFR/SJnmWIbwPWywyzndeg0oMDHgkO9rj750IleZjyy
WH4guFHsOtqKbWuu0LcWsOvbIb2rc640Qm/LZa1efJLhStQvSc6LttG25GSU618c
fysn6Bmrl2NuscP8onNHBdiFdypGqzMwzYXuataXcj/ANvlBIudqTh1uOIYd56V+
A+wAdvdQA4ExeTPk/ciSItJu8IE3YxNtEI+tRaHin3iq7W1V6Mwg3kV12A23uamI
U3ejpv7Ue/rIjUSNEYYYm3UF71OcehwQu/7yHZnWsP4/RI7l/YV2glOxxEcvg8Zy
66xiQ7Aiwphuvy/xoZ1udh6PBQvfsI5ntyIRzHasE8fzRRLmH53oA/+XhiFL41Ed
3Nh7ckGG4iZlkH0o3/IQRwKKhAzA7A7Hf4wGzTCZPn2DddXI6/rR1oE2/ixKcDx8
AeUlfWAvYoeyAZhvy7qqfJqi2TbqbmJq6Fq5FuV4bjnhUwwv0uCfZaFGyxXGj/Dz
K3JXWzI6yreXLRGz2KI5nMw+HehZx2jyKMLWLlN9pxTy2kuNX74Syh/3Th8Vfr3Z
zMabTByAM5JGfh+gydGz7ZRggVVZeHeMO6B+mwyj7e4akyy9QmpLAr61EbznX4L2
RLr/oEUIjHCN1w+IaTre
=6QYm
-----END PGP SIGNATURE-----

--s5MomclB62U2avEjfxK7qPpN2gTxgqbRJ--
