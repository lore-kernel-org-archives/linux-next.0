From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 10 Mar 2009 14:31:17 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903101423200.25436@vixen.sonytel.be>
References: <20090310192440.949884a1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:33454 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752996AbZCJNbU (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 09:31:20 -0400
In-Reply-To: <20090310192440.949884a1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Jason Baron <jbaron@redhat.com>, Greg Banks <gnb@sgi.com>, Herbert Xu <herbert@gondor.apana.org.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Tue, 10 Mar 2009, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> crypto/zlib.c: In function 'zlib_compress_update':
> crypto/zlib.c:148: warning: initialization makes integer from pointer=
 without a cast
> crypto/zlib.c:148: error: initializer element is not computable at lo=
ad time
> crypto/zlib.c:148: error: (near initialization for 'descriptor.primar=
y_hash')
> crypto/zlib.c:148: warning: excess elements in struct initializer
> crypto/zlib.c:148: warning: (near initialization for 'descriptor')
>=20
> And many more similar.  This line is a pr_debug() statement, so the
> finger points at commit 25b67b75587d43ff3f09ad88c03c70a38372d95d
> ("dynamic debug: combine dprintk and dynamic printk") from the
> driver-core tree.
>=20
> The preprocessed code looks like this:
>=20
> static int zlib_compress_update(struct crypto_pcomp *tfm,
>     struct comp_request *req)
> {
>  int ret;
>  struct zlib_ctx *dctx =3D crypto_tfm_ctx(crypto_pcomp_tfm(tfm));
>  struct z_stream_s *stream =3D &dctx->comp_stream;
>=20
>  do { do { static struct _ddebug descriptor __attribute__((__used__))=
 __attribute__((section("__verbose"), aligned(8))) =3D { "zlib", __func=
__, "/scratch/sfr/next/crypto/zlib.c", "%s: " "avail_in %u, avail_out %=
u\n", __func__, 55, 33, 148, 0 }; if (({ int __ret =3D 0; if (__builtin=
_expect(!!((dynamic_debug_enabled & (1LL << 55)) && (dynamic_debug_enab=
led2 & (1LL << 33))), 0)) if (__builtin_expect(!!(descriptor.flags), 0)=
) __ret =3D 1; __ret; })) printk("<7>" "zlib" ":" "%s: " "avail_in %u, =
avail_out %u\n", __func__, req->avail_in, req->avail_out); } while (0);=
 } while (0);
>=20
> The problem is the line:
>=20
> #define pr_fmt(fmt)     "%s: " fmt, __func__
>=20
> in crypto/zlib.c which was introduced by commit
> bf68e65ec9ea61e32ab71bef59aa5d24d255241f ("crypto: zlib - New zlib cr=
ypto
> module, using pcomp") from the crypto tree.
>=20
> For today, I have removed the above line from crypto/zlib.c, but
> something better needs to be done for tomorrow!

I had a closer look. It happens on all archs, if CONFIG_DYNAMIC_DEBUG=3D=
y.

crypto/zlib.c has:

    #define pr_fmt(fmt)     "%s: " fmt, __func__

If CONFIG_DYNAMIC_DEBUG is set, include/linux/kernel.h has:

#define pr_debug(fmt, ...) do { \
	dynamic_pr_debug(pr_fmt(fmt), ##__VA_ARGS__); \
	} while (0)

include/linux/dynamic_debug.h has:

#define dynamic_pr_debug(fmt, ...) do {					\
	static struct _ddebug descriptor				\
	__used								\
	__attribute__((section("__verbose"), aligned(8))) =3D		\
	{ KBUILD_MODNAME, __func__, __FILE__, fmt, DEBUG_HASH,	\
		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
	if (__dynamic_dbg_enabled(descriptor))				\
		printk(KERN_DEBUG KBUILD_MODNAME ":" fmt,		\
				##__VA_ARGS__);				\
	} while (0)


So in crypto/zlib.c,

| pr_debug("avail_in %u, avail_out %u\n", req->avail_in, req->avail_out=
);

is expanded to

| do {
|   do {
|     static struct _ddebug descriptor
|       __attribute__((__used__))
|       __attribute__((section("__verbose"), aligned(8))) =3D {
|       "zlib",
|       __func__,
|       "crypto/zlib.c",
|       "%s: " "avail_in %u, avail_out %u\n",
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	This is the actual format string

|       __func__,
        ^^^^^^^^^
	But this is the first parameter, which should not be here!!!

|       55,
|       33,
|       150,
|       0
|     };
|     if (({
|       int __ret =3D 0;
|       if (__builtin_expect(!!((dynamic_debug_enabled & (1LL << 55)) &=
&
| 			      (dynamic_debug_enabled2 & (1LL << 33))), 0))
| 	if (__builtin_expect(!!(descriptor.flags), 0))
| 	    __ret =3D 1;
|       __ret;
|     }))
|     printk("<7>" "zlib" ":" "%s: " "avail_in %u, avail_out %u\n", __f=
unc__,
| 	   req->avail_in, req->avail_out);
|   } while (0);
| } while (0);

Due the the superfluous `__func__', all field members are shifted by on=
e
position, and compilation breaks.

Apparently inside dynamic_pr_debug(), `fmt' is:

    "avail_in %u, avail_out %u\n", __func__
   =20
instead of only the part before the comma:

    "avail_in %u, avail_out %u\n"


=46or the non-CONFIG_DYNAMIC_DEBUG case, pr_debug() is expanded correct=
ly:

DEBUG is defined:

#define pr_debug(fmt, ...) \
	printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)

and the line is expanded to:

| printk("<7>" "%s: " "avail_in %u, avail_out %u\n", __func__, req->ava=
il_in, req->avail_out);

DEBUG is not defined:

#define pr_debug(fmt, ...) \
	({ if (0) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__); 0; })

and the line is expanded to:

| ({ if (0) printk("<7>" "%s: " "avail_in %u, avail_out %u\n", __func__=
, req->avail_in, req->avail_out); 0; });

Why doesn't it work for dynamic_pr_debug()?

BTW, Martin: Is `#define pr_fmt(fmt)     "%s: " fmt, __func__' a valid =
and
intended usage of your pr_fmt() infrastructure?

Thanks!

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
