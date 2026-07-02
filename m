Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAB4C0416;
	Thu,  2 Jul 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001074; cv=none; b=C+EVh+mRAy0ms+SbjlJbNpdopwjP9kd6I3TevWsPGZCRJ4CBwiCWQi5YV3bd4n0f3gPL1ab4xU6XVKcNlsDOCXIr6gxilSHpKy6IgWdNtncMkVdAumX2coYcE2pgizAdxUTAHhsQiT2nm0oL6es1/ijz8/TLs4Hcr+nxwOKwSRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001074; c=relaxed/simple;
	bh=oPdJh7+Lj+YMjsnmXK2H9zVYbcJ3lKTgn/5oPHSpf2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDx9RxUhLA0qWASXuIOJkH9wi4wZZ3YspZXDaZXr4UrTJUlReG8RFYv92TqhPAdYDbQ7uXbDDAz38sJSHBnAZJfKpoyZF5CoQ5baHpqy+96dP6e6Dc9nlyupaaxCeh0MNhET/p+1IqbzPpSvsoQnifeRmBsdMhBCuU7AQswbTO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=me33ohuq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="me33ohuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510381F00A3A;
	Thu,  2 Jul 2026 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001073;
	bh=vpa+HBdni+OlRBqs+pF/f7bieoomAAmTosHZiIoZ3Eo=;
	h=Date:From:To:Cc:Subject;
	b=me33ohuq0547KNWHPUUgYvM5jVyXV26t9ysawO0ea3NqnUMNKdWEdAtKkP7BEVMSa
	 cTB8mvfxU6bs+O8MJPEFsWoJGblX0oi50jk4J/lWEJNZEARuL+Z9s4FYiJRayFSWkK
	 tGUS0TPLd9zdnveaSjLJfXAF6Q0FnY/n2jFBnxgBFhhpshwB+4voQAjYWd7hmXWyM+
	 yt35oDvCwe5ImvtuuEJt4D00RGw2o4BPIRYu//UgWRTMS9Uccst0S3C7Qq+5zl1N6h
	 UJXnZzni7g5fi49+gpPcSSoSslYnaG5CITzxRM+R66TiytZ4L9k53yo/wLXWU2wRct
	 0XeuJO9ZpTdXw==
Date: Thu, 2 Jul 2026 15:04:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bradley Morgan <include@grrlz.net>, Breno Leitao <leitao@debian.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 tip-fixes tree
Message-ID: <akZv7XdTZlkCUQ1L@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FuZK0XYaKTZnqKZM"
Content-Disposition: inline


--FuZK0XYaKTZnqKZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  lib/bootconfig.c

between commit:

  dec4d8118c179 ("bootconfig: fix NULL-pointer arithmetic in xbc_snprint_cm=
dline()")

=66rom the tip-fixes tree and commit:

  9f2274451ae6b ("lib/bootconfig: fix undefined behavior involving NULL poi=
nter arithmetic")

=66rom the mm-nonmm-unstable tree which look like two fixes for the same
issue.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined lib/bootconfig.c
index 2ed9ee3dc81c7,c913259c80ce1..0000000000000
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@@ -427,18 -427,11 +427,18 @@@ static char xbc_namebuf[XBC_KEYLEN_MAX
  int __init xbc_snprint_cmdline(char *buf, size_t size, struct xbc_node *r=
oot)
  {
  	struct xbc_node *knode, *vnode;
 -	char *end =3D buf ? buf + size : NULL;
  	const char *val, *q;
  	size_t len =3D 0;
  	int ret;
 =20
 +	/*
 +	 * Track the running written length rather than advancing @buf, so we
 +	 * never form "buf + size" or "buf +=3D ret" while @buf is NULL (the
 +	 * size-probe call passes buf=3DNULL, size=3D0). NULL pointer arithmetic
 +	 * is undefined behavior and trips host UBSan / FORTIFY_SOURCE when
 +	 * this renderer runs at kernel build time. snprintf(NULL, 0, ...)
 +	 * itself is well defined and returns the would-be length.
 +	 */
  	xbc_node_for_each_key_value(root, knode, val) {
  		ret =3D xbc_node_compose_key_after(root, knode,
  					xbc_namebuf, XBC_KEYLEN_MAX);
@@@ -447,11 -440,12 +447,11 @@@
 =20
  		vnode =3D xbc_node_get_child(knode);
  		if (!vnode) {
 -			ret =3D snprintf(buf, rest(buf, end), "%s ", xbc_namebuf);
 +			ret =3D snprintf(buf ? buf + len : NULL, rest(len, size),
 +				       "%s ", xbc_namebuf);
  			if (ret < 0)
  				return ret;
  			len +=3D ret;
 -			if (buf)
 -				buf +=3D ret;
  			continue;
  		}
  		xbc_array_for_each_value(vnode, val) {
@@@ -461,11 -455,13 +461,11 @@@
  			 * whitespace.
  			 */
  			q =3D strpbrk(val, " \t\r\n") ? "\"" : "";
 -			ret =3D snprintf(buf, rest(buf, end), "%s=3D%s%s%s ",
 -				       xbc_namebuf, q, val, q);
 +			ret =3D snprintf(buf ? buf + len : NULL, rest(len, size),
 +				       "%s=3D%s%s%s ", xbc_namebuf, q, val, q);
  			if (ret < 0)
  				return ret;
  			len +=3D ret;
 -			if (buf)
 -				buf +=3D ret;
  		}
  	}
 =20

--FuZK0XYaKTZnqKZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGb+0ACgkQJNaLcl1U
h9BDKQf/XzOIE86uE5fdDXHpHwXz/yV6siNaE2pqLO4cGrrDqLi5sdNBhP/mcUle
6P3CQlTgR4RAbQSPdPDOq5biojZyM5OOFpFE+S3aIESBWOdtSdYQAVxjsNTMOrQ+
Yes5TstW2AHp0vjQPkPfoWx3pJlMbfrfYuaeNIsPx/W86CitqLKplQkMeHORNT6h
pael1lqIuu9Zyv/af7W4+Lt0VGFi3zI/u4TmU9TOF2/FxH24KZW2R8+3tqmknGoU
c5eiAS9DEFSM3YES/1Zu6EzZE4DThSThmDd7KTIeSu00+Oayituk6PaEC7sXv6++
tc7iFhhly67Cu0OEYsPhYzzu2/l7Lw==
=Zmw9
-----END PGP SIGNATURE-----

--FuZK0XYaKTZnqKZM--
