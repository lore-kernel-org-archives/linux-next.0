From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the quota tree
Date: Tue, 10 Feb 2009 18:34:38 +1100
Message-ID: <20090210183438.2099164f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Feb_2009_18_34_38_+1100_64jii8oDs+fuIubj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43388 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750772AbZBJHep (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2009 02:34:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, Jan Kara <jack@suse.cz>

--Signature=_Tue__10_Feb_2009_18_34_38_+1100_64jii8oDs+fuIubj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in fs/Kconfig
between commit c417122fec0f6b10a6c338c84180c6b9e06601c8 ("quota: Move
quota files into separate directory") from the quota tree and commit
8310459012b926e121b3546bfed833910dd6f3ef ("trivial: fix typos/grammar
errors in Kconfig texts") from the trivial tree.

I have just dropped the trivial tree's updates.  Jiri, please separate
out the fs/Kconfig part of that trivial tree commit above and sent it to
Jan.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Feb_2009_18_34_38_+1100_64jii8oDs+fuIubj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmRLg4ACgkQjjKRsyhoI8xRawCgnXCILeU/zh7OnH86NdTW5YKB
2nQAniWRLdeKFFOk1WCOi71oZF8SKYv2
=pwER
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Feb_2009_18_34_38_+1100_64jii8oDs+fuIubj--
