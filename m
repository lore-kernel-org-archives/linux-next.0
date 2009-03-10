From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tracing tree build failure
Date: Tue, 10 Mar 2009 11:55:09 +1100
Message-ID: <20090310115509.328da465.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Mar_2009_11_55_09_+1100_MylDBlf+wFja2lxO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56105 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751573AbZCJAzU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Mar 2009 20:55:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>

--Signature=_Tue__10_Mar_2009_11_55_09_+1100_MylDBlf+wFja2lxO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

kernel/trace/trace_functions_graph.c: In function 'graph_trace_close':
kernel/trace/trace_functions_graph.c:836: error: implicit declaration of fu=
nction 'percpu_free'

The direct cause is commit 422d3c7a577b15e1384c9d4e72a9540896b685fa
("tracing: current tip/master can't enable ftrace") from the tracing tree
which exposed an interaction between commit
f2a8205c4ef1af917d175c36a4097ae5587791c8 ("percpu: kill percpu_alloc()
and friends") from the tip-core tree and commit
9005f3ebebfcfe9ccd731d16c468907a35ac1f9a ("tracing/function-graph-tracer:
various fixes and features") from the tracing tree.

I have reverted commit 422d3c7a577b15e1384c9d4e72a9540896b685fa for
today.  (As a side note, that commit has no Signed-off-by ...)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Mar_2009_11_55_09_+1100_MylDBlf+wFja2lxO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm1um0ACgkQjjKRsyhoI8y6MwCfa2WPMMS62d6X1RuzQr4UIX84
y64An3tANFxNB9e9vqc6VfzgztuBTQZ6
=KFFx
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Mar_2009_11_55_09_+1100_MylDBlf+wFja2lxO--
