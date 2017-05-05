From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with the pci tree
Date: Thu, 4 May 2017 23:35:00 -0400
Message-ID: <5642d340-ae54-0f84-729f-59442201a513@redhat.com>
References: <20170505101910.3f1b0194@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1XGHcevr1pHgKHJekDAqwXjhTgsqnQ8Ur"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44336 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752377AbdEEDfW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 May 2017 23:35:22 -0400
In-Reply-To: <20170505101910.3f1b0194@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, "Michael J. Ruhl" <michael.j.ruhl@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1XGHcevr1pHgKHJekDAqwXjhTgsqnQ8Ur
Content-Type: multipart/mixed; boundary="CQAvuUlpunfJCltkg4201FohKLJR4VDXX";
 protected-headers="v1"
From: Doug Ledford <dledford@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Message-ID: <5642d340-ae54-0f84-729f-59442201a513@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with the pci tree
References: <20170505101910.3f1b0194@canb.auug.org.au>
In-Reply-To: <20170505101910.3f1b0194@canb.auug.org.au>

--CQAvuUlpunfJCltkg4201FohKLJR4VDXX
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 5/4/2017 8:19 PM, Stephen Rothwell wrote:
> Hi Doug,
>=20
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   drivers/infiniband/hw/hfi1/hfi.h
>=20
> between commit:
>=20
>   21c433a74b6b ("IB/hfi1: Use pcie_flr() instead of duplicating it")
>=20
> from the pci tree and commit:
>=20
>   f4cd87652919 ("IB/hfi1: Name function prototype parameters")
>=20
> from the rdma tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tre=
e
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularl=
y
> complex conflicts.
>=20

This is not unexpected entirely, only unexpected in that the PCI tree
hasn't been merged yet ;-).  The first commit was part of a series that
was mainly a PCI series that just touched hfi1, so it's entirely
understandable that it went through the PCI tree and something in my
tree might happen, as it were, to touch the same area.  Your fix was
fine and I'm sure Linus can sort the same thing out.  Thanks ;-)

--=20
Doug Ledford <dledford@redhat.com>
    GPG Key ID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D


--CQAvuUlpunfJCltkg4201FohKLJR4VDXX--

--1XGHcevr1pHgKHJekDAqwXjhTgsqnQ8Ur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJZC/LkAAoJELgmozMOVy/dVm4QAJe3vy4H2SE4PwqDBQxGuxf5
BF960lGIEg1sr7bDDRpUoblJDRVhNikqKZvjiZ50g+a8wQo/wLen1zRlCIpNjLO8
trmgFoH4YubMtTnMhgY+8xYixELrNGV5adk05l/0glMS7b8u5Xa0iD0GDjrFtP59
GHTuXM5p9Om933qh6AD2kDPa3I5/ayYWOKxupf740W+0kzcrBvP/+M2FOMgh7P4m
nGWEbq9t9Uw8EPZvsAnsWnO5x4y7rq/ORLtXhMSu73SUfNRKNGldCd0flKMC0wiu
crjBraC+1FeViFZW/HjFNwnlayc3RWxLMKs1m0TkC2ij1qAy7ymyrpSM3BT4wwjl
xykN6L94NEo3AE/pueg92EqJXNYQkC6PbXF9Rhn/5LOWI5kv8jMrnP8BHDHY+ROW
BGxtsM6IdKVl7ca/C6p9I/KOIDwmVJg+ZPgrQD36v3HOooExXnZybphV6YlCSr2t
iH3B8cbXCbQ/QbUTlgaq3dbm1Pd77WzXGOxX+MYI3zmZKWdvph0QnKJSoj9L+64N
ohme5AxtGMh2pEDhzuOFvPkkgpaoy1UEsJHCXiMwqxGLYHvWg2HWGFtRDxLpHMrR
wPIuXzbwPV1gClhfqTgoq/P2d7iSh9JgY+aD738MtErRJorICXvUlxhsK85VrTgM
jfK1E+mGZgnpg7EzUQ7c
=SNJ8
-----END PGP SIGNATURE-----

--1XGHcevr1pHgKHJekDAqwXjhTgsqnQ8Ur--
