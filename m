From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext4 tree
Date: Thu, 4 Apr 2013 10:43:19 +1100
Message-ID: <20130404104319.42d97a8ad7badf00af7ef1e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__4_Apr_2013_10_43_19_+1100_d8i1MyZy9+JBf1vo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__4_Apr_2013_10_43_19_+1100_d8i1MyZy9+JBf1vo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

After merging the ext4 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/ext4/resize.c: In function 'ext4_resize_fs':
fs/ext4/ext4.h:1799:21: sorry, unimplemented: inlining failed in call to 'e=
xt4_get_group_number': function body not available
fs/ext4/resize.c:1882:10: sorry, unimplemented: called from here
fs/ext4/ext4.h:1799:21: sorry, unimplemented: inlining failed in call to 'e=
xt4_get_group_number': function body not available
fs/ext4/resize.c:275:9: sorry, unimplemented: called from here
fs/ext4/ext4.h:1799:21: sorry, unimplemented: inlining failed in call to 'e=
xt4_get_group_number': function body not available
fs/ext4/resize.c:287:9: sorry, unimplemented: called from here
fs/ext4/ext4.h:1799:21: sorry, unimplemented: inlining failed in call to 'e=
xt4_get_group_number': function body not available
fs/ext4/resize.c:299:9: sorry, unimplemented: called from here
fs/ext4/mballoc.c: In function 'ext4_mb_release_context':
fs/ext4/ext4.h:1799:21: sorry, unimplemented: inlining failed in call to 'e=
xt4_get_group_number': function body not available
fs/ext4/mballoc.c:3347:6: sorry, unimplemented: called from here

Caused by commit dc351389caa5 ("ext4: introduce ext4_get_group_number()").

This build was done with gcc 4.6.3 if that matters.

I have used the ext4 tree from next-20130403 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__4_Apr_2013_10_43_19_+1100_d8i1MyZy9+JBf1vo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRXL6XAAoJEECxmPOUX5FEDmwQAKFzUfENbCiSRnFZoeLKkkcz
pmDoNtHlP5EqcqtKDtEuBOiyaieZiYGu8HCsknX8GIx7x9CERdbiKBKBGrQW7HmI
28SRQlkIDRdTEunnCcRSX3hIvspCTP4HGVIUbBJTXUZSOxOuSgn1bshsm07Lbn8a
tr8+eraem2IaqACNS4HwZ0+msX+7Sw7S2+ooLdLE4876xESQUEFk781Go4hQXzGj
4hLgKz5BC/1YptDbWoAPhSR6/UqUODlzsW2bhCDEderHLS32B9rhW0QLPPMTxH96
k7ake37+gZYkD7XZmZeCxvWFUYbQtdqQxj0CcTTMlgl0T9hZWcJp3hXRcM6F4mld
g2V5zPBz8ILrmnset5d5CD2MzctzHQmOZxyPawsW6kJ11U6DbpvCtP2ReCmoIVC2
G74K5mNwB3TRjHlYqpzCJ10YUPtCwJzDo1zl1QxPFxr4HP+KAQ+Brr3PXFpQeLb6
7tAle+pUb9uYw8NvGlf/sVkvItgfM9+PjWi8s6POxku1hdtrGfOCtJztki/wiy0E
20HwuJy8g3jCo8TYLgZFJs1YJ+mdUZA73sSRDtpnRTLVFJnpvIdM5EhhgSV9moQA
RaOKchbqppyjLtkaIcIvnSMiB/u2QsxIJztkNnWQSZh2lCPH8htDzBZMVR4VqCjK
A0yTO4k0HqqaA+mBPRhR
=QvDk
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Apr_2013_10_43_19_+1100_d8i1MyZy9+JBf1vo--
