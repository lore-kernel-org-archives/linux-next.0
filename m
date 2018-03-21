From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: Signed-off-bys missing for commit in the microblaze
 tree
Date: Wed, 21 Mar 2018 12:50:35 +0100
Message-ID: <31dbebc4-8889-85de-aa12-7dab4cc0494f@monstr.eu>
References: <20180321075251.49f3c1a3@canb.auug.org.au>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="pHdN8pa1OqTaeOabyfQTMvDtMFzoj6oi4"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321075251.49f3c1a3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pHdN8pa1OqTaeOabyfQTMvDtMFzoj6oi4
Content-Type: multipart/mixed; boundary="yskl06NdrmMUJpHyP1fgvyRXHe8refFJX";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <31dbebc4-8889-85de-aa12-7dab4cc0494f@monstr.eu>
Subject: Re: linux-next: Signed-off-bys missing for commit in the microblaze
 tree
References: <20180321075251.49f3c1a3@canb.auug.org.au>
In-Reply-To: <20180321075251.49f3c1a3@canb.auug.org.au>

--yskl06NdrmMUJpHyP1fgvyRXHe8refFJX
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On 20.3.2018 21:52, Stephen Rothwell wrote:
> Hi Michal,
>=20
> Commit
>=20
>   39a21eefea04 ("MICROBLAZE")
>=20
> is missing any Signed-off-bys.  In fact, it is a very strange commit
> message.
>=20

Thanks for reporting it. It was just my testing commit not it shouldn't
be there. I have fixed that just now. Interesting is that my local
branch showed that this commit is not there.
Anyway thank you so much for reporting.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--yskl06NdrmMUJpHyP1fgvyRXHe8refFJX--

--pHdN8pa1OqTaeOabyfQTMvDtMFzoj6oi4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlqyRw8ACgkQykllyylKDCEu3wCdEf6dvOJRS/+Svx2OjjK8HWsG
OlcAoIDQ6hyJe7mNLSDn2v4myuDAN0x3
=Ac5b
-----END PGP SIGNATURE-----

--pHdN8pa1OqTaeOabyfQTMvDtMFzoj6oi4--
