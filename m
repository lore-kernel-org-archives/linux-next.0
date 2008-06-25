From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Wed, 25 Jun 2008 16:27:31 +1000
Message-ID: <20080625162731.94f69298.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_16_27_31_+1000_bbFXQ_E_c5kIZqmI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45612 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753230AbYFYG1m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 02:27:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__25_Jun_2008_16_27_31_+1000_bbFXQ_E_c5kIZqmI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/stop_machine.c between commit
961ccddd59d627b89bd3dc284b6517833bbdf25d ("sched: add new API
sched_setscheduler_nocheck: add a flag to control access") from the sched
tree (which is also in the rr tree) and commit
179da75b083a098ba6192c0900611a92091abfc9 ("stop_machine:simplify") from
the rr tree.

I just took the rr tree version since the former is in both trees.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_16_27_31_+1000_bbFXQ_E_c5kIZqmI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhh5VMACgkQTgG2atn1QN/zAwCdHbUtIGESwTxCEaWvc2oBaCwI
TCAAnAqocLkTE/EtSOBQxCYZUuGKV9zR
=8OJJ
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_16_27_31_+1000_bbFXQ_E_c5kIZqmI--
