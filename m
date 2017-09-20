From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: error while fetching the microblaze tree
Date: Wed, 20 Sep 2017 15:09:30 +0200
Message-ID: <4bdc1802-8cc8-c934-46bc-71692278d953@monstr.eu>
References: <20160107093856.779af583@canb.auug.org.au>
 <20170920092600.716baffd@canb.auug.org.au>
 <ef16f2a8-67f9-207b-6c95-0735767a4a74@monstr.eu>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Q4jvTK57M6ectgWqiK5hFhSQM2XtxopqL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:56634 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751590AbdITNJi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Sep 2017 09:09:38 -0400
Received: by mail-wr0-f179.google.com with SMTP id r74so2108066wrb.13
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2017 06:09:37 -0700 (PDT)
In-Reply-To: <ef16f2a8-67f9-207b-6c95-0735767a4a74@monstr.eu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q4jvTK57M6ectgWqiK5hFhSQM2XtxopqL
Content-Type: multipart/mixed; boundary="EKuV6Xu0fqN986DEiLRCq0osOFUX7RbC3";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <4bdc1802-8cc8-c934-46bc-71692278d953@monstr.eu>
Subject: Re: linux-next: error while fetching the microblaze tree
References: <20160107093856.779af583@canb.auug.org.au>
 <20170920092600.716baffd@canb.auug.org.au>
 <ef16f2a8-67f9-207b-6c95-0735767a4a74@monstr.eu>
In-Reply-To: <ef16f2a8-67f9-207b-6c95-0735767a4a74@monstr.eu>

--EKuV6Xu0fqN986DEiLRCq0osOFUX7RbC3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 20.9.2017 07:36, Michal Simek wrote:
> Hi Stephen,
>=20
> On 20.9.2017 01:26, Stephen Rothwell wrote:
>> Hi Michal,
>>
>> On Thu, 7 Jan 2016 09:38:56 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>>
>>> Fetching the microblaze tree
>>> (git://git.monstr.eu/linux-2.6-microblaze.git#next) produces this err=
or.
>>>
>>> fatal: read error: Connection reset by peer
>>>
>>> I will use the previously fetched version for today.
>>
>> I have been unable to fetch the microblaze tree again for the past few=

>> days.  This time it is is getting:
>>
>> git.monstr.eu[0: 195.88.143.27]: errno=3DConnection refused
>>
>=20
> Thanks for letting me know. I have contacted admin to look at it.
> Will let you know when it is recover.

Fixed now. Please try and let me know if there is any issue.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--EKuV6Xu0fqN986DEiLRCq0osOFUX7RbC3--

--Q4jvTK57M6ectgWqiK5hFhSQM2XtxopqL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlnCaIoACgkQykllyylKDCGAGgCfRVZ6fujZDYTDqQGmNB6iCWM2
XJ0AoJaaaZPDF6MTjyJjZVwJdQkpd+rJ
=5+tB
-----END PGP SIGNATURE-----

--Q4jvTK57M6ectgWqiK5hFhSQM2XtxopqL--
