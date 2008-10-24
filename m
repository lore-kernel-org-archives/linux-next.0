From: Andres Freund <andres@anarazel.de>
Subject: Re: Current suspend issues on Lenovo X200
Date: Fri, 24 Oct 2008 16:28:18 +0200
Message-ID: <200810241628.23002.andres@anarazel.de>
References: <20081023204326.GB4175@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3172384.ypnD5ZmNPS";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755494AbYJXO2g@vger.kernel.org>
In-Reply-To: <20081023204326.GB4175@denkbrett.schottelius.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--nextPart3172384.ypnD5ZmNPS
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Nico,

On Thursday 23 October 2008 22:43:26 Nico -telmich- Schottelius wrote:
>  - 2.6.27-next-20081023:
>    -> no X running (because xorg does not work with that kernel)
I think what you need is one rather short fix for the intel xorg driver:

diff --git a/src/i830_driver.c b/src/i830_driver.c
index c1d61f4..eaf5d27 100644
--- a/src/i830_driver.c
+++ b/src/i830_driver.c
@@ -502,8 +502,8 @@ I830DetectMemory(ScrnInfoPtr pScrn)
    range = gtt_size + 4;

    /* new 4 series hardware has seperate GTT stolen with GFX stolen */
- if (IS_G4X(pI830))
- range = 0;
+ if (IS_G4X(pI830) || IS_GM45(pI830))
+ range = 4;

    if (IS_I85X(pI830) || IS_I865G(pI830) || IS_I9XX(pI830)) {
       switch (gmch_ctrl & I855_GMCH_GMS_MASK) {

(Out of the "[git pull] agp patches for 2.6.28-rc1" thread)

Andres

--nextPart3172384.ypnD5ZmNPS
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkB24IACgkQporPraT14ij/UACfW3WyXkDO2thWGJ7eldq084UX
ObsAn1newQ5L2oy/WHI70LSB8pLQwrAT
=VqLG
-----END PGP SIGNATURE-----

--nextPart3172384.ypnD5ZmNPS--
