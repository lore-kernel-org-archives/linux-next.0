Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2667948C408;
	Wed, 17 Jun 2026 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708568; cv=none; b=rE0jkt9H8WqqWVjPKXNb7aKJ+Yay3rK22W37RUPJNSWp06kQCM1hRJArPFPuYWYw17o1qi7LnP4OXgnEE0QtuVoizGwdH27QpCymWplh93ALHSyWVF9uefEGqZ3gNaQOByzmZFFb5b5S03F7DgWDtqYYYBYDtdaUvIUndYI0TgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708568; c=relaxed/simple;
	bh=gNuEwayK4N/yCRTo+8eeI1tVJKZjalAt41N1P4jZDcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYlUDd8r82jBESjI3LcPQ2Ir6FxIfAwhxEk6JVnPZsiSEwlbeRY1oSwZzAY54Nu40iH5KtUktjo4Bx9Q2+kQcY0mIUxi5AzJQStmWK2as12HY5zDyJI/wt8lbayZzttcIyUHFDbYShZfSb6Ah5pxYVz0V409BaJSBTwyn17X03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmlfE6ec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmlfE6ec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43791F00A3A;
	Wed, 17 Jun 2026 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781708567;
	bh=u50suawXPLHXN4ESd/Djo8wO29GKHYGKx5IPSsOMmHg=;
	h=Date:From:To:Cc:Subject;
	b=dmlfE6ecGSh4p6ZB4fE49RYsPCUh1EGMDw8D5zP395rIsN+aYzJ3tAsuQZY2IKc3P
	 g/Yue39f+WcmTKRn9ANLH8U94LuyBOa1NCQTsqxpkYZHxpFm3+CfnN/7UqwzIfKVz+
	 jJABgnwUwbjI1DC64O+PNz3CPc8dKyKknKXCq2wv/EL6I7tacm3TRn6lsWEz3Fsrh8
	 DUwtXQ8jux0c4/S/XciEm0HGkpNynuzRQtFgJQWth6VzQIQ5QL4u4siEMLHsaoMvaA
	 benKTmy74ox+c0cm35eHBA8JEuTnFgnsy0OMI2s2vsqyXKCw4lYLOzGsOhZ+R+STg5
	 WffdrfFVyJTDQ==
Date: Wed, 17 Jun 2026 16:02:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alan Maguire <alan.maguire@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <ajK3E_9sm1up6soi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ck2fegGB3rBXuoHy"
Content-Disposition: inline


--ck2fegGB3rBXuoHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (perf.log perf)
failed like this:

util/btf.c: In function '__btf_type__find_member_by_name':
util/btf.c:19:43: error: comparison of integer expressions of different sig=
nedness: 'int' and '__u32' {aka 'unsigned int'} [-Werror=3Dsign-compare]
   19 |         for (i =3D 0, m =3D btf_members(t); i < btf_vlen(t); i++, m=
++) {
      |                                           ^
cc1: all warnings being treated as errors

Triggered by commit:

   f7a6b9eaff3e6 (bpf: Extend BTF UAPI vlen, kinds to use unused bits)

This was dealt with in -next as part of a conflict resolution,
converting i to a u32, but that doesn't seem to have been picked up
anywhere.  I will apply the fixup below (which I'll also send
separately).

=46rom 47cd4a2a08f874af25930c14437633af43a4a69c Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Wed, 17 Jun 2026 13:42:10 +0100
Subject: [PATCH] perf: Fix up build failure due to bpf changes

Fix

util/btf.c: In function '__btf_type__find_member_by_name':
util/btf.c:19:43: error: comparison of integer expressions of different sig=
nedness: 'int' and '__u32' {aka 'unsigned int'} [-Werror=3Dsign-compare]
   19 |         for (i =3D 0, m =3D btf_members(t); i < btf_vlen(t); i++, m=
++) {
      |                                           ^
cc1: all warnings being treated as errors

by making the variable the same type as the function.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/perf/util/btf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/btf.c b/tools/perf/util/btf.c
index bb163fe87767c..50d98f3e83bf0 100644
--- a/tools/perf/util/btf.c
+++ b/tools/perf/util/btf.c
@@ -14,7 +14,7 @@ const struct btf_member *__btf_type__find_member_by_name(=
struct btf *btf,
 {
 	const struct btf_type *t =3D btf__type_by_id(btf, type_id);
 	const struct btf_member *m;
-	int i;
+	u32 i;
=20
 	for (i =3D 0, m =3D btf_members(t); i < btf_vlen(t); i++, m++) {
 		const char *current_member_name =3D btf__name_by_offset(btf, m->name_off=
);
--=20
2.47.3


--ck2fegGB3rBXuoHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoytxIACgkQJNaLcl1U
h9Cm0Qf/UEV+9z4W6FqG04aUoqqytg904+ngikh/1DORVSKcfNGXu4ZaD2S7w06F
KLyHbWOVoW0O6pZeXtUmCm2FSNYUSCylmrGxl+eX/35lNDGa/OUjw/BEArrfvoKt
fodtd9D7izluV+6Y70K0B3cn4YsQq56V2ZfaBhEChMcoC1jkttDl9rQjDLwV9fj9
mxG5L0464Ji/313igZil+CrGmlP9IxniZDnRO1qv3ayig+KhWj9NGrhd6oRi+o4L
XY/msWEQMvhFFmDZq2ykvFvScT37Pd/km7vF51YR61y1J9JHg1j2N0sYThkkjDTn
OdLUxWN4YvgtRG2hXSqhnkPDz0ahiw==
=p9Ob
-----END PGP SIGNATURE-----

--ck2fegGB3rBXuoHy--
