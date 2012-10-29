From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 29 Oct 2012 11:48:48 +1100
Message-ID: <20121029114848.cf0297e997cbfc9c2198fa5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__29_Oct_2012_11_48_48_+1100_Loe3G6Slgi1q7An6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:49252 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754273Ab2J2As6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Oct 2012 20:48:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__29_Oct_2012_11_48_48_+1100_Loe3G6Slgi1q7An6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

make[4]: *** No rule to make target `sound/soc/codecs/snd-soc-wm-adsp.c', n=
eeded by `sound/soc/codecs/snd-soc-wm-adsp.o'.  Stop.

Caused by commit 2882fcb3cfe6 ("ASoC: adsp: Add ADSP base support").
Please build test this stuff - there is a typo in the Makefile.  :-(

I have used the sound-asoc tree from next-20121026 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__29_Oct_2012_11_48_48_+1100_Loe3G6Slgi1q7An6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQjdJwAAoJEECxmPOUX5FEPr4QAI7oqASQYRLUkTatIXUW3dDR
AWslpZKwW9b8elOVdNMo5J2lPKb3c4hsRPg+dNsvv6VHFFaBJq19B5+9wQnZW1Ad
ZZwOEv+ka217SdFleaNDEgJW51Ka+ESBAaFkCoynzaOfICmdSue3YlgEvl5NSoBM
XhGN3eqFIIyaOFd/SxJh7wq5LwbtyxtZDoU7lzsHt37Ebki6a+mPk5gY/jYP9sts
C4DKJVYk+yw4Yi72I+2Or9nPqXVJeysX4WogLgU5eiroVoE6e44sRfMZ5OVbg7cG
ciULFG1jTCb2A8s5ThGoa+1VONzCZ/5xEh74C09tobQGUrtirEcXchHezTX570dF
qRWUpiJF2pRoaO+W4X6eySRMW4XcDy/n+7OkBd61XQfpxAApxSnDtZH2JLCnr2RH
u2eBkYx2uPCnPf/nRsifN5l6WRPdDjDX+SneYFhP5FO7a4xa/A8Sp/g7kohYc9Eo
BvNAI1DuL+BD2kTUGiHWnXXBxw0Sy+F2cGXxz5UYE59MIffUIopy8qa6VgWQieF8
g18ds/3Kg1wmnJPHjkB1pTsf3QPoxhJNRRlQBmJfg+EED9fFC3GgwTAvZ3FbdNfN
KWSZBed0qrXs0WwWp6L5fmrq31Q1Sa4xCQ6g6loVSLMmEFK6/TlvHjY5UBDM6oFp
4GVa9A7Ht0xQuP35vflO
=+Xnc
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Oct_2012_11_48_48_+1100_Loe3G6Slgi1q7An6--
