From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Lunus' tree
Date: Tue, 24 May 2011 13:41:29 +1000
Message-ID: <20110524134129.8da27016.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_May_2011_13_41_29_+1000_+WiRM2v/H2dMuNO0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47390 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757011Ab1EXDlt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 May 2011 23:41:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mandeep Singh Baines <msb@chromium.org>, Ingo Molnar <mingo@elte.hu>

--Signature=_Tue__24_May_2011_13_41_29_+1000_+WiRM2v/H2dMuNO0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (sparc64 defconfig)
produced this warning:

kernel/watchdog.c:102: warning: function declaration isn't a prototype

Introduced by commit 4eec42f39204 ("watchdog: Change the default timeout
and configure nmi watchdog period based").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_May_2011_13_41_29_+1000_+WiRM2v/H2dMuNO0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN2yjpAAoJEDMEi1NhKgbs0dsH/31Yti5QbaWV4PlYrLgnY58g
b/siwNKbfMv9SPUCOAKxVMcqcveMiBGLJJswlWp5WBJ6mM4blgnjDb26G7egjcoj
U8Uo9xRXdtpSUZ+Ku2fWeuDuoNFCBuaFea2Wty16eQxYz0CE3w2ljEA29AvVZ91D
8LCNAXSfLgh4p50kxtnicIZN8ana54DVyOWL7LYEmI0X7MpkMDnntmrbvuzJzEdh
sAa6g78T1AkzdHW7ZB33Jdzi57QElWOo7103ODyMyFdx/Vk5wCz3h9jes8W4QBhW
ntsedyAJ9Mrd+Xwx+m2fF7BLvVA9tkdmDjikD0dsWkIYEVBeuEwbZr9PsCsEU9Y=
=gYJZ
-----END PGP SIGNATURE-----

--Signature=_Tue__24_May_2011_13_41_29_+1000_+WiRM2v/H2dMuNO0--
