From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the clk tree
Date: Wed, 6 May 2015 14:05:43 +1000
Message-ID: <20150506140543.426ed29b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0F34lorOVB_YTqoBBW_yn9u"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54102 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751092AbbEFEFw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2015 00:05:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/0F34lorOVB_YTqoBBW_yn9u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/clk/clk.c:2231:13: warning: 'clk_is_orphan' defined but not used [-=
Wunused-function]
 static bool clk_is_orphan(const struct clk *clk)
             ^

Introduced by commit ece3ffbe1b7b ("clk: prevent orphan clocks from
being used").

CONFIG_OF is not set for this build ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/0F34lorOVB_YTqoBBW_yn9u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSZMfAAoJEMDTa8Ir7ZwVsMEP/Aj8t3/iAliRYq6ne8ReawPQ
/Jbaa3dsdxp0N9OBQE0amPKbh6b1yckK2F4wHFdiB8EfRAB4pVBYQ8wU1PovCk+n
UcM9F0g3JJ1pWoLvDtwDRU37TDKhK1t/iJHUVX8vdCMIZKV2Ads7JSFDA9TdUXXz
Pro37k1HjIRnZ/XOZP+hzmAq+XdlAEVUPV3WsKuKi7gukltaOUI3dTnS0oAxnTER
CapUUT5rsHnYRMrTWIqkDRo6PNTtvipODSClEsu3aThXsX9VVtYFQFF+9QtVr72y
ldnX61Tn5AiqODZmaPKQzOftH2VwsQa2wPM1Ag44r+QzPXWLoBrOtLC9X/hEt5El
c4CNmR/azp3kN3ic7v7NDoG0Nfb3anpKasCOXnlrxMkcpHH8xJ02J20H/yJ22eQU
rMSozTbgbnU2InLQ3amB2vH9/k57h3RBhLIhgzchTKJmBwJDhs07hn+3iGngXg7k
BeQ1PRciVeFF4MTTKNidMDPZMA6T2G66wSlAL5hGp+aiIUhFKt4cYDv1GyJLHi11
y7ewbE0nZqhGtDvKGUIr6i6WuV4aAUkO4M+cLpDMJM78oMxoDK9tE467BG5NAINX
7tFNbviMCX+ndB+fUUjzbAYPYOAGzaUpxanMnFJWyp0xpD+vYKyYVcdrCm4wKbtT
9E/tTb18v/6BgB58Hz3K
=xgNY
-----END PGP SIGNATURE-----

--Sig_/0F34lorOVB_YTqoBBW_yn9u--
