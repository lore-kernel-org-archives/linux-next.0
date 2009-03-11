From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 11 Mar 2009 11:50:09 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903111149340.1040@vixen.sonytel.be>
References: <20090310192440.949884a1.sfr@canb.auug.org.au> <alpine.LRH.2.00.0903101423200.25436@vixen.sonytel.be> <20090310145311.6bf9d9e9@skybase> <alpine.LRH.2.00.0903101626450.25436@vixen.sonytel.be> <20090310170841.2257de86@skybase> <20090310200200.GB3091@redhat.com>
 <49B78D60.2070402@sgi.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:55054 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755275AbZCKKuM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 06:50:12 -0400
In-Reply-To: <49B78D60.2070402@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Banks <gnb@sgi.com>
Cc: Jason Baron <jbaron@redhat.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Wed, 11 Mar 2009, Greg Banks wrote:
> Jason Baron wrote:
> > On Tue, Mar 10, 2009 at 05:08:41PM +0100, Martin Schwidefsky wrote:
> >  =20
> >> On Tue, 10 Mar 2009 16:29:50 +0100 (CET)
> >> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
> >>
> >>    =20
> >>>> The same could be done with the problematic pr_fmt definition:
> >>>>
> >>>> #define pr_fmt(fmt)     __func__ ": " fmt
> >>>>        =20
> >>> No, that also doesn't work:
> >>>
> >>> | crypto/zlib.c:150: error: expected '}' before string constant
> >>> | crypto/zlib.c:150: error: expected ')' before '__func__'
> >>> | crypto/zlib.c:162: error: expected '}' before string constant
> >>> | crypto/zlib.c:162: error: expected ')' before '__func__'
> >>> | crypto/zlib.c:166: error: expected '}' before string constant
> >>> | crypto/zlib.c:166: error: expected ')' before '__func__'
> >>> | crypto/zlib.c:170: error: expected '}' before string constant
> >>> | crypto/zlib.c:170: error: expected ')' before '__func__'
> >>>
> >>>      =20
> >>>>> BTW, Martin: Is `#define pr_fmt(fmt)     "%s: " fmt, __func__' =
a valid and
> >>>>> intended usage of your pr_fmt() infrastructure?
> >>>>>          =20
> >>>> The indended use is a simple prefix to the format string. To pas=
te an
> >>>> additional parameter is an interesting use of the pr_fmt macro .=
=2E
> >>>>        =20
> >>> Bummer, I was so happy I could do things like
> >>>
> >>> | #define pr_fmt(fmt)	"%s:%u: " fmt, __func__, __LINE__
> >>>      =20
> >> Actually that seem like a nice thing to have. With the upstream ve=
rsion of
> >> dynamic_pr_debug this works, there the format string is used only =
on a printk.
> >> git commit 25b67b75587d43ff3f09ad88c03c70a38372d95d introduces the=
 code
> >> that pastes the format string to the _ddebug structure.
> >>
> >>    =20
> >
> > hmmm...yeah, some macro magic in include/linux/dynamic_debug.h conv=
erts
> > the 'fmt' arg into a series of strings. It doesn't look as pretty i=
n the
> > dynamic debug control file:
> >
> > crypto/zlib.c:333 [zlib]zlib_decompress_final - "\042%s: \042
> > \042avail_in %u, avail_out %u (consumed %u, produced %u)\n\042,
> > __func__"
> >
> > with all those '\042' there, which are the '"' characters, but we
> > probably could live with it.
> >
> > patch below.
> >
> >  =20
>=20
> I think this patch does the same thing more cleanly.
>=20
> When CONFIG_DYNAMIC_DEBUG is enabled, allow callers of pr_debug()
> to provide their own definition of pr_fmt() even if that definition
> uses tricks like
>=20
> #define pr_fmt(fmt) "%s:" fmt, __func__
>=20
> Signed-off-by: Greg Banks <gnb@sgi.com>

Thanks, much cleaner!

Acked-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

> ---
>=20
>  include/linux/dynamic_debug.h |    4 ++--
>  include/linux/kernel.h        |    3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> Index: linux-git/include/linux/dynamic_debug.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-git.orig/include/linux/dynamic_debug.h
> +++ linux-git/include/linux/dynamic_debug.h
> @@ -57,7 +57,7 @@ extern int ddebug_remove_module(char *mo
>  	{ KBUILD_MODNAME, __func__, __FILE__, fmt, DEBUG_HASH,	\
>  		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
>  	if (__dynamic_dbg_enabled(descriptor))				\
> -		printk(KERN_DEBUG KBUILD_MODNAME ":" fmt,		\
> +		printk(KERN_DEBUG KBUILD_MODNAME ":" pr_fmt(fmt),	\
>  				##__VA_ARGS__);				\
>  	} while (0)
> =20
> @@ -70,7 +70,7 @@ extern int ddebug_remove_module(char *mo
>  		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
>  	if (__dynamic_dbg_enabled(descriptor))				\
>  			dev_printk(KERN_DEBUG, dev,			\
> -					KBUILD_MODNAME ": " fmt,	\
> +					KBUILD_MODNAME ": " pr_fmt(fmt),\
>  					##__VA_ARGS__);			\
>  	} while (0)
> =20
> Index: linux-git/include/linux/kernel.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-git.orig/include/linux/kernel.h
> +++ linux-git/include/linux/kernel.h
> @@ -359,8 +359,9 @@ static inline char *pack_hex_byte(char *
>  #define pr_debug(fmt, ...) \
>  	printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
>  #elif defined(CONFIG_DYNAMIC_DEBUG)
> +/* dynamic_pr_debug() uses pr_fmt() internally so we don't need it h=
ere */
>  #define pr_debug(fmt, ...) do { \
> -	dynamic_pr_debug(pr_fmt(fmt), ##__VA_ARGS__); \
> +	dynamic_pr_debug(fmt, ##__VA_ARGS__); \
>  	} while (0)
>  #else
>  #define pr_debug(fmt, ...) \

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
