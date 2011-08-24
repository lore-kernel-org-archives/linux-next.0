From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Wed, 24 Aug 2011 15:47:41 +1000
Message-ID: <20110824154741.3cbe03b403b646e2a99d63a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__24_Aug_2011_15_47_41_+1000_OHlwteB82DJedN+1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37967 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752324Ab1HXFru (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Aug 2011 01:47:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, edwin_rong <edwin_rong@realsil.com.cn>

--Signature=_Wed__24_Aug_2011_15_47_41_+1000_OHlwteB82DJedN+1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/staging/rts5139/rts51x_scsi.c: In function 'inquiry':
drivers/staging/rts5139/rts51x_scsi.c:498:2: error: implicit declaration of=
 function 'vmalloc'
drivers/staging/rts5139/xd.c: In function 'xd_init_l2p_tbl':
drivers/staging/rts5139/xd.c:745:2: error: implicit declaration of function=
 'vmalloc'
drivers/staging/rts5139/xd.c: In function 'free_zone':
drivers/staging/rts5139/xd.c:771:3: error: implicit declaration of function=
 'vfree'
drivers/staging/rts5139/ms.c: In function 'ms_init_l2p_tbl':
drivers/staging/rts5139/ms.c:2214:2: error: implicit declaration of functio=
n 'vmalloc'
drivers/staging/rts5139/ms.c:2257:3: error: implicit declaration of functio=
n 'vfree'

Caused by commit 1dac4186bcc6 ("Staging: add driver for Realtek RTS5139
cardreader").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__24_Aug_2011_15_47_41_+1000_OHlwteB82DJedN+1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOVJB9AAoJEDMEi1NhKgbsFVYH/0SplprbyMJklPRKg8kaodn2
LmdQnKXbWQxfZliz+PSNccIPG7U4NkhSuag9+i3VVRgsaJNxTlVBrvB828gE719Z
m7YAODPabXzoZR5Z9/+ADeTUfQ+vWSBvppEuzVa7yXg7UaVdRdJ9duFB19IlFZLC
pUavE25NplV6kV1xd6sWUO9lguxP67Zl2YC+QfUrfNd/0eDJQxUf2F6xyu9C8fx4
54surA3No0osZZBsjAa9+3snzUHpnd1gahkuJpWUHJXftW3EWAQr3XTgSEoWAYLX
5UDJbSkN7B4XhlzPNotNjP1ddCcrBoWBtvX+nUiJacqUcexCH5o1/TonlefvP8I=
=2hCj
-----END PGP SIGNATURE-----

--Signature=_Wed__24_Aug_2011_15_47_41_+1000_OHlwteB82DJedN+1--
