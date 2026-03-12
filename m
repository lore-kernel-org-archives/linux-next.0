Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9767F35AC2D;
	Thu, 12 Mar 2026 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325488; cv=none; b=DX3nIZitSNyqL5XiI9lOTovdqRmpScaa93OfBZ1+WJjIt3KRORzQHJfpM2hQv5MMu1isezUNPLzJN9nchMBykkAOwwdwAULYx31MZNE4sdTaN0jLfOJ5Th9bPAOkZmigbFPaX6MkAVFWhPrMlO/IhsOvLVPBASvrbxVZ7FIcK+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325488; c=relaxed/simple;
	bh=VnUdqdKGmi7YB9G5704IG40wAwJkjp7awuikqy9TNC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2TZHHECnn7OEY/M/tGPUJcTaB8aUuSWdr3GiOYoGiRPPnlEarEq8gj6AnmrhfvPIwRgOQCI24DX5Sf+KIyBe7tp3Yk3VboraSn15VhBVKbtF2a7E0fofuX9CStCXRe90PQ6HDbjCqW4MxUBp7wxPkQvQMbdbIQPmfNcxgXGIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK/mOIGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK/mOIGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A786C2BC87;
	Thu, 12 Mar 2026 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773325488;
	bh=VnUdqdKGmi7YB9G5704IG40wAwJkjp7awuikqy9TNC8=;
	h=Date:From:To:Cc:Subject:From;
	b=lK/mOIGA5/gHPkDSqdo0x3gr6ZqCHXv4KRSZYp9eS7halVrvO2uOCPFMnR6XOALzE
	 xM8FMu9yRk+URrJo8NmSunwpTcRGRyFQ+h0N2R9U38tPz+lL2p7uYxnoS3CO/pw3tK
	 dulnSJqfCPaDPMdIUNwkRCGa+OvbvmR4P1f11gSEgfSSF+dvqzNT4sYbJRc7JvZ59D
	 mx67RDPYQjJO2rtuiJcbPvTv6qbtsy3NBdi1kHXQBHiX9EC6s8GgKDC5PU6fHfK6Ya
	 j+74DTs3bYhl+CXd25+g1sBGqWHzuoawuAIlwHEybpYPelOfcHll4DlyVAbuDFCbHI
	 ogqw61WYUiFEw==
Date: Thu, 12 Mar 2026 14:24:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the mm-unstable tree
Message-ID: <abLMq8TWJIQH5uTj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e1EfMZ8c/ywb99BO"
Content-Disposition: inline


--e1EfMZ8c/ywb99BO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  init/main.c

between commit:

  e91e16820a507 ("lib: introduce hierarchical per-cpu counters")

=66rom the mm-unstable tree and commit:

  05988dba11791 ("vdso/datastore: Allocate data pages dynamically")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc init/main.c
index 13aeb7834111a,de867b2693d21..0000000000000
--- a/init/main.c
+++ b/init/main.c
@@@ -105,7 -105,7 +105,8 @@@
  #include <linux/ptdump.h>
  #include <linux/time_namespace.h>
  #include <linux/unaligned.h>
 +#include <linux/percpu_counter_tree.h>
+ #include <linux/vdso_datastore.h>
  #include <net/net_namespace.h>
 =20
  #include <asm/io.h>

--e1EfMZ8c/ywb99BO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyzKoACgkQJNaLcl1U
h9ATPQf/VfapW32FWZ54qj8YBzRYuc+YHxP+yoM4Lca6Dbn+cmO31KHJtXygQ2mf
3vt6ZSkxlaZ8Vd1+mM9upKka1gUi0jvI+LVTLrDI4SiXylFIDQ8bBykGKCsoQlLh
cfhRC4a7qPDW4rWtK8lm3d6Z3HJi+HSEXEwjXf1/HR5GjYvDf3ptdRRc6BIuBgjR
n4dzKEesk6Y+oUZnmIAeAztjkuYqkwkv1X7GEb+jlz9q7pJCfNzj4tsb6IcuroBg
tKk+RxbTaUFt7L98iXJNVAPr2SH7oZ6ZyQr6jxLRTr7zVE36mqA8aklK6CQAHEkB
yQIZ9CFPRxsCplLiM45LcDAh93VkUQ==
=MDzj
-----END PGP SIGNATURE-----

--e1EfMZ8c/ywb99BO--
