From: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Subject: Re: [PATCH] tools/perf: fix build when WERROR=1
Date: Wed, 8 Aug 2012 13:18:49 -0300
Message-ID: <20120808161849.GC2210@infradead.org>
References: <1344438350-22574-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:60361 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758763Ab2HHQS7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Aug 2012 12:18:59 -0400
Received: by ggdk6 with SMTP id k6so225185ggd.19
        for <linux-next@vger.kernel.org>; Wed, 08 Aug 2012 09:18:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1344438350-22574-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>

Em Wed, Aug 08, 2012 at 06:05:50PM +0300, Andy Shevchenko escreveu:
> util/symbol.c: In function =E2=80=98hex2u64=E2=80=99:
> util/symbol.c:2836:2: error: passing argument 2 of =E2=80=98strtoull=E2=
=80=99 from incompatible pointer type [-Werror]
> In file included from util/symbol.c:3:0:
> /usr/include/stdlib.h:215:31: note: expected =E2=80=98char ** restric=
t=E2=80=99 but argument is of type =E2=80=98const char **=E2=80=99
> cc1: all warnings being treated as errors
> make[1]: *** [util/symbol.o] Error 1
> make[1]: Leaving directory `/home/andy/prj/linux-2.6/tools/perf'
> make: *** [perf] Error 2
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  tools/perf/util/symbol.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index ba2a489..26e695c 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -2831,7 +2831,7 @@ int machines__create_kernel_maps(struct rb_root=
 *machines, pid_t pid)
>   */
>  int hex2u64(const char *ptr, u64 *long_val)
>  {
> -	const char *p =3D ptr;
> +	char *p;
> =20
>  	*long_val =3D strtoull(ptr, &p, 16);

What tree is this against? Here I have:

/*
 * While we find nice hex chars, build a long_val.
 * Return number of chars processed.
 */
int hex2u64(const char *ptr, u64 *long_val)
{
        const char *p =3D ptr;
        *long_val =3D 0;

        while (*p) {
                const int hex_val =3D hex(*p);

                if (hex_val < 0)
                        break;

                *long_val =3D (*long_val << 4) | hex_val;
                p++;
        }

        return p - ptr;
}

- Arnaldo
