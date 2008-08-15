From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tests tree
Date: Fri, 15 Aug 2008 14:59:48 +1000
Message-ID: <20080815145948.690f8529.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_14_59_48_+1000_OOviAie+dlf4ZVq/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39764 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750790AbYHOE75 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 00:59:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Fri__15_Aug_2008_14_59_48_+1000_OOviAie+dlf4ZVq/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ananth,

Today's linux-next merge of the tests tree got a conflict in
lib/Kconfig.debug between commit 67182ae1c42206e516f7efb292b745e826497b24
("rcu, debug: detect stalled grace periods") from the sched tree and
commit 2b9b631dd2507b5480b752bcca946b9767b9bae1 ("Move rcutorture to
tests/") from the tests tree.

I sort of fixed it up.

Ananth, you should try to get the testing stuff into Linus' tree ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_14_59_48_+1000_OOviAie+dlf4ZVq/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilDUQACgkQjjKRsyhoI8wySgCfY5heoAEESMj9kmDQgKocPKla
9e8AoIVhzszwB5deqbYAkl/IIjaAI6gK
=5UBz
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_14_59_48_+1000_OOviAie+dlf4ZVq/--
