From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Tue, 10 Mar 2009 19:24:40 +1100
Message-ID: <20090310192440.949884a1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Mar_2009_19_24_40_+1100_v.982o8I1d5FCZfe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46172 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752270AbZCJIYt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 04:24:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Jason Baron <jbaron@redhat.com>, Greg Banks <gnb@sgi.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Herbert Xu <herbert@gondor.apana.org.au>

--Signature=_Tue__10_Mar_2009_19_24_40_+1100_v.982o8I1d5FCZfe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

crypto/zlib.c: In function 'zlib_compress_update':
crypto/zlib.c:148: warning: initialization makes integer from pointer witho=
ut a cast
crypto/zlib.c:148: error: initializer element is not computable at load time
crypto/zlib.c:148: error: (near initialization for 'descriptor.primary_hash=
')
crypto/zlib.c:148: warning: excess elements in struct initializer
crypto/zlib.c:148: warning: (near initialization for 'descriptor')

And many more similar.  This line is a pr_debug() statement, so the
finger points at commit 25b67b75587d43ff3f09ad88c03c70a38372d95d
("dynamic debug: combine dprintk and dynamic printk") from the
driver-core tree.

The preprocessed code looks like this:

static int zlib_compress_update(struct crypto_pcomp *tfm,
    struct comp_request *req)
{
 int ret;
 struct zlib_ctx *dctx =3D crypto_tfm_ctx(crypto_pcomp_tfm(tfm));
 struct z_stream_s *stream =3D &dctx->comp_stream;

 do { do { static struct _ddebug descriptor __attribute__((__used__)) __att=
ribute__((section("__verbose"), aligned(8))) =3D { "zlib", __func__, "/scra=
tch/sfr/next/crypto/zlib.c", "%s: " "avail_in %u, avail_out %u\n", __func__=
, 55, 33, 148, 0 }; if (({ int __ret =3D 0; if (__builtin_expect(!!((dynami=
c_debug_enabled & (1LL << 55)) && (dynamic_debug_enabled2 & (1LL << 33))), =
0)) if (__builtin_expect(!!(descriptor.flags), 0)) __ret =3D 1; __ret; })) =
printk("<7>" "zlib" ":" "%s: " "avail_in %u, avail_out %u\n", __func__, req=
->avail_in, req->avail_out); } while (0); } while (0);

The problem is the line:

#define pr_fmt(fmt)     "%s: " fmt, __func__

in crypto/zlib.c which was introduced by commit
bf68e65ec9ea61e32ab71bef59aa5d24d255241f ("crypto: zlib - New zlib crypto
module, using pcomp") from the crypto tree.

For today, I have removed the above line from crypto/zlib.c, but
something better needs to be done for tomorrow!

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Mar_2009_19_24_40_+1100_v.982o8I1d5FCZfe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm2I8gACgkQjjKRsyhoI8x87ACgpP8iCAVUbXwH53DYqjt/b3W9
+38AnjJqIPWt8CxEHDNxwhanq//hVuNz
=xWc1
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Mar_2009_19_24_40_+1100_v.982o8I1d5FCZfe--
