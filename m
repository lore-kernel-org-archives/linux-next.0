From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the stackprotector tree
Date: Fri, 15 Aug 2008 13:29:32 +1000
Message-ID: <20080815132932.71f3f0da.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_13_29_32_+1000_gUfQNWgOsXQAM=YS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34651 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183AbYHOD3m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 23:29:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Eric Sandeen <sandeen@sandeen.net>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

--Signature=_Fri__15_Aug_2008_13_29_32_+1000_gUfQNWgOsXQAM=YS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the stackprotector tree got a trivial
conflict in kernel/fork.c between commit
177a5f86ba5f60c783e24603bedf037d6c43a193 ("tracing, sched: LTTng
instrumentation - scheduler") from the ftrace tree and commit
7c9f8861e6c9c839f913e49b98c3854daca18f27 ("stackprotector: use canary at
end of stack to indicate overruns at oops time") from the stackprotector
tree.

Just overlapping additions of includes.  I added both.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_13_29_32_+1000_gUfQNWgOsXQAM=YS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkik+BwACgkQjjKRsyhoI8z9dACgpVYt4LIHlFTLTPfpfUyUALvJ
N9gAn0pwUWnppTJCsmhBH4zY5bWN8kLE
=mV6b
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_13_29_32_+1000_gUfQNWgOsXQAM=YS--
