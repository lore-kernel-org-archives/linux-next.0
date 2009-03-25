From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpus4096 tree with the x86 tree
Date: Wed, 25 Mar 2009 11:46:03 +1100
Message-ID: <20090325114603.9d436880.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Mar_2009_11_46_03_+1100_LISkIe95O4eceJ1B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54270 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756784AbZCYAqR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Mar 2009 20:46:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mark Langsdorf <mark.langsdorf@amd.com>

--Signature=_Wed__25_Mar_2009_11_46_03_+1100_LISkIe95O4eceJ1B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cpus4096 tree got a conflict in
arch/x86/kernel/cpu/intel_cacheinfo.c between commit
45ca863a40306ccc99c68d13421b6577240760ca ("x86, cpu: conform L3 Cache
Index Disable to Linux standards") from the x86 tree and commit
ba1d755a36f66101aa88ac9ebb54694def6ec38d ("fix warning in
arch/x86/kernel/cpu/intel_cacheinfo.c") from the cpus4096 tree.

The former removed the code modified by the latter.  I fixed it up (by
removing the definition of k8_nb_id) and can carry the fix as necessary.
This fix is different to what appears in tip/master as that tree
currently doesn't appear to have the above x86 tree commit in it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Mar_2009_11_46_03_+1100_LISkIe95O4eceJ1B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknJfssACgkQjjKRsyhoI8xDLQCgi/2f72C23SMAbdLROrMKuP7Y
XtsAniEOT8oyANZl55p1Rqjtw15NGMSi
=TLjo
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Mar_2009_11_46_03_+1100_LISkIe95O4eceJ1B--
