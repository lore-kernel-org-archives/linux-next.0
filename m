From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] tools/perf: fix build when WERROR=1
Date: Wed, 08 Aug 2012 19:32:46 +0300
Message-ID: <1344443566.24513.35.camel@smile>
References: <1344438350-22574-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20120808161849.GC2210@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:52429 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753026Ab2HHQdW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Aug 2012 12:33:22 -0400
In-Reply-To: <20120808161849.GC2210@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: linux-next@vger.kernel.org

On Wed, 2012-08-08 at 13:18 -0300, Arnaldo Carvalho de Melo wrote:=20
> Em Wed, Aug 08, 2012 at 06:05:50PM +0300, Andy Shevchenko escreveu:
> > util/symbol.c: In function =E2=80=98hex2u64=E2=80=99:
> > util/symbol.c:2836:2: error: passing argument 2 of =E2=80=98strtoul=
l=E2=80=99 from incompatible pointer type [-Werror]
> > In file included from util/symbol.c:3:0:
> > /usr/include/stdlib.h:215:31: note: expected =E2=80=98char ** restr=
ict=E2=80=99 but argument is of type =E2=80=98const char **=E2=80=99
> > cc1: all warnings being treated as errors
> > make[1]: *** [util/symbol.o] Error 1
> > make[1]: Leaving directory `/home/andy/prj/linux-2.6/tools/perf'
> > make: *** [perf] Error 2
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  tools/perf/util/symbol.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> > index ba2a489..26e695c 100644
> > --- a/tools/perf/util/symbol.c
> > +++ b/tools/perf/util/symbol.c
> > @@ -2831,7 +2831,7 @@ int machines__create_kernel_maps(struct rb_ro=
ot *machines, pid_t pid)
> >   */
> >  int hex2u64(const char *ptr, u64 *long_val)
> >  {
> > -	const char *p =3D ptr;
> > +	char *p;
> > =20
> >  	*long_val =3D strtoull(ptr, &p, 16);
>=20
> What tree is this against? Here I have:
Ah, it's a fix on top on mine other fix.
I'll resend squashed version soon.

>=20
> /*
>  * While we find nice hex chars, build a long_val.
>  * Return number of chars processed.
>  */
> int hex2u64(const char *ptr, u64 *long_val)
> {
>         const char *p =3D ptr;
>         *long_val =3D 0;
>=20
>         while (*p) {
>                 const int hex_val =3D hex(*p);
>=20
>                 if (hex_val < 0)
>                         break;
>=20
>                 *long_val =3D (*long_val << 4) | hex_val;
>                 p++;
>         }
>=20
>         return p - ptr;
> }
>=20
> - Arnaldo

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
