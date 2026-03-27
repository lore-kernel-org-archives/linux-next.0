Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E92C11E7;
	Fri, 27 Mar 2026 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646258; cv=none; b=WJ6v6jS2tLYQblsoBgoO9UBfkwZhN9kW+8KOn90DHcNzpB/+qSs4sSg/ldDkteIbUN9fds2YWtdPeNskMmp5QBjRKJTS7KTk5/vlEWX3QxvTpczpqa/7/4H75xa1Gwhlwy4SrCxlQtjGEGuHo77DXOsF1gPu/tDsYu52sLsr7n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646258; c=relaxed/simple;
	bh=CjEDGY0tAuHvIY5hWRI9dPigIJFARzdGDxW9cTSOvRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKYyx4eL93HpWiNShgVbMkRJK9G5cFJLZ4TMjsNoij8SdVtHfWWz5lTV82ITcOELRvVp4+8np4N2zgJk+iQaqWYmj2uAoss0ODMYXD3fcZWPO5Xfjr6Nbg7ty5ZCTXvx9GIipVNDrtFhe75toBtb3aGaJc1HrmkxmN1aEkyd8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDHKdh1K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDHKdh1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13709C19423;
	Fri, 27 Mar 2026 21:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774646258;
	bh=CjEDGY0tAuHvIY5hWRI9dPigIJFARzdGDxW9cTSOvRw=;
	h=Date:From:To:Cc:Subject:From;
	b=KDHKdh1KN74OWy4qrEkCKk981sStd4NXAFidtJg9QkLiNgqbm7Wc6zQjQ2pi7nOjd
	 aojc4I8iZ/VhJw2thbw5s7wRvP/F9qeOTVOOrhwvcXIjfbtVpO79/WdSEX/b7r+LOT
	 BJHyICnA1xsKcwukRTvSpC5Z+CzDqTGqcYEa4Z3Q3Kz4DKPG9jMXNf1CA2/utmojG2
	 5tnoL8ICc5RcvRoCfWUYC5HcFY9reWxotJ4CnY2CufFbSod4aUvQQMEsPcuVdkQBOV
	 wIHXNt0azhi+gG6KrsTb7Es6Ql6Gqc7QOxMzAx4evYQNrFZc+F/TSPW7ixiRsdXUQh
	 JyS6i9VR1GFxQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 35E7D1AC589B; Fri, 27 Mar 2026 21:17:35 +0000 (GMT)
Date: Fri, 27 Mar 2026 21:17:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the mm-unstable tree
Message-ID: <acbz78Mbv55Vzfh8@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6DJXvk+iuginc0tG"
Content-Disposition: inline


--6DJXvk+iuginc0tG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  lib/vdso/datastore.c

between commit:

  5f5ffe21e7530e ("mm: rename zap_vma_pages() to zap_vma()")

=66rom the mm-unstable tree and commit:

  5dc9cf835aba73 ("vdso/timens: Move functions to new file")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc lib/vdso/datastore.c
index 222c143aebf764,cf5d784a4a5a14..00000000000000
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
diff --git a/kernel/time/namespace_vdso.c b/kernel/time/namespace_vdso.c
index 88c075cd16a361..0d74d160eec98b 100644
--- a/kernel/time/namespace_vdso.c
+++ b/kernel/time/namespace_vdso.c
@@ -134,7 +134,7 @@ static int vdso_join_timens(struct task_struct *task, s=
truct time_namespace *ns)
 	guard(mmap_read_lock)(mm);
 	for_each_vma(vmi, vma) {
 		if (vma_is_special_mapping(vma, &vdso_vvar_mapping))
-			zap_vma_pages(vma);
+			zap_vma(vma);
 	}
 	return 0;
 }

--6DJXvk+iuginc0tG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG8+4ACgkQJNaLcl1U
h9DKeQf/doSg9rcAgXXM7adVk35r3XZzDOENrebDitMNt3p2UbOqZ8p/7irubM6U
STHwjGYvbfnT7W0DRYyPBRWQ63IfleS5f7rFDpWjUWio2STEXjw+ZnImWPwJLsXm
ERJMWiRKc35uUjcDPjVofqBCwi9qUgIiLPUJLG3+6LNjGfYQf0GPVq4niaqA2Gic
ZCmljs2uZB3o3+7vaAIn3zPsmpOII4X/z1gmoLjwWksZdjmYNNI4jMomJNvR1OJl
rtdcsReSb8wNcHeu6AwNksbo2GXasx7iJNLblDIwUSqwlt/gogyRo31DoySK89jg
htM7Czqki2JPbApwHyXlYHjNIfkaTA==
=beHl
-----END PGP SIGNATURE-----

--6DJXvk+iuginc0tG--
