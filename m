Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06BC286415;
	Mon, 18 May 2026 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120650; cv=none; b=J54YHRdb4Y8JyAr6hCyAZlri4GJqmSyQo0QXNiOv+7lATrgt9Xi8MyouxC5ggsH9wIG6NIgKFFCE7WUpT6qDtwRr5FGpyG8TqrKZBDX8lI1bmZhBDM9v2v8NSwl+ixDiKE3gl5equn1+5b2KXtO58Fy6IdnQ6yhVLesin+el17Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120650; c=relaxed/simple;
	bh=d9LkEFdjY7OVQ3zZuAJKHFVL9PALvmQDpHCz7p3F4B8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUGiYdAkKXxek1BdNW4L6y5MXKgLINIPv2kj8jJ+36sZ/sL12gxjxalY9GFD3lgWacge5Udtxu2KHiFw2k2HUyjTOWlNMJ7po/hDSgHV3C2yV5KRWnsax9cfzL9Szl3p53a7riVQ2eyc+2/ozawJ9J9o+gKMqDLjCXXG/rS3OO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujTw9Fs9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujTw9Fs9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A092C2BCC6;
	Mon, 18 May 2026 16:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779120649;
	bh=d9LkEFdjY7OVQ3zZuAJKHFVL9PALvmQDpHCz7p3F4B8=;
	h=Date:From:To:Cc:Subject:From;
	b=ujTw9Fs9lWsoZMfcClwmYQpIbBeECvY7JBU/8SoeMN4Y+RQsmi3zRqIkmtb7ZNUC/
	 z3KkJ0FyDIiAOSDzEgnsjw8WtNhe4enHj2ycrjryEIeDdfkZOY0CgLUuEr0xgTCb48
	 E0XJH7Apz3EDO8r+9X8u0we38w6tr7Z3nxhIwDCWUnfkPTAE9U/A6r/sGZtf0GmD2Z
	 bPuU15gjbdEjgYHVx5OVO9cMgl41C+w2NzwojlLU5s8wEwU6Hsimahgw05tcKF11WU
	 LKy81LqFoqehDTpVSE99YiopL8gpAN8hXiuWnxYo3YGxMjJq3Y9sHVBeNSP+tLoDCp
	 LvdPNDv1KOiPA==
Date: Mon, 18 May 2026 17:10:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hongfu Li <lihongfu@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Li Wang <li.wang@linux.dev>, Waiman Long <longman@redhat.com>
Subject: linux-next: manual merge of the cgroup tree with the mm-unstable tree
Message-ID: <ags6BawOir3IQHIZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NwPUZx66+LoZE+kO"
Content-Disposition: inline


--NwPUZx66+LoZE+kO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cgroup tree got a conflict in:

  tools/testing/selftests/cgroup/test_memcontrol.c

between commit:

  186fdfd222a15 ("selftests/cgroup: rename PAGE_SIZE to BUF_SIZE in cgroup_=
util")

=66rom the mm-unstable tree and commit:

  2a7d34eba5f5a ("selftests/cgroup: check malloc return value in alloc_anon=
 functions")

=66rom the cgroup tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/cgroup/test_memcontrol.c
index 44338dbaee819,21aedb35cc122..0000000000000
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@@ -61,10 -60,26 +61,26 @@@ static char *alloc_and_populate_anon(si
  	char *buf, *ptr;
 =20
  	buf =3D malloc(size);
+ 	if (buf =3D=3D NULL) {
+ 		fprintf(stderr, "malloc() failed\n");
+ 		return NULL;
+ 	}
+=20
 -	for (ptr =3D buf; ptr < buf + size; ptr +=3D PAGE_SIZE)
 +	for (ptr =3D buf; ptr < buf + size; ptr +=3D page_size)
  		*ptr =3D 0;
 =20
+ 	return buf;
+ }
+=20
+ int alloc_anon(const char *cgroup, void *arg)
+ {
+ 	size_t size =3D (unsigned long)arg;
+ 	char *buf;
+=20
+ 	buf =3D alloc_and_populate_anon(size);
+ 	if (!buf)
+ 		return -1;
+=20
  	free(buf);
  	return 0;
  }

--NwPUZx66+LoZE+kO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLOgQACgkQJNaLcl1U
h9AJ9gf/S7ezpguIHwAIAW+MvK24zU72/0WWxE4P/uZfRh1LHbD7HnrW0Hy0c0o2
MJgRbkc3oFjEAM2UxTuay3/shO625SIr6r/pMDDtc6SzAf5LRcMI2OEus7zjBG9q
Zpw+/yOEjVpdDi/vrujY/ZZL9DoX2XpGoVssceXmMmQyOeDkU2MzfYLIcoGEhwFn
kXJiZPILbnur7eYjDGnVjYiKEyle0anf6r/UjzvnktuI0vHvYvyFY4kDTjIhXYz8
wkwfJo1+3ZlC1ydADJ1yRCXHw6Oi+vh6gGnMYY6fwpA0wenU6ZEqBmXQpkBBhkTj
vbJOa4kG+maKdmN8+QoZjF51hsbGiw==
=jvVM
-----END PGP SIGNATURE-----

--NwPUZx66+LoZE+kO--
