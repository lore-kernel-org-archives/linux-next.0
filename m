From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Fri, 25 Jul 2008 14:30:39 +1000
Message-ID: <20080725143039.356bf6ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__25_Jul_2008_14_30_39_+1000_YA0.cpZ.+jHvXQdT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56253 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751408AbYGYEay (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Jul 2008 00:30:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Denys Vlasenko <vda.linux@googlemail.com>, Ulrich Drepper <drepper@redhat.com>

--Signature=_Fri__25_Jul_2008_14_30_39_+1000_YA0.cpZ.+jHvXQdT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in fs/pipe.c
between commit be61a86d7237dd80510615f38ae21d6e1e98660c ("flag
parameters: NONBLOCK in pipe") from Linus' tree and commit
6d865512f04526c702efda424b825ee946e659de ("Re: [PATCH] (resend) reuse
xxx_fifo_fops for xxx_pipe_fops") from the vfs tree.

Just overlapping context changes in create_read_pipe().  I did the
obvious fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__25_Jul_2008_14_30_39_+1000_YA0.cpZ.+jHvXQdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiJVu8ACgkQjjKRsyhoI8wpWACdG7X+/i2wsvMmJG8RFdk7TTwP
Pu4AoLrT2pj3qaD9yh+BuRrcchKFekNz
=el79
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Jul_2008_14_30_39_+1000_YA0.cpZ.+jHvXQdT--
