From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failing to fetch the sysctl tree
Date: Mon, 7 Nov 2011 09:58:35 +1100
Message-ID: <20111107095835.208466a386fbcf046c512d70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__7_Nov_2011_09_58_35_+1100_GdyoBaBhjzk.e0F1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:50473 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753052Ab1KFW6s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 6 Nov 2011 17:58:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__7_Nov_2011_09_58_35_+1100_GdyoBaBhjzk.e0F1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Fetching the sysctl tree produces this error:

fatal: Couldn't find remote ref refs/heads/master

And indeed the sysctl tree on git.kernel.org is completely empty (i.e.
there are no commits).  Maybe you should remove it and recreate it as a
fork of Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Nov_2011_09_58_35_+1100_GdyoBaBhjzk.e0F1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOtxEbAAoJEECxmPOUX5FEEUMP+wYNrIwLpmEBAIUwf7g2Mar/
T6PaurTS7aPNqWYEGVY2HukVoPhDhze/sSHz5Qc63m87WT3ErDs7wovNYiRmnsy2
yEHy14rTx2NcdQ4RNl7KhrjfpwOCj2iF8AzcOYEBPbVF198vxXszvfecsPE50FBn
l4Le+XYXHvdnjUDeoUBs8h8AQSiTcJBTfjkaZ3M+UrrZvfUaCn6pXcTapB+s7ua4
a78+x7A0NCjh9T3W1FjnF+tPLiQN443w4FVMfd0N6PZGfb+qnbp3dAtsImpIyed5
MWflbPXFS9PuarJ2PBePI8TlWpU/WS1x3MfCpFSO8dPNn+4/fuvg+7resXMiSO1m
z8+CvCVq7KR6ffbqUh8gnkjWBrw7QSMf7VTEYhQoQ6pKHFm55+XdS4ywBtwoegnh
n34BieyqRFINzrnnAJKBP82mwx8zKbkJYgEUmebDZZ5YP4GeEPpDraIJl8TNiz7r
2BMMJWiY1TfL/7BSyQVt4JukOceq6LHHK8VOLUjvSjzC4NEphSKCXEL1faJaDvcB
CI7RwvHghr3zeusTZK1ugMXupLyMteW60TpXeH8mAs6JFLpjKTqEEW/+BxmVTB5c
9TKgZiDRiX/hiTUUOeHhevMjkb1g6Qm779/A09HvnF7XFOBy7RHJJifPe21IBVbY
H2vdqqB1RZKKn/doSiIg
=3Sbl
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Nov_2011_09_58_35_+1100_GdyoBaBhjzk.e0F1--
