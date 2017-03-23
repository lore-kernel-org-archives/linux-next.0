From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: New pinctrl-samsung repo + fixes in my existing ones
Date: Thu, 23 Mar 2017 20:55:31 +0200
Message-ID: <20170323185531.5xpgzopemxqzu2es@kozik-lap>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="czghwxyvpetavvaf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35885 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932579AbdCWSzl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2017 14:55:41 -0400
Received: by mail-wm0-f68.google.com with SMTP id x124so1017962wmf.3
        for <linux-next@vger.kernel.org>; Thu, 23 Mar 2017 11:55:40 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kbuild@lists.01.org, fengguang.wu@intel.com, linux-next@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>


--czghwxyvpetavvaf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Could you add a new repo to 0-day build testing service:
	git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git

Details:
	Owners: Krzysztof Kozlowski <krzk@kernel.org>
		Sylwester Nawrocki <s.nawrocki@samsung.com>
	integration_testing_branches: for-next
	subsystems:
	- pinctrl
	- exynos

If possible, building coverage for all branches and also push build
notifications after every git push.

I am also the owner of these:
 - Samsung Exynos ARM maintainer tree:
	https://github.com/01org/lkp-tests/blob/master/repo/linux/krzk
 - My personal (work) tree:
	https://github.com/01org/lkp-tests/blob/master/repo/linux/krzk-github
Can you change my email address to krzk@kernel.org (my address
@samsung.com does not work anymore)?

Best regards,
Krzysztof


--czghwxyvpetavvaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY1BofAAoJEME3ZuaGi4PX86gP/jfPK+KYKcGvoPuGyYZ/N2Z+
v+SmKZspBeuZ6gv6lvFVrqtK56msO9U1+5GyyIloVWWTlTkVX3bc8m2aABg/Z1H6
h3mG6cA50OY4XYwt10yLheEmBEUK2ZsV1AqGrlIVdUHJKq+RB7Ql+q7i1QXyYbnA
c2h0i7O7U4xOzUOdV6PnAK/Yf1dZzeVGkP8fa9/59h68wB0m6JFJjrYemOzhm9KU
PvQDrzlv16YziI+2K9DnY9jYcy9aACT4egmAL5CH8HY/c1oHCfexSpaBo2L84VEe
hM8qeXfi7vzzSV89hNHxR9YNi/ThWaeZkcxprPFrl/Uf8HkPO6AAcnADRCk66TT2
UBRMajeWCLXWjTF4k2Wmd3UN4R2QtRWgSGb92NdK5Q9ZjXSvz2xnneMGVBaSthzN
EeJsMpHivMUglClnTnG25I9cuPkwn/2u12KcD9vF51ES4rDX7VSnMUmfCPSmvNiM
J271F9WmhI2Odkh/m0qrFv+ZmuokmS7A3JnyQHBPjY+LT4GLuZwNGGabpZSpSj6E
5jOoGWXvtEKenSJd4B0AKIRtQpe8JE7x83MFF3XOW1g19WKz9EdXaL30KYAxBw1o
yy02gncqgg+z0hmGPGcr3OGVGuLMVyvK8t7e4CjpPhcG7fenPBKEn1UIpBfbric6
bCchEcydwIckgPT8PGlB
=sOx1
-----END PGP SIGNATURE-----

--czghwxyvpetavvaf--
