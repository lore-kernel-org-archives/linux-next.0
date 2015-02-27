From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Fri, 27 Feb 2015 14:08:55 +1100
Message-ID: <20150227140855.74020ea4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6tCuI25c1jYJ+UyRB.ccdF."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46825 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752251AbbB0DJH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Feb 2015 22:09:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>

--Sig_/6tCuI25c1jYJ+UyRB.ccdF.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

After merging the clk tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/trace/define_trace.h:90:0,
                 from include/trace/events/clk.h:198,
                 from drivers/clk/clk.c:26:
include/trace/events/clk.h: In function 'ftrace_get_offsets_clk':
include/trace/events/clk.h:30:40: error: dereferencing pointer to incomplet=
e type
   __string(        name,           core->name       )
                                        ^
include/trace/ftrace.h:465:2: note: in definition of macro 'DECLARE_EVENT_C=
LASS'
  tstruct;       \
  ^
include/trace/events/clk.h:29:2: note: in expansion of macro 'TP_STRUCT__en=
try'
  TP_STRUCT__entry(
  ^
include/trace/ftrace.h:430:29: note: in expansion of macro '__dynamic_array'
 #define __string(item, src) __dynamic_array(char, item,   \
                             ^
include/trace/events/clk.h:30:3: note: in expansion of macro '__string'
   __string(        name,           core->name       )
   ^

and many more ...

Caused by commit 0742a46667e3 ("clk: Add tracepoints for hardware
operations").

I have used the version of the clk tree from next-20150225 for today
(since yesterday's tree had a different build problem).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/6tCuI25c1jYJ+UyRB.ccdF.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU79/MAAoJEMDTa8Ir7ZwV9cQP/0xOigcc0uCqNo/wnsUEF0Xb
fsm6Gi4FeV36DgGtyKVr92/9VLUcq+M3bnQkkm8grqvG04lQL5hSsdxsrF6LRqIj
Azz2OdXWCJnqBgMjMPC78scwf2Zu2C5YQpBksKf+NwxLOx1L6XuGi9mDS0pZkaoM
2vqsKFea6CbBcomIPoDvwrl8KQDgcEHOo7GahDS4KJeRxSC746MLGctyA7+5+BKU
ZNW/u6x1ksIL6/rskHnmhkwNUvwwTMRxW/qgEZmhB5mh2rgpjZCZ2GkKy6Uk3WmI
5v0TlxAJw75gdX3wSk9bujY9kx23EjOL/lXHKoh0j9yYxb1NSm1glEtZVi8Id3ce
1cI8qfYeaKQTBTcLnbNwWjl6gS+XJG7sT1keEnalUhep3gSn2bOGN8usSaEmrt0e
GIfvrdu6fnZDWqeHYIqY5dJOndZWYfzTi9fza94Cy3vPaZqtVR460MpLESCZDqlo
MhRNlsE+ZKrCejN01z2Zwp1Nzy2I66cml0fPHplVaYaPhcRUMOoa/W+Gzhd/nR3U
NGwD7+nJ+RezDdO3b6XErQdw5AaXncu4kzkumxbRksesDDD7jD6pJ8elorp/ISsE
Hn47L1cm5B+VLXyGOvRm7MoL0h2WKPxsjnD3tJh7+nUWPFcShyqlLScNCe+s/cQ2
A/npyyn7y7howa+eU5FV
=LArK
-----END PGP SIGNATURE-----

--Sig_/6tCuI25c1jYJ+UyRB.ccdF.--
