From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Tue, 22 Jul 2008 14:58:38 +1000
Message-ID: <20080722145838.9248b80a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_14_58_38_+1000_tnFY0wh3Z+fBJNiQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53927 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbYGVE6t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 00:58:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Tue__22_Jul_2008_14_58_38_+1000_tnFY0wh3Z+fBJNiQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/stop_machine.c between commit
65c011845316d3c1381f478ca0d8265c43b3b039 ("cpumask: Replace
cpumask_of_cpu with cpumask_of_cpu_ptr") from the cpus4096 tree and
commit 775664f6fd1530f5c90a7e55984459fd8cbb74a5 ("stop_machine:simplify")
(and some later commits) from the rr tree.

The update done in the former seems not to be needed any more, so I used
the version of this file from the rr tree.  Someone should check.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_14_58_38_+1000_tnFY0wh3Z+fBJNiQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFaP4ACgkQjjKRsyhoI8zHKwCdHm20x4B+xXb5sWc0Wu9YjRUO
lSQAoIKnrXwvkdO0Ukec5ml8T8Lr+ER/
=Zhvm
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_14_58_38_+1000_tnFY0wh3Z+fBJNiQ--
