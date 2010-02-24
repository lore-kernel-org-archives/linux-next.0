From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the ext3 tree
Date: Wed, 24 Feb 2010 19:05:20 +1100
Message-ID: <20100224190520.8cd15930.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__24_Feb_2010_19_05_20_+1100_lpnvOsvUXievMj6o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__24_Feb_2010_19_05_20_+1100_lpnvOsvUXievMj6o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

After merging the ext3 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/gfs2/quota.c:1581: warning: initialization from incompatible pointer type

Introduced by commit ec304a27d7750ba666ad2d446434ddd47fa93c40 ("quota:
move code from sync_quota_sb into vfs_quota_sync").  From the commit
message, I expect that this has been thought about.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__24_Feb_2010_19_05_20_+1100_lpnvOsvUXievMj6o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuE3cAACgkQjjKRsyhoI8yKegCfWux2UzaWBDgoMycPF/iusA+T
QsAAn2QFs9dJzkMm6bnfgJH3K5X0yGKu
=o08c
-----END PGP SIGNATURE-----

--Signature=_Wed__24_Feb_2010_19_05_20_+1100_lpnvOsvUXievMj6o--
