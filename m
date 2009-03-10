From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 10 Mar 2009 16:29:50 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903101626450.25436@vixen.sonytel.be>
References: <20090310192440.949884a1.sfr@canb.auug.org.au> <alpine.LRH.2.00.0903101423200.25436@vixen.sonytel.be> <20090310145311.6bf9d9e9@skybase>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:35745 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751535AbZCJP3x (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 11:29:53 -0400
In-Reply-To: <20090310145311.6bf9d9e9@skybase>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Jason Baron <jbaron@redhat.com>, Greg Banks <gnb@sgi.com>, Herbert Xu <herbert@gondor.apana.org.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Tue, 10 Mar 2009, Martin Schwidefsky wrote:
> On Tue, 10 Mar 2009 14:31:17 +0100 (CET)
> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
>=20
> > crypto/zlib.c has:
> >=20
> >     #define pr_fmt(fmt)     "%s: " fmt, __func__
> >=20
> > If CONFIG_DYNAMIC_DEBUG is set, include/linux/kernel.h has:
> >=20
> > #define pr_debug(fmt, ...) do { \
> > 	dynamic_pr_debug(pr_fmt(fmt), ##__VA_ARGS__); \
> > 	} while (0)
> >=20
> > include/linux/dynamic_debug.h has:
> >=20
> > #define dynamic_pr_debug(fmt, ...) do {					\
> > 	static struct _ddebug descriptor				\
> > 	__used								\
> > 	__attribute__((section("__verbose"), aligned(8))) =3D		\
> > 	{ KBUILD_MODNAME, __func__, __FILE__, fmt, DEBUG_HASH,	\
> > 		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
> > 	if (__dynamic_dbg_enabled(descriptor))				\
> > 		printk(KERN_DEBUG KBUILD_MODNAME ":" fmt,		\
> > 				##__VA_ARGS__);				\
> > 	} while (0)
>=20
> The dynamic_pr_debug macro currently works only with pr_fmt definitio=
ns
> that do not add additional parameters. The way how we use the pr_fmt
> macro is:
>=20
> #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
>=20
> The same could be done with the problematic pr_fmt definition:
>=20
> #define pr_fmt(fmt)     __func__ ": " fmt

No, that also doesn't work:

| crypto/zlib.c:150: error: expected '}' before string constant
| crypto/zlib.c:150: error: expected ')' before '__func__'
| crypto/zlib.c:162: error: expected '}' before string constant
| crypto/zlib.c:162: error: expected ')' before '__func__'
| crypto/zlib.c:166: error: expected '}' before string constant
| crypto/zlib.c:166: error: expected ')' before '__func__'
| crypto/zlib.c:170: error: expected '}' before string constant
| crypto/zlib.c:170: error: expected ')' before '__func__'

> > BTW, Martin: Is `#define pr_fmt(fmt)     "%s: " fmt, __func__' a va=
lid and
> > intended usage of your pr_fmt() infrastructure?
>=20
> The indended use is a simple prefix to the format string. To paste an
> additional parameter is an interesting use of the pr_fmt macro ..

Bummer, I was so happy I could do things like

| #define pr_fmt(fmt)	"%s:%u: " fmt, __func__, __LINE__

=2E..

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
