From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: add_taint() change left s390 alone
Date: Wed, 20 Mar 2013 20:08:19 +1100
Message-ID: <20130320200819.7ebe1f2c5a9fe73e3f024e2b@canb.auug.org.au>
References: <20130320083844.GA11977@osiris>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__20_Mar_2013_20_08_19_+1100_eeyG28uJ6LJG4jG4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:50125 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381Ab3CTJIa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 05:08:30 -0400
In-Reply-To: <20130320083844.GA11977@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org

--Signature=_Wed__20_Mar_2013_20_08_19_+1100_eeyG28uJ6LJG4jG4
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heilo,

On Wed, 20 Mar 2013 09:38:44 +0100 Heiko Carstens <heiko.carstens@de.ibm.co=
m> wrote:
>
> your commit "taint: add explicit flag to show whether lock dep is still O=
K."
> missed to change the s390 invocation of add_taint():
>=20
>   CC      arch/s390/kernel/dumpstack.o
> arch/s390/kernel/dumpstack.c: In function =E2=80=98die=E2=80=99:
> arch/s390/kernel/dumpstack.c:228:2: error: too few arguments to function =
=E2=80=98add_taint=E2=80=99
>=20
> Could be that this is a merge issue since dumpstack.c is a new file which
> contains stuff that was formerly in arch/s390/kernel/traps.c

The commit (9ff3d92a818e "s390/dumpstack: fix call chain walking" in
today's version of the s390 tree) that adds dumpstack.c has add_taint()
with 2 arguments removed from traps.c and add_taint() with one argument
added to dumpstack.c ... and add_taint() already has 2 arguments in that
tree ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__20_Mar_2013_20_08_19_+1100_eeyG28uJ6LJG4jG4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRSXyDAAoJEECxmPOUX5FEt9sP/3RyT6bo2JNz6ktbORgYsgX6
6qxq+wrZHdX86Q9lwuSvx2apcfGM1o1yEaGvzv7TiNPjdhciav/fthD9rGx577iq
7/+xWpjKDHOwGE8KGVK23YH5gWj7f08TQANc6k/m4yGs4JfJk2jbeOxs+x7NrCiB
KuSy4wbY7CElZ8L2Jt/NRzGeuAPvY5RAQuxt8Dc3yiJvesuTAc5rIf3+I1CeBnZV
ng7vy4E35FR4+WOVlfaJJLvcM1Fuyc0abXTgIaHEaU7NjL7n8eh7Z0ZPuriNh6rW
KlvUHIX92ooNdPK9XwXLrnaVPareLBgKXzUGRuRojAP4lVoHspJg7RWLU8s1PyeP
72k0BOXzg64MLw7HBpkmhv4a0UyS17A0ql8EbmQi/fdBdCQUcScK75Un2gP2JcPS
EX1X4kjq1oWUmCrEIJaK9nlRnwr1l4K/MFs+rQFQDz6yJMutFIoYRl+Lq7V6WMMp
HVFdXUuLA0nzrxGqScTkaX8eZjA5pQhbqdPz89fcdxEHm3HHjKBkk9g2ZgLEqBqw
a/XzEW3Wlgtnbl6hKGNUZ0fLEBdesf4fyq9hs+8jZlY61Q1zbTgq4Gd3n6FxPwl7
kHQ12tmKUiV6PzG233F1SRsow7fMuHIEcGeB1btvPsp+QLOYmrWC2dEUsqAF/Dl1
KGoMMBmJKVaj0DIuWfSn
=RkAM
-----END PGP SIGNATURE-----

--Signature=_Wed__20_Mar_2013_20_08_19_+1100_eeyG28uJ6LJG4jG4--
