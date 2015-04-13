From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 13 Apr 2015 14:58:22 +1000
Message-ID: <20150413145822.1c519ca4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tT+wFd.DqNSabSQ.+5bexg0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33486 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750708AbbDME62 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 00:58:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/tT+wFd.DqNSabSQ.+5bexg0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
block/blk-mq.c between commit ac2111753ca9 ("blk-mq: initialize 'struct
request' and associated data to zero") from Linus' tree and commit
cef4e5c345d3 ("blk-mq: ensure that request and PDU data are zeroed at
init time") from the block tree.

I fixed it up (just formatted differently - I used the block tree
version) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/tT+wFd.DqNSabSQ.+5bexg0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK0zyAAoJEMDTa8Ir7ZwVtDwP/RiRMQs8Ghz3jfueAc2l5i+8
9HoZsQXeS5MKouRej59m0c2+YtD01XmXk7xJM9k7Fw7FT5aEHmX7WLC8M4pcycu0
9UTe6pCeh3R5KOdQn+5zPARcpCyhTC+5etBazY4uY5ioxdcwxRuOE3EwJHQ3bfKP
vYhQc9XOvqm0qN3Kof5KZUjcggjniGZn23sTzGROWkMZpCVp087GhEsp8oeOFLJ4
0bFfR01CwD/8WHaKHJJ08diQTCMnIz6PxFpWYnILUV/6d+eEDM81UwV7ZRcNeK78
VulHv3tr7IKoZSEQc7mw+93R6etip31QpUrtRsXTGzT6vbBQ/tZz1CiIV0+WrJWF
ivGIg9t8XwBT1KjQFgfSzxuhDwQNK3Idr/Ixfjo7ptC+YCMi5mVq1GPnWJ+osCtD
sQlQwskjwyo7DJ6/Et4I+iS6iUh1smgKEhC0KE9jq60VBFh6giZaaUOiYGVIKb2G
uEzgzhlafR/Jff3Z5DnsYRjd4cR/ilKdQ2Ncp9oNYqdp605DJIGd0v3XtFQ9YBbp
RVYEiVixAjjK8HBgewsvDkZatlbwg8wcqxWPPftZtGPEQOQDT7JlaHjeczB7EFzI
Rx5gXFNlY2/ctBnjGBL6952j/Vhw/dzTMNSW29cr4MxT4cWrkCo5tupLH9Hz4i8P
J+IllYy6lZ0JCSQ7lulX
=XFBU
-----END PGP SIGNATURE-----

--Sig_/tT+wFd.DqNSabSQ.+5bexg0--
