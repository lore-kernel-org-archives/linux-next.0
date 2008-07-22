From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sched tree
Date: Tue, 22 Jul 2008 11:58:23 +1000
Message-ID: <20080722115823.782a4c49.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_11_58_23_+1000_Zi7svDep1mM9rwY3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54324 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750698AbYGVB6a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 21:58:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Max Krasnyansky <maxk@qualcomm.com>

--Signature=_Tue__22_Jul_2008_11_58_23_+1000_Zi7svDep1mM9rwY3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched tree got a conflict in
kernel/sched_fair.c between commit
363ab6f1424cdea63e5d182312d60e19077b892a ("core: use performance variant
for_each_cpu_mask_nr") from the cpus4096 tree and commit
e761b7725234276a802322549cee5255305a0930 ("cpu hotplug, sched: Introduce
cpu_active_map and redo sched domain managment") from the sched tree.

Overlapping addition/modification in wake_idle.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_11_58_23_+1000_Zi7svDep1mM9rwY3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFPr8ACgkQjjKRsyhoI8wUqQCfezN4Rrth1Vh0ZXIq5H02e9iS
15sAnijs5truEpxe5tHBdxiRCewRi2Lp
=kZ3h
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_11_58_23_+1000_Zi7svDep1mM9rwY3--
