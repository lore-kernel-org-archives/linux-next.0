From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the imx-mxs tree
Date: Fri, 29 May 2015 21:28:59 +1000
Message-ID: <20150529212859.0acb08e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.FBWVoRDs3GNdNeV.yrryB3"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40544 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755887AbbE2L3I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 07:29:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/.FBWVoRDs3GNdNeV.yrryB3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

After merging the imx-mxs tree, today's linux-next build (powerpc
allyesconfig) failed like this:


drivers/clocksource/timer-imx-gpt.c:37:27: fatal error: asm/mach/time.h: No=
 such file or directory
 #include <asm/mach/time.h>
                           ^

Caused by commit 77b0235b6b5c ("ARM: imx: move timer driver into
drivers/clocksource").

I have marked it as BROKEN for now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 May 2015 21:24:03 +1000
Subject: [PATCH] ARM: imx: mark CLKSRC_IMX_GPT as BROKEN for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/clocksource/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 3c15a49fdac9..d8fedc925864 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -279,6 +279,7 @@ config CLKSRC_PXA
 config CLKSRC_IMX_GPT
 	bool "Clocksource using i.MX GPT" if COMPILE_TEST
 	depends on OF
+	depends on BROKEN
 	select CLKSRC_MMIO
=20
 config H8300_TMR16
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/.FBWVoRDs3GNdNeV.yrryB3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVaE2CAAoJEMDTa8Ir7ZwVTyQQAIUt3i9Z81IbH7NmJ2P7raxW
kdbEXAUjkROls/abWXEUFWsMqBZMsozAjp79+8KeRrKcovA1HeKc35VGtxR+V/v8
F8LrP5lgTKmeDZzmn7FBg5o6KOZ4v+7SqSi/20vBfUMaEVAj9r/IPUkx4RMgeIng
Ytozj4xo5yU/CZF1ByX89/vbxPKNW9bdxIFXjq1Y0ySDKVAjFh23d3hVXKRs/2l0
xBWMyC/pyz4BZVBRWVPAEy6fB64iWcj7A3xQ0pZ9V8ECJ1PsD+/XYfICNzg25Rs4
VA1kUv+68LN9m+2u0nk7cLZdrXImnremp2TZUVwkf4ZBqBJdRkT+4JIOWO+x1Jvs
7SnLf8lMoc9kFYwqKTlCLhFS+MRYi6O/EPpkEPaCvou13kfzjps02GErFzpfn0SN
oKBjmvWIMvyBg0Ce8cwpOLRs5RtGLc7udG8rB3igsr/LM1Ux20st+46XsHzzbAJB
MsmuPLFjo+fHIbcz83pFAz3hZAXURuH61iy8bUQW+v7bwDV6gzA28rv50jaGzD/A
Mu75VtpISX2iO9Iexd/s0KvH1DfspjatNWdnkZbBv060niQSp/KD1MuG8J/Ubd3v
zh6mSXvj2ejyVEUs2DnpLoXHtfgUG2tlRFPkelxXQr3K0QBW2qhTF03aovhbamzw
Gwaurd/0lQ/zdrR88bfF
=8Nyy
-----END PGP SIGNATURE-----

--Sig_/.FBWVoRDs3GNdNeV.yrryB3--
