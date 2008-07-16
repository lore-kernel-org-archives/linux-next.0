From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of ttydev tree
Date: Wed, 16 Jul 2008 20:15:32 +1000
Message-ID: <20080716201532.157c1736.sfr@canb.auug.org.au>
References: <20080711172804.a3ff6b3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_20_15_32_+1000_EVMyz0B7B3kKk3gl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41871 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752847AbYGPKPj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 06:15:39 -0400
In-Reply-To: <20080711172804.a3ff6b3e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__16_Jul_2008_20_15_32_+1000_EVMyz0B7B3kKk3gl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Fri, 11 Jul 2008 17:28:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today while importing the ttydev tree, patches
> "49-tty-tidy-usb-io-edgeport" and "88-tty-moxa-warning" failed to apply
> so I removed them from the series.

Today the list expanded to include:
30-usb-serial-api-change
31-whiteheat-coding-style
32-whiteheat-fix-termios
33-tty-belkin_sa-cleanup
35-tty-tidy-usb-console
36-tty-usb-console-fix-termios
37-tty-tidy-usb-cp2101
38-tty-tidy-usb-cyberjack
39-tty-tidy-usb-cypress
40-tty-usb-cypress-charsize
41-tty-tidy-usb-digi-acceleport
42-tty-tidy-usb-empeg
43-tty-tidy-usb-ftdi-sio
45-tty-tidy-usb-garmin-gps
46-tty-tidy-usb-generic
48-tty-tidy-usb-visor
49-tty-tidy-usb-io-edgeport
51-tty-tidy-usb-serial
52-tty-tidy-usb-io-ti
53-tty-tidy-usb-ipaq
54-tty-tidy-usb-ipw
56-tty-tidy-usb-keyspan
57-tty-usb-keyspan-flipstr
58-tty-tidy-usb-keyspan-pda

At which point I am afraid I got tired and just reverted the whole thing,
sorry.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_20_15_32_+1000_EVMyz0B7B3kKk3gl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9ykQACgkQjjKRsyhoI8ycHgCfX6CF71xeMrJMWox0YnqJo8bi
bvAAn1Coq/mtMDDd4bstO1gwvZzbLYEM
=A8qa
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_20_15_32_+1000_EVMyz0B7B3kKk3gl--
