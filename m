Return-Path: <SRS0=jfJ0=WB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063D2C0650F
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 11:33:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF6D220856
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 11:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="um1Tm9Yb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHELda (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Aug 2019 07:33:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727328AbfHELda (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Aug 2019 07:33:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 462FyG4KYmz9sBF;
        Mon,  5 Aug 2019 21:33:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565004807;
        bh=nrZocQVgJSzrfhfQ4qiyK4vrbzVWXPqCGukNO7lwe1E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=um1Tm9Yby68cHI7DKwi8Tthv/IxY6Pzno+RpGowYJieIjjVvHQjYUhj+yn7nhO6Kh
         +xOm9+ovSvRlDUsilo3PV9t1AZDxEhYr+ZduOyzupuQMitpRULpdJbJTjZpN2eDprM
         EhHJ68FSFReNs2ROOvu6qwTmdimvAsk+cZb3gk0mWABt1A46sSX2hpOY7EPgb0kOCZ
         4wz4/aSuueNbKyP3p89mJHUX5PgfIYx4LoKWfP/8w11OdTSeTDfv/Lod01W/HRumtg
         Jvvx35lDAWEYq+PEM0JvJcYf5++EHlZyxo8eyRxmo9r0qFA9TihU56iMlUDdlQxGO/
         zg8iHVzP8XNEw==
Date:   Mon, 5 Aug 2019 21:32:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-next@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
Message-ID: <20190805213247.29ae4af9@canb.auug.org.au>
In-Reply-To: <5d47f990.1c69fb81.35920.c607@mx.google.com>
References: <5d47f990.1c69fb81.35920.c607@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0UPVpuZcDamAGbkVV.VOjxT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0UPVpuZcDamAGbkVV.VOjxT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 05 Aug 2019 02:40:32 -0700 (PDT) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
> next/master build: 230 builds: 5 failed, 225 passed, 6 errors, 1344 warni=
ngs (next-20190805)
>=20
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/=
next-20190805/

> cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings=
, 0 section mismatches
>=20
> Errors:
>     include/linux/page-flags-layout.h:95:2: error: #error "Not enough bit=
s in page flags"
>=20
> fuloong2e_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 =
section mismatches
>=20
> Errors:
>     include/linux/page-flags-layout.h:95:2: error: #error "Not enough bit=
s in page flags"
>=20
> lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 s=
ection mismatches
>=20
> Errors:
>     include/linux/page-flags-layout.h:95:2: error: #error "Not enough bit=
s in page flags"
>=20
> loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 =
section mismatches
>=20
> Errors:
>     include/linux/page-flags-layout.h:95:2: error: #error "Not enough bit=
s in page flags"
>=20
> For more info write to <info@kernelci.org>

The only commit I can come up with is

  ee38d94a0ad8 ("page flags: prioritize kasan bits over last-cpuid")

Which has gone into v5.5-rc3.
--=20
Cheers,
Stephen Rothwell

--Sig_/0UPVpuZcDamAGbkVV.VOjxT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1IE98ACgkQAVBC80lX
0GyakAf/VMOmAqtkrIix+JYzkrJ5zzJcVCoM47LUeiQbkr/CqHnSdbYBAcp8gHuY
H/PWL3Wxj2y6s55Ovwyl4npNpv4o0ini6AzXFg1Zya0+EwqDtY3rqgGUMdoWbGhi
2GuL9/U/pST8hqUvLG64CGa72FxwKQOtWhYA0FDmE6AFYeX2PgOcCDyIWJw4fhB7
wDdsUokR2GFKwQGx0UrdtW8EBrhqBrJ+4IPvOLSvxVYjJ4YDKoZcv5PqwvFDxRLk
Kp9gtU17InHb2BkhN0xDxZz92/cTME9F8XztZrq5WeWeKtSRUo9tSy0f8UwbSHWo
XZGr1HqkJns2IUnOnIm68Rc487xibQ==
=QxR0
-----END PGP SIGNATURE-----

--Sig_/0UPVpuZcDamAGbkVV.VOjxT--
