Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072AC40BCA4;
	Mon, 29 Jun 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738913; cv=none; b=jd4OLJ8Yf/aFvvO0USOdPI2ZFGDBYbM13ee0Zx0kaQe1ESw9K2hCdV3kb3loqDaYR0hORv5LM0geZPbn4fWbIjDfDOP6vDdayi6UkZqHf9GDy3x0hiSGsx+tlH5OHoK31ijmxarYCm7Y+aI5rByGafNbD9gAkppophdBr/z2l+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738913; c=relaxed/simple;
	bh=YlE3G+brZkzWuXJtlbYFr9UnaOzoNC244gcmb/UFy08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFu+zDXku83+ZFJpkrZzXUnXaJVszWZ/Dm34lfHkalAa3LYjnJO6NyWmUXjBGSKvEfPHMURcjJRdLhN6u4DiVCP6CgsnoTl/HGbAQ4HWWdv/4uLOG3ONbwAfR7f0jM0sdUTUBjG5bBslccjEkmElVO8NZ/YB2Wbf+KMWC7UEYXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UV3b6CqA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UV3b6CqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846811F000E9;
	Mon, 29 Jun 2026 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738911;
	bh=xLeQ3fVOYz9eLNUTFkBfuhBZjZCxUVIpqzv6lHQjGc0=;
	h=Date:From:To:Cc:Subject;
	b=UV3b6CqAe1lb5uEIMobp0uTsLCnxfdfti1xToziOYEvCsKUgsj9VOy5UJG32/k9O3
	 TxHhHUJmVASa3aCL4R5PO/Iz5Xx7XHaKUmJ6JTORFX6GQ6ssMKDbLj9KQ3AhfhMo1g
	 Yb6ieSyEYXrXO6erLbQvG/QNNI/UU5O2t5in3fza7dFoHebTLZNKvAwLZr2F0AsEko
	 U91KKvhNArOyW2ZGrJTYRvBu0Wdwh+rjdYjXdETH6QV5BwLxRMUQgGv8p/P90TmYdz
	 Dd3j+MiT9FIXa8Y17X1kwwls4ehKi1/bTDR9kMUWjidG8oFASu3NjV6kFKe4giMood
	 v9ADTktjGXbuQ==
Date: Mon, 29 Jun 2026 14:15:08 +0100
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Samuel Page <sam@bynar.io>, Yun Zhou <yun.zhou@windriver.com>
Subject: linux-next: manual merge of the nfc tree with the nfc-fixes tree
Message-ID: <akJv3Ajqh0ALyEk4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YhuY3CiQgbip5qzD"
Content-Disposition: inline


--YhuY3CiQgbip5qzD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfc tree got a conflict in:

  net/nfc/nci/rsp.c

between commit:

  075f88b7d3b5c ("nfc: nci: fix uninit-value in nci_core_init_rsp_packet()")

=66rom the nfc-fixes tree and commit:

  1d5fcb66b07a3 ("nfc: nci: fix use of uninitialized memory in CORE_INIT_RS=
P parsing")

=66rom the nfc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/nfc/nci/rsp.c
index 6b2fa6bdbd14b,85c3ff2b78cd9..0000000000000
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@@ -50,7 -50,8 +50,8 @@@ static u8 nci_core_init_rsp_packet_v1(s
  	const struct nci_core_init_rsp_1 *rsp_1 =3D (void *)skb->data;
  	const struct nci_core_init_rsp_2 *rsp_2;
 =20
+ 	/* Ensure that the status field can be accessed. */
 -	if (skb_headlen(skb) < 1)
 +	if (skb->len < sizeof(*rsp_1))
  		return NCI_STATUS_SYNTAX_ERROR;
 =20
  	pr_debug("status 0x%x\n", rsp_1->status);

--YhuY3CiQgbip5qzD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCb9sACgkQJNaLcl1U
h9BfZgf/R5UWkRi1A6rkcB5FZ6BqmT/aQ49jbxE05xmsN8mH9Z1nNsyVQACgZAFo
2eRrrGCEQ6xRoYZEGarkZQP5QoQwh0VEQwXerOTjiHiOTrtSFc8G5DS3pgZPQFTu
fep4ehpflRMKF485/0ZpUAXgkz/V+x1IKvVgQg/x6OKv4MBFw2SPL/lVEMdTu8C5
WV3+Oz0HvGVAbCh9AImUBXc+OwqnXsh17RaBaEKCxVdWPAOksMbPklHIAcA214wd
hGwuQ62qjP0E2v07DPls2L4WFU07N2JtJJCN/JPLUQa/HHA0VviaIHIaYUpgE5aE
hcuAEu+bin7UsThncBmfkn7/zx33fQ==
=Qkb9
-----END PGP SIGNATURE-----

--YhuY3CiQgbip5qzD--
