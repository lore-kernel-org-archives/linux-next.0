From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Wed, 26 Nov 2008 21:29:20 +1100
Message-ID: <20081126212920.f992f7a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Nov_2008_21_29_20_+1100_AH/MQBAGYs1rBFAx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39387 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751364AbYKZK3i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 05:29:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>

--Signature=_Wed__26_Nov_2008_21_29_20_+1100_AH/MQBAGYs1rBFAx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

In file included from block/blk-core.c:31:
include/trace/block.h:9:15: error: macro "DEFINE_TRACE" passed 3 arguments,=
 but takes just 1
In file included from block/blk-core.c:31:
include/trace/block.h:7: warning: data definition has no type or storage cl=
ass
include/trace/block.h:7: warning: type defaults to 'int' in declaration of =
'DEFINE_TRACE'

and many more.  This is caused by commit
714d010b5c249c2e9282515e0a2309a61ababbf4 ("blktrace: port to
tracepoints") interacting with commit
7e066fb870fcd1025ec3ba7bbde5d541094f4ce1 ("tracepoints: add DECLARE_TRACE
() and DEFINE_TRACE()") which entered linux-next for the first time today
via the ftrace tree. This latter commit has changed the tracepoints API.

I will drop the block tree for today.  I am not sure of the way forward.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Nov_2008_21_29_20_+1100_AH/MQBAGYs1rBFAx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkktJQAACgkQjjKRsyhoI8zqrwCfY3O8yFMR9FijWS/pOrck4PUp
0pMAoIBEsC47Jolf8Nuea+J/1CaklmyV
=xiFu
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Nov_2008_21_29_20_+1100_AH/MQBAGYs1rBFAx--
