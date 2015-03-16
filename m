From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: randconfig build error with next-20150316, in
 samples/kdbus/kdbus-workers
Date: Tue, 17 Mar 2015 09:28:12 +1100
Message-ID: <20150317092812.58da11cb@canb.auug.org.au>
References: <CA+r1ZhgsXRTBzHicQ3H_DUGt7dioZa+GjpWepHvemGR=UzJymg@mail.gmail.com>
	<CANq1E4Rc+Bp0mb=VxiV7Qgb1Wbz=TUExU4NwUcCsu9_DnC9pRw@mail.gmail.com>
	<1426540369.20069.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MxP3Gxo5OrrLz//V1fDVWbJ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45118 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932185AbbCPW2T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2015 18:28:19 -0400
In-Reply-To: <1426540369.20069.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: David Herrmann <dh.herrmann@gmail.com>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>

--Sig_/MxP3Gxo5OrrLz//V1fDVWbJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, 17 Mar 2015 08:12:49 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> But the samples are also including the unsanitised headers, which I think=
 is
> what's causing the problem here.
>=20
> HOSTCFLAGS_kdbus-workers.o +=3D           \
>          -I$(objtree)/usr/include/       \
>          -I$(objtree)/include/uapi/

There is a new patch in the kdbus tree today that removes the uapi
include.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/MxP3Gxo5OrrLz//V1fDVWbJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVB1kBAAoJEMDTa8Ir7ZwVY+QP/1GxpEwGxKfsahc4FMfshv5r
G/aXxKtjtldIbDhLh2ZL78X7iI64jfsgldGxpH9q+bE/f4FFCf9TZpaoo2BelNd3
1Fqdy4UFVAswaQrvm9shrJLLrUJkPd4grKvmrPI+Zo0lon06e/gJLfkMbixydsOq
iG+R4A0PjfPLNwWVHVKlQle9j7ZWkpjZRHaww/785LqcBKd39eOfr5dKiozY+Wf+
ivsNBNHKeTCu527S6TljvFdnPqpRMJE/WrHZt1ZMKKffByu6ajjER2rrQpiKXjQD
xi297Eo7xvgUDJJpCL16Lj7Y0U3u/nvuXxacwSaTkd6j9aFny69wyF2zQSoq4lrG
iB0u2lkgVVZlSQ1F4DDIo3EzgJDaWXt4zgaHrDUG5+7gC+he+h3ZYVOSl/kbFF3h
anIhtRqmhl3lM3vcEfA7unfOtXqE7t0zhEB3FNWDL4prNCciQxkfLq+Ds05TCqhL
9F2W8VT99fp97RsKHFyY7LY3R9vthW2LMjblyT2ycnBtlaOUZsz+yN76isu96ycT
k4xyb49qEdUULX2ndWyxZ0yNfQNE4CVPIoclTTuq5+SJ4TH8cbSS32SJTl9WfdHt
j69WasHV6h+GpQieie0gO/qC7+auz8roPbyGmioG1H0sAKJBrIb4F9I+yZpH0SL9
ccA4KyDcAa3AJbp+NKS8
=f9A+
-----END PGP SIGNATURE-----

--Sig_/MxP3Gxo5OrrLz//V1fDVWbJ--
