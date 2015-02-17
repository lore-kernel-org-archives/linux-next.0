From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Feb 17 (mips build failures)
Date: Wed, 18 Feb 2015 07:37:40 +1100
Message-ID: <20150218073740.71da0354@canb.auug.org.au>
References: <20150217160221.1a15340e@canb.auug.org.au>
	<20150217172036.GA29820@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SNnpl9BavBq9e6=K1LZCM63"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150217172036.GA29820@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
List-Id: linux-next.vger.kernel.org

--Sig_/SNnpl9BavBq9e6=K1LZCM63
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

[Add Ralf to cc]

On Tue, 17 Feb 2015 09:20:36 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> Build results:
> 	total: 121 pass: 109 fail: 12
> Failed builds:
> 	mips:defconfig
> 	mips:allmodconfig
> 	mips:bcm47xx_defconfig
> 	mips:bcm63xx_defconfig
> 	mips:nlm_xlp_defconfig
> 	mips:ath79_defconfig
> 	mips:ar7_defconfig
> 	mips:fuloong2e_defconfig
> 	mips:e55_defconfig
> 	mips:cavium_octeon_defconfig
> 	mips:malta_defconfig
> 	sparc64:allmodconfig
>=20
> mips builds are all failing with
>=20
> Building mips:defconfig ... failed
> --------------
> Error log:
> arch/mips/kernel/genex.S: Assembler messages:
> arch/mips/kernel/genex.S:128: Error: Bad value (mips64r6) for internal use
> arch/mips/kernel/genex.S:128: Error: unknown ISA level 64r6
>=20
> This was introduced by commit 0bf705e94771800 ("MIPS: kernel: genex: Set
> correct ISA level") which apparently assumes that only mips64r6 is a valid
> ISA level, though it is obviously not supported on older compilers. This
> is on top of the other mips r6 related build errors seen yesterday.
>=20
> I really hope that this is not 3.20 material, given the lack of testing
> with architectures other than mips r6 or with older compilers.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/SNnpl9BavBq9e6=K1LZCM63
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU46aZAAoJEMDTa8Ir7ZwVFSEP/jUaS2J4JZ6ONRQPnkUHr2Js
+om8iaonAd0NGrA8A3f1vNFTwEhqG+yD+6HU4qsK5mPO/y8Lv489vCI3OLN21sp9
knQoozcuYd2bXAbfl9rJgeHXtkShqiDT/YlOZy3eokXQTT7gI3Jk7XiYUJJkeR4F
tc9o6mfY3mI31hwWqr4I01dXoohz8+aKCQl0xrTzINPs25ER3xX8G01XbxL+/6bo
XTFaEV2nXR3n+e4eY+RlkSYw5MWWRJvta7kS/G9gpCui3/qXzodqeBPczhnwGuTA
YYYA/VHNVOAOoqJ/w6usLRCOVTSevI6PA6BZvN/m5HKoiACXSF55hqgE+NkXw0fK
W9WeB4/jhKQwlBofGUy46r2LnjUUbd10SpOjt7sCCCVSiMiFhD2oQZZt1qQGWadZ
OuUnt4vLmtaVAIYWMtATuMzWwslGkGu0S3tUZjz6ZxAnZKla1xsgHC6C4xYfSaOd
Nos6K5+hmY3jwBVPxdZ8yEZ8/H7bd7AEM24GTLCvB1wGnEoZdHD8brd/nn6A3AxX
aN91MNSzOqBvm3FWzpb09MgSdHc5Orn0o12Ppty2WgokAFsh4K0gPmLmPM2WfKSX
xXGyiOkC+75R6dqyfvDpdsU+D7yNTmeaxFqSZLT0yM/RgE0pI6qBztYdQjNpbin8
2rtU48gzJCnQS81klQRk
=poWi
-----END PGP SIGNATURE-----

--Sig_/SNnpl9BavBq9e6=K1LZCM63--
