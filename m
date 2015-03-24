From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Tue, 24 Mar 2015 16:29:38 +1100
Message-ID: <20150324162938.60bce3dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Pk6Orv3KqK4ZVNry0uX7i09"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41721 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751108AbbCXF3q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Mar 2015 01:29:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Larsson <benjamin@southpole.se>, Katie Dunne <kdunne@mail.ccsf.edu>

--Sig_/Pk6Orv3KqK4ZVNry0uX7i09
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/media/mn88473/mn88473.c between commit 3b786f131645
("[media] mn88473: calculate the IF register values") from the v4l-dvb
tree and commit b4c2c314c140 ("Staging: media: mn88473: Match alignment
with open parenthesis") from the staging tree.

I fixed it up (the former removed part of the code updated by the
latter) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Pk6Orv3KqK4ZVNry0uX7i09
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVEPZGAAoJEMDTa8Ir7ZwVkuYP/A0/N0h+QCqxUcujLHpG+d7k
Od2G8XnJ9L+q1z4HgOwZN95ZbxfIFc6urp6sH9xfjJowCmDJTbD7S+YwwuX7C0Jk
qr+wGh57Dx1w0b6irSIMMnHD4MoacQDBCm874/rx2E42A7xy8H5eLewm+xZeBI/A
aFK/S6UNBZuDWNxpeYPvkxjHbAQfnB4nUVfSJZciJEA4h6unuKqrCNxrn/LpLbZf
Ywz02TImiSZzHUo84sUufTB5OpZ1xHhq304C5pHI2yZ5rWCuhfoOF3k4vFZHO/HP
9/T6T7JuLvw5uZTBI9YKk18fREAvJ6h6nPNkixxk7jfmJpwe3IwjpqJDcVI9Gkbv
KLX0avGM0UkbRzmfIqr3skXp2qy0ucMIDxxv9rI29u9NXqCggEj07SnZUoOaN63Q
dzaQN+536bwG0wn3RNmUEYI0X63ujAUhtiqbpTzT+ruFM8zCn7IGw7yrQmpkCJpj
41T5TEsBZZraScb+sroWSQHUdr6LyQFSKS7ymf/7z1t819K3FeKBCp2kn/twoudn
1R5ehatoOAZH0b6EubBcmZDDwCd68DVWoMzHh8qWffOZngyHdQqsbubdSLt465kG
2gPDSdSWaNxlgXy+O6BaIKq+aSzv/zh/o/fW84O89f4NFUMkPSxmFlX/etise76C
tuBVURTx5qVw/QyPn6wn
=K97U
-----END PGP SIGNATURE-----

--Sig_/Pk6Orv3KqK4ZVNry0uX7i09--
