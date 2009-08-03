From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Mon, 3 Aug 2009 10:35:50 +1000
Message-ID: <20090803103550.9b28900a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__3_Aug_2009_10_35_50_+1000_7.WuXeXwnH_65FJ1"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754004AbZHCAf6@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Noll <maan@systemlinux.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__3_Aug_2009_10_35_50_+1000_7.WuXeXwnH_65FJ1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

ERROR: ".md_integrity_add_rdev" [drivers/md/multipath.ko] undefined!

Caused by commit 66f4f3f41f5c334f399e920b2aaad9b82514acda ("md: Push down
data integrity code to personalities") from the md-current and md trees.
Looks like md_integrity_add_rdev needs an EXPORT_SYMBOL.

I have used the version of the md-current and md trees from next-20090731
for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__3_Aug_2009_10_35_50_+1000_7.WuXeXwnH_65FJ1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp2MOYACgkQjjKRsyhoI8x5lwCbBuupixOJObwb4WhJd2KX5AEm
qosAn0SGX0WcTtdOgExhBEe2PSuWgHLM
=iC+p
-----END PGP SIGNATURE-----

--Signature=_Mon__3_Aug_2009_10_35_50_+1000_7.WuXeXwnH_65FJ1--
