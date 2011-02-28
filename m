From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 28 Feb 2011 12:05:01 +1100
Message-ID: <20110228120501.eb6840e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Feb_2011_12_05_01_+1100_L4H2MS2tqHh.4wws"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__28_Feb_2011_12_05_01_+1100_L4H2MS2tqHh.4wws
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/video/matrox/matroxfb_base.c: In function 'matroxfb_ioctl':
drivers/video/matrox/matroxfb_base.c:1155: error: 'VIDIOC_S_CTRL_OLD' undec=
lared (first use in this function)

Caused by commit 0ff69fe7cebb65856eba7feb3fd76fb4ba365bf8 ("[media] v4l:
removal of old, obsolete ioctls"). grep is your friend ...

I have used the v4l-dvb tree from next-20110225 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Feb_2011_12_05_01_+1100_L4H2MS2tqHh.4wws
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNavS9AAoJEDMEi1NhKgbsLwkH+wcVxbHaAF65HAT246X56icc
Yd0ONtNsEgSA8jS/CADodYKIzN/y/N0u0Hz7XRtlFKa72KVUGlByODQA2jiUAyzi
nInT0MsDBYJPFuOaGexD41bSnzcPRj6osdihDKolhjFSnMpYdg2UKRZBboxsx0qD
rd+POoJRaHueBDM79b9Znm/j5cpEG75pnjGF6bXuFBvbfQBMl2fL7j/xnhtkoTol
VxW3yOSi1Vdkjn3ex2CqPysOiJGWwHhQGPjRv3nRfY3xQ3BL/JW/KpiSg7/tN25I
zPr5mKa3iNsJcU+au8aUJ9HyGnEcDCXRyx+1BBmRknP16cO5gi/48vHgry0wAJs=
=n9iY
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Feb_2011_12_05_01_+1100_L4H2MS2tqHh.4wws--
