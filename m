From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160307 build: 2 failures 19 warnings (next-20160307)
Date: Tue, 8 Mar 2016 09:20:56 +0700
Message-ID: <20160308022056.GV18327@sirena.org.uk>
References: <E1actUq-0008MZ-EF@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="23hrj4x+a/NW4/cO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:42330 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932185AbcCHCVe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2016 21:21:34 -0500
Content-Disposition: inline
In-Reply-To: <E1actUq-0008MZ-EF@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Michal Nazarewicz <mina86@mina86.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@techsingularity.net>, Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--23hrj4x+a/NW4/cO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2016 at 11:38:44AM +0000, Build bot for Mark Brown wrote:

For the past week or so an arm64 allmodconfig has failed to build.  I've
not been able to perform a bisect to identify where as I've been
travelling but the errors are below, I suspect they are triggered by=20
recent changes in the akpm tree adding tracepoints to the page reference
code.

> 	arm64-allmodconfig
> ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'che=
ck_trace_callback_type_page_ref_set' from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
> ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'che=
ck_trace_callback_type_page_ref_mod' from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
> ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'che=
ck_trace_callback_type_page_ref_mod_and_test' from incompatible pointer typ=
e [-Werror=3Dincompatible-pointer-types]
> ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'che=
ck_trace_callback_type_page_ref_mod_and_return' from incompatible pointer t=
ype [-Werror=3Dincompatible-pointer-types]
> ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'che=
ck_trace_callback_type_page_ref_mod_unless' from incompatible pointer type =
[-Werror=3Dincompatible-pointer-types]
> ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'che=
ck_trace_callback_type_page_ref_freeze' from incompatible pointer type [-We=
rror=3Dincompatible-pointer-types]
> ../include/trace/trace_events.h:703:35: error: passing argument 1 of 'che=
ck_trace_callback_type_page_ref_unfreeze' from incompatible pointer type [-=
Werror=3Dincompatible-pointer-types]
> ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_=
callback_type_page_ref_set' from incompatible pointer type [-Werror=3Dincom=
patible-pointer-types]
> ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_=
callback_type_page_ref_mod' from incompatible pointer type [-Werror=3Dincom=
patible-pointer-types]
> ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_=
callback_type_page_ref_mod_and_test' from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
> ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_=
callback_type_page_ref_mod_and_return' from incompatible pointer type [-Wer=
ror=3Dincompatible-pointer-types]
> ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_=
callback_type_page_ref_mod_unless' from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
> ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_=
callback_type_page_ref_freeze' from incompatible pointer type [-Werror=3Din=
compatible-pointer-types]
> ../include/trace/perf.h:83:35: error: passing argument 1 of 'check_trace_=
callback_type_page_ref_unfreeze' from incompatible pointer type [-Werror=3D=
incompatible-pointer-types]
> ../mm/debug_page_ref.c:8:21: error: passing argument 1 of 'trace_page_ref=
_set' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> ../mm/debug_page_ref.c:15:21: error: passing argument 1 of 'trace_page_re=
f_mod' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> ../mm/debug_page_ref.c:22:30: error: passing argument 1 of 'trace_page_re=
f_mod_and_test' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
> ../mm/debug_page_ref.c:29:32: error: passing argument 1 of 'trace_page_re=
f_mod_and_return' from incompatible pointer type [-Werror=3Dincompatible-po=
inter-types]
> ../mm/debug_page_ref.c:36:28: error: passing argument 1 of 'trace_page_re=
f_mod_unless' from incompatible pointer type [-Werror=3Dincompatible-pointe=
r-types]
> ../mm/debug_page_ref.c:43:24: error: passing argument 1 of 'trace_page_re=
f_freeze' from incompatible pointer type [-Werror=3Dincompatible-pointer-ty=
pes]
> ../mm/debug_page_ref.c:50:26: error: passing argument 1 of 'trace_page_re=
f_unfreeze' from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

--23hrj4x+a/NW4/cO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW3jcHAAoJECTWi3JdVIfQcK8H/1wsdP6nh7IkD95RlkAXcfki
BxKJ2UXylSlaMhTm8BdE8Zv1hKhRsnIZw4yg4Eo64xgSsWAQMUlG6NVItKARm/MG
G9mAXrka9mN+fZA8cYMxtQkFJG4WDyDMsoaS5eLirrISMGiK1tiYpBF4e25eFr3l
lCuHXYPhkfWmrDpFJWNVdnKf5ungUm9BKmfxZesfmz5ZFXDUgiLPDQJvvug5HjTJ
Rp8XWsMZdpAdwXLw/37ckZ31CFhifgobo9PBvTNUjiPfo8YOYg2BlFb9sjYUFWe9
v/34nwokL+zKjC7gccqVa7adyiWoeF9TSkMoB4SZ2NyQAlk88Ri5a5ts6CxUEHE=
=3d58
-----END PGP SIGNATURE-----

--23hrj4x+a/NW4/cO--
