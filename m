From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the char-misc tree
Date: Wed, 27 May 2015 15:52:01 +1000
Message-ID: <20150527155201.43e0bbb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UteN/7LcxzXQPET_mPR78K9"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44831 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751129AbbE0FwH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2015 01:52:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>

--Sig_/UteN/7LcxzXQPET_mPR78K9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64 allmodco=
nfig)
failed like this:

drivers/nfc/microread/mei.c:70:2: error: implicit declaration of function '=
__UUID_LE' [-Werror=3Dimplicit-function-declaration]
  { MICROREAD_DRIVER_NAME, MEI_NFC_UUID},
  ^
drivers/nfc/microread/mei.c:70:2: warning: missing braces around initialize=
r [-Wmissing-braces]
drivers/nfc/microread/mei.c:70:2: warning: (near initialization for 'micror=
ead_mei_tbl[0].uuid') [-Wmissing-braces]
drivers/nfc/microread/mei.c:70:2: error: initializer element is not constant
drivers/nfc/microread/mei.c:70:2: error: (near initialization for 'microrea=
d_mei_tbl[0].uuid[0]')
cc1: some warnings being treated as errors

Caused by commit c93b76b34b4d ("mei: bus: report also uuid in module
alias").

I have used the char-misc tree from next-20150526 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/UteN/7LcxzXQPET_mPR78K9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZVuFAAoJEMDTa8Ir7ZwVBTIP/jFXSjDLRPLnf3NOh1RThGji
/vlInCt/NUiqBjQmsgDxsUj1oYiiOKtntumaDsHTc7661wO27rJBisu6xA7rezCL
lnS2e40In4nI5LtzLF7D3k/CLLdsX3lBnHaEzjbF+epLjChYpXF/SZ5y6c8UNG2R
PE7twAmCIfE7aWMGj6ZZjQnwKCGteiAB24ucwTESsy23vWhDZCWj23rJ2buYSJ4O
bDhZYob2nHKX52hHX7SivwxUL9zwvXu52zQfoEdCtgpv9tdn1appXevW6yCqXAEX
4JbqyreP5r5XMMsDKlbKFCBqPsQfe6ZBP9sYh9Hfu5xVqfN6GBkM3Ar7jS/lPkgM
PB9QuYkGmSeJG4hPso/3UnlI0+YRIzI0DZJVh5WREqxXsyFDi/aHnB6fXgUMZ+rX
PvhG+liBYMuCGenbaSVpJ4/26GJRIHjyQZwcZuPy88/yFFxR8/WlQ7Elp1Iq823L
oFjTk36fW/m4Utiy7JXlfL7IZwFQbzhWGOGf9SHRa9diWr/6b4cwQbc+s+cY/gC/
QT/iEa/mhjuAR92lA7Lqk7xuJH99OeBfvP6vMqnn2ojQLSD7+HTKgOtbSGy+MRH5
bmaH8EHXpZEZT34sZhvt18g5egwZDUqDbfduXAiqtJtUoTHvbvpvUJ8fpLTm8xLp
ToSb6JZj1vnA2N7lRoxn
=FepP
-----END PGP SIGNATURE-----

--Sig_/UteN/7LcxzXQPET_mPR78K9--
