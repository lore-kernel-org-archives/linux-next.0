From: Michel Lespinasse <walken@google.com>
Subject: Re: [PATCH] rbtree: fix perf compilation
Date: Mon, 6 Aug 2012 03:34:46 -0700
Message-ID: <20120806103446.GA15179@google.com>
References: <1344248036-9602-1-git-send-email-alexander.shishkin@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:54466 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754171Ab2HFKev (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Aug 2012 06:34:51 -0400
Received: by pbbrr13 with SMTP id rr13so2394730pbb.19
        for <linux-next@vger.kernel.org>; Mon, 06 Aug 2012 03:34:50 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1344248036-9602-1-git-send-email-alexander.shishkin@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>

On Mon, Aug 06, 2012 at 01:13:56PM +0300, Alexander Shishkin wrote:
> Commit 2cfaf9cc68190c24fdd05e4d104099b3f27c7a44 (rbtree: adjust root =
color
> in rb_insert_color() only when necessary) introduces bool type and co=
nstants
> to the rbtree.c, and breaks compilation of tools/perf:
>=20
> > ../../lib/rbtree.c: In function =E2=80=98rb_insert_color=E2=80=99:
> > ../../lib/rbtree.c:95:9: error: =E2=80=98true=E2=80=99 undeclared (=
first use in this function)
> > ../../lib/rbtree.c:95:9: note: each undeclared identifier is report=
ed only once
> > for each function it appears in
> > ../../lib/rbtree.c: In function =E2=80=98__rb_erase_color=E2=80=99:
> > ../../lib/rbtree.c:216:9: error: =E2=80=98true=E2=80=99 undeclared =
(first use in this function)
> > ../../lib/rbtree.c: In function =E2=80=98rb_erase=E2=80=99:
> > ../../lib/rbtree.c:368:2: error: unknown type name =E2=80=98bool=E2=
=80=99
> > make: *** [util/rbtree.o] Error 1
>=20
> This patch is the easiest solution I can think of.
>=20
> Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com=
>
> ---
>  tools/perf/Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/perf/Makefile b/tools/perf/Makefile
> index 77f124f..2f7a86c 100644
> --- a/tools/perf/Makefile
> +++ b/tools/perf/Makefile
> @@ -802,7 +802,7 @@ $(OUTPUT)ui/browsers/map.o: ui/browsers/map.c $(O=
UTPUT)PERF-CFLAGS
>  	$(QUIET_CC)$(CC) -o $@ -c $(ALL_CFLAGS) -DENABLE_SLFUTURE_CONST $<
> =20
>  $(OUTPUT)util/rbtree.o: ../../lib/rbtree.c $(OUTPUT)PERF-CFLAGS
> -	$(QUIET_CC)$(CC) -o $@ -c $(ALL_CFLAGS) -DETC_PERFCONFIG=3D'"$(ETC_=
PERFCONFIG_SQ)"' $<
> +	$(QUIET_CC)$(CC) -o $@ -c $(ALL_CFLAGS) -DETC_PERFCONFIG=3D'"$(ETC_=
PERFCONFIG_SQ)"' -include stdbool.h $<
> =20
>  $(OUTPUT)util/parse-events.o: util/parse-events.c $(OUTPUT)PERF-CFLA=
GS
>  	$(QUIET_CC)$(CC) -o $@ -c $(ALL_CFLAGS) -Wno-redundant-decls $<
> --=20

Acked-by: Michel Lespinasse <walken@google.com>

Copying Andrew as this probably needs to go through his tree along
with the rbtree patches.

--=20
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
