From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs/nfsd trees fetch failed
Date: Mon, 2 Nov 2009 08:58:35 +1100
Message-ID: <20091102085835.651ddd02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Nov_2009_08_58_35_+1100_Q3k_=evTwgVBovoW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47310 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753452AbZKAV6k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2009 16:58:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__2_Nov_2009_08_58_35_+1100_Q3k_=evTwgVBovoW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's fetch of the nfs and nfsd trees failed like this:

nfs: git
git.linux-nfs.org[0: 141.212.112.37]: errno=3DConnection refused
fatal: unable to connect a socket (Connection refused)
nfsd: git
git.linux-nfs.org[0: 141.212.112.37]: errno=3DConnection refused
fatal: unable to connect a socket (Connection refused)

I will use the version of those trees from next-20091030.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Nov_2009_08_58_35_+1100_Q3k_=evTwgVBovoW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkruBIsACgkQjjKRsyhoI8yzGgCgkfygtw3KSMtynW2gOdh7dBIQ
W1IAn12+Sckx4izcM7LtqGZI+ikMEA8F
=Wo+j
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Nov_2009_08_58_35_+1100_Q3k_=evTwgVBovoW--
