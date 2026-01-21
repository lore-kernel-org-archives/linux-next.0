Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E76335073;
	Wed, 21 Jan 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012020; cv=none; b=ZZBAkQqKBnUikbbHilOk+jBwe05OCY4N1vjx/Qitr76htJhHpN8G3nwwTtp1lvmsHfn/5abCNrETncR84GkgYKMT2PZwN1dDoRbvs7uMnQDgjCZPA9bnX9MRUjvOCW6GmejQdCE30LgN7IVl8CkyD07zzGKTsFGu13OqEaNAumc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012020; c=relaxed/simple;
	bh=k7ybXQyeTG/2ccuLUHQXXMjT/RjzupbpuqjFTU4XYTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KgeZKJFaVb0qTE0eyvZIs7fdIPkYABoyGSHa1dunbs5+QibveX8dO5MTpsksSNYl3Jc53nQ/jzWfP21hzrM/V1Z3A7oZywxawYWOpKkGjairv9WUeLLF29CsK0MFjxp9PqZJiVzqHOU2sT5Vi5fx3igCKhMrR6SGylPNBshS/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9jDlKhn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9jDlKhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F379C4CEF1;
	Wed, 21 Jan 2026 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012019;
	bh=k7ybXQyeTG/2ccuLUHQXXMjT/RjzupbpuqjFTU4XYTg=;
	h=Date:From:To:Cc:Subject:From;
	b=U9jDlKhna1CB5+1JpEln/eIiTQFQbRgDhsUQusUgxIeNOacOWzqg4fPE5H4Ye4F+l
	 aLTxRin18oIKCnKOYJ0s1vzOEeFfzHfnUey84usW00Cc1R4/qT9aswpqRTQzsoSHFB
	 mUcbWBtzTRMoW1Sk2TlGhwtGwSx5IyVfmn1v6KZX+F1Mz+NHbrj2PIB3PwHfQgFb2w
	 Hsdv8GasJYle7zdiKeuxmmdDJlB+x7aYyoGG1VpRscLsdaq0bMn7hKW2E1P8/Bxny8
	 H6vvhUCZE3+6hYX/vlQmKzT6OwOnA5253Zzxy4xhP0Djt/eu1TZTDtDq+7mCF0YtEI
	 KUiU7JW6OxR0w==
Date: Wed, 21 Jan 2026 16:13:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the kthread tree with the risc-v tree
Message-ID: <aXD7L7Ivizu4HRY0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZVPxxG/cmXpbrfe9"
Content-Disposition: inline


--ZVPxxG/cmXpbrfe9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kthread tree got a conflict in:

  include/linux/cpu.h

between commit:

  d3d1efd48b3b6 ("prctl: add arch-agnostic prctl()s for indirect branch tra=
cking")

=66rom the risc-v tree and commit:

  658d3c155c301 ("sched/arm64: Move fallback task cpumask to HK_TYPE_DOMAIN=
")

=66rom the kthread tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/cpu.h
index 8239cd95a0053,0b48af25ab5cb..0000000000000
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@@ -229,8 -229,8 +229,12 @@@ static inline bool cpu_attack_vector_mi
  #define smt_mitigations SMT_MITIGATIONS_OFF
  #endif
 =20
 +int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __us=
er *status);
 +int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long stat=
us);
 +int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long sta=
tus);
 +
+ struct cpumask;
+=20
+ bool arch_isolated_cpus_can_update(struct cpumask *new_cpus);
+=20
  #endif /* _LINUX_CPU_H_ */

--ZVPxxG/cmXpbrfe9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlw+y4ACgkQJNaLcl1U
h9DPqQf/U9uCOeAHCwMJ6XgBraj84r3SBMLW3roK4sj5qLt4dgmH+mr4xAEiOLiN
acSP5wsN7q+G84YhrUt9QXySMJ7MVPIJUYSSlUKJ0IIH+4rb5z/m71xhyQY49LuP
w4Tzv8dbi2Yk87HA78sMuDQmlniFfSu+QZn8dBC+BBfvHzCOzk2p6td9GQYDbqHt
ozNAyOzc7zPasPuZsjhgsYmbcaFvioX2d5ALCFdKW8j9rwjxkYOleyYfTxP245pe
+3suFhwbloMeXN0PqIvrZm6kphJsEY22nS6vDvAjZEZYAmh7+9XSyyqTq2HXY/np
Dp4rkUrUU1mHh/QKPpmK6wuN7ZKdGA==
=+Bzh
-----END PGP SIGNATURE-----

--ZVPxxG/cmXpbrfe9--
