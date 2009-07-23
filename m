From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: async_tx tree build failure
Date: Thu, 23 Jul 2009 12:00:04 +1000
Message-ID: <20090723120004.fac867eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Jul_2009_12_00_04_+1000_fIIuENPQc9T9dQvM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47391 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751295AbZGWCAY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jul 2009 22:00:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__23_Jul_2009_12_00_04_+1000_fIIuENPQc9T9dQvM
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Since next-20090623, the linux-next build (i386 allmodconfig) has failed
like this:

crypto/async_tx/async_xor.c: In function =E2=80=98async_xor_init=E2=80=99:
crypto/async_tx/async_xor.c:310: error: size of array =E2=80=98type name=E2=
=80=99 is negative

The failing line is this:

	BUILD_BUG_ON(sizeof(dma_addr_t) > sizeof(struct page *));

in async_xor_init() introduced by commit
0036731c88fdb5bf4f04a796a30b5e445fc57f54 ("async_tx: kill tx_set_src and
tx_set_dest methods") in Feb, 2008.

Bisecting in the next-20090623 tree pointed to commit
3c30a9ca1fb95214e60e3bf43957971df6668033 ("dmaengine: move HIGHMEM64G
restriction to ASYNC_TX_DMA") from the async_tx tree.  This is now commit
f3c56e57f66a73a241299dbec1ad55491aa0e403.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Jul_2009_12_00_04_+1000_fIIuENPQc9T9dQvM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpnxCQACgkQjjKRsyhoI8z1fACgh3WrBMNmvy1s/mIA2tTEMMeG
9YgAn28o/sepIMGHS2xJ8TGIxrtT3zdz
=5Mf8
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Jul_2009_12_00_04_+1000_fIIuENPQc9T9dQvM--
