From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Fri, 27 Jun 2008 13:14:51 +1000
Message-ID: <20080627131451.3c85d6f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Jun_2008_13_14_51_+1000_VTO4ISb99RJH6aXV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41094 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751040AbYF0DPH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 23:15:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__27_Jun_2008_13_14_51_+1000_VTO4ISb99RJH6aXV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
Documentation/kernel-parameters.txt between commits
2366d29ac4521f48150ec5d6d5242a583a8a2ec1 ("ACPI: Create "idle=3Dhalt" boot
parameter") and 2fa517a2fa9ade5c4f41b6334fa8a20d7f1f8dd0 ("ACPI : Create
"idle=3Dnomwait" bootparam") from the x86 tree and commits
4c8a298d35db029da3d6c9e1a0ed5acbf1764743 ("ACPI: Create "idle=3Dhalt" boot
parameter") and ce4bd94fad0fa934c0de1ba1932e7e61bc142176 ("ACPI : Create
"idle=3Dnomwait" bootparam") from the acpi tree.

Same patches with slightly different white space ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Jun_2008_13_14_51_+1000_VTO4ISb99RJH6aXV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhkWysACgkQTgG2atn1QN/90wCfTec69ASK0g5VGhBcEXTkfqw4
5j0Anj0iRHm+1jKukWhWfa98SR9P5Wnv
=wrB+
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Jun_2008_13_14_51_+1000_VTO4ISb99RJH6aXV--
