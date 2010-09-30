From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the kbuild tree
Date: Thu, 30 Sep 2010 10:52:22 +1000
Message-ID: <20100930105222.d1dd6606.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__30_Sep_2010_10_52_22_+1000_ZlcQPC6xi6bGkyeF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43425 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751194Ab0I3Aw1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 20:52:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Thu__30_Sep_2010_10_52_22_+1000_ZlcQPC6xi6bGkyeF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

After merging the kbuild tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from scripts/kconfig/zconf.tab.c:2485:
scripts/kconfig/symbol.c: In function 'sym_expand_string_value':
scripts/kconfig/symbol.c:881: warning: ignoring return value of 'realloc', =
declared with attribute warn_unused_result

Introduced by commit 76a540958af5390a94b7f68c46cb7f2aed34ccf1 ("kconfig:
add a symbol string expansion helper").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__30_Sep_2010_10_52_22_+1000_ZlcQPC6xi6bGkyeF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMo99GAAoJEDMEi1NhKgbsvAkH/iqtZo1XxaYEDMvHWmT1v5Gg
HwSfXQmsmlJYPrKurgMJquv/29Pee2bppG+ZhpytBp01n15e108yQ/zEGykK7vQ1
ZspfiFFtyxKwKwavNp9ZB/coYl6r4WfPvAv5rPCB9RaCH+XZfg1TLUeINTCk7iis
jc0rVSa7me9DhsWveoCqiC81LaDfrf5hS/35JYtYszxzT8ubRWS5qwBd8tDZM5HD
36Zvh0eqo0Oxi8/oFr6yiWZFXyNP5cQvKITAmtrMWTX0IFCZrUam4rtfLSrHsxw4
f0ttaSQKymftQtRUQkoy9mFn2iG9Ghk02AVfnZQl0NQsfqBMrsAHJIlV5nGdyfw=
=7wgJ
-----END PGP SIGNATURE-----

--Signature=_Thu__30_Sep_2010_10_52_22_+1000_ZlcQPC6xi6bGkyeF--
