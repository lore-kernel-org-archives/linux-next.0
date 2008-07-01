From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 23:43:27 +1000
Message-ID: <20080701234327.a0cb658d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_23_43_27_+1000_a.FbgnJI9FvsvrG3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39126 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751727AbYGANng (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 09:43:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__1_Jul_2008_23_43_27_+1000_a.FbgnJI9FvsvrG3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/ti_usb_3410_5052.c between commit
01f845d09b8fdcdd27ee592422567b8dfa5b14d5 ("ti_usb_3410_5052: use
request_firmware()") from the firmware tree and commits
ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") and
b002e3f7c9249ddfd1d166cdb76cf7dde8dd93a2 ("62-tty-tidy-usb-ti-usb") from
the ttydev tree.

I fixed it up as best I could.  Definitely worth a look to see if I got
it right.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_23_43_27_+1000_a.FbgnJI9FvsvrG3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqNH8ACgkQjjKRsyhoI8w3ZgCdF6cygnzWjXSw6M/1vFnNlAIU
+roAoItYRjS9v8HW5RfcCiPzM7AiG8ar
=pqdz
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_23_43_27_+1000_a.FbgnJI9FvsvrG3--
