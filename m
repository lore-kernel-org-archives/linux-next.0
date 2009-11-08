From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: device-mapper quilt series fetch failure
Date: Mon, 9 Nov 2009 10:26:48 +1100
Message-ID: <20091109102648.e4386364.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Nov_2009_10_26_48_+1100_Xi1f9gLFxnrykxyQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53014 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750763AbZKHX0s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Nov 2009 18:26:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__9_Nov_2009_10_26_48_+1100_Xi1f9gLFxnrykxyQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alasdair,

Today's fetch of the device-mapper tree produced this error:

device-mapper: quilt
receiving incremental file list
rsync: change_dir "/pub/linux/kernel/people/agk/patches/2.6/editing/" faile=
d: Permission denied (13)

(I rsync this directly from master.kernel.org.)

I will use the version of the tree from next-20091106.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Nov_2009_10_26_48_+1100_Xi1f9gLFxnrykxyQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr3U7gACgkQjjKRsyhoI8yh7gCfewdRIX0pO7Y8c9CQXW5+VoBi
lz4AmgJD9/iySOz9S5HzWboOwwTyUBEA
=JBTG
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Nov_2009_10_26_48_+1100_Xi1f9gLFxnrykxyQ--
