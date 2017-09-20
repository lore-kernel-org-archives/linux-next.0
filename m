From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: error while fetching the microblaze tree
Date: Wed, 20 Sep 2017 07:36:49 +0200
Message-ID: <ef16f2a8-67f9-207b-6c95-0735767a4a74@monstr.eu>
References: <20160107093856.779af583@canb.auug.org.au>
 <20170920092600.716baffd@canb.auug.org.au>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="u6gU6vFuN17PEx5pPppl6bHfafbLwGrFg"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170920092600.716baffd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--u6gU6vFuN17PEx5pPppl6bHfafbLwGrFg
Content-Type: multipart/mixed; boundary="egqG52RQgqhu1i884mXjrGLWcQGWPin3F";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <ef16f2a8-67f9-207b-6c95-0735767a4a74@monstr.eu>
Subject: Re: linux-next: error while fetching the microblaze tree
References: <20160107093856.779af583@canb.auug.org.au>
 <20170920092600.716baffd@canb.auug.org.au>
In-Reply-To: <20170920092600.716baffd@canb.auug.org.au>

--egqG52RQgqhu1i884mXjrGLWcQGWPin3F
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On 20.9.2017 01:26, Stephen Rothwell wrote:
> Hi Michal,
>=20
> On Thu, 7 Jan 2016 09:38:56 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
>>
>> Fetching the microblaze tree
>> (git://git.monstr.eu/linux-2.6-microblaze.git#next) produces this erro=
r.
>>
>> fatal: read error: Connection reset by peer
>>
>> I will use the previously fetched version for today.
>=20
> I have been unable to fetch the microblaze tree again for the past few
> days.  This time it is is getting:
>=20
> git.monstr.eu[0: 195.88.143.27]: errno=3DConnection refused
>=20

Thanks for letting me know. I have contacted admin to look at it.
Will let you know when it is recover.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--egqG52RQgqhu1i884mXjrGLWcQGWPin3F--

--u6gU6vFuN17PEx5pPppl6bHfafbLwGrFg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlnB/nUACgkQykllyylKDCFe4QCdFrGiq5mt3x/NPJKrF/eqIGW9
TtcAniSRmhfiWffIcESazEVYugGD04Wr
=hxLm
-----END PGP SIGNATURE-----

--u6gU6vFuN17PEx5pPppl6bHfafbLwGrFg--
