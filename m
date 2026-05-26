Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC483FD970;
	Tue, 26 May 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803494; cv=none; b=uMlNGYeVcq/volytsCUqduTdmvmGhgylpc1vyLBzNLXhGUlRoBm/LyLtvBz8qMEPQY5UyVID8tjmjWA+oQzbW9WuP0h0CaSQN/Fr0Mwk8OKJXVxPGfV0xUNi9yFOysFfzsc54J5QrVkKWc1hqQLAQDDX7H8RoLhmsCCrClhoP3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803494; c=relaxed/simple;
	bh=i2XsSmSAvgUmsQRc6EwbTlKw9IG2PfUW2b9LR/REPEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqZl536k6W0acehHICYEjaia2pn/Q8LtQ76H8Itrv1QIaCEtTQ0XlnWfabeIh1RzTUnq0/wRyZWdXfsg8kFcZEuEbu8ksuRKakV2EEhBRZXCRzGccXbsOgpfLNd7t2WuYuRRwm/+OTeOoXwguK8JMSvie6cXZ1YIE3+rAl0OpWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ0oh8ZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ0oh8ZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55B11F000E9;
	Tue, 26 May 2026 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779803493;
	bh=/grPN6/j2qzIjfeFXlN5choKsmPqw/56/R8d7xlJ9+c=;
	h=Date:From:To:Cc:Subject;
	b=mJ0oh8ZHeksDZlTPIDKUco8OVJ1m+Y5eYZCYcM0PoKo4GaBOtYgLJ4Rx81PODIVmk
	 mpBg/o+SbUBMqTkPytW6OOPQYx15KpvdSwjS88wtSDetTpYHs7yKW1zMaqbUHyiIsU
	 sVf4nnIW0ILQ32pnHhRFI/2+vKDkGpsoBhkx8//7vxUe72VaOgE6SsfXIKfpO0STl7
	 P0A8wDfwNKcWNfAeNAKWqhBbfWTZU+ARxzcr8hf4KXI1Oh0DFTCQNkg16gDg5o61/m
	 wkgBXEPbwK7eJXNjO4uFW6KjN6m3K8knPvu/JncjyEV9/hC9FdNYCzjMANKCg5669o
	 2qyfaWKEiEkUA==
Date: Tue, 26 May 2026 14:51:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luca Boccassi <luca.boccassi@gmail.com>
Subject: linux-next: manual merge of the liveupdate tree with the
 liveupdate-fixes tree
Message-ID: <ahWlYXNjGUbkKoHy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWjSFyAGBNNxnCFe"
Content-Disposition: inline


--HWjSFyAGBNNxnCFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the liveupdate tree got a conflict in:

  kernel/liveupdate/luo_session.c

between commit:

  da7f658ccc8da ("liveupdate: validate session type before performing opera=
tion")

=66rom the liveupdate-fixes tree and commit:

  d6b3d47bdaf89 ("liveupdate: add LIVEUPDATE_SESSION_GET_NAME ioctl")

=66rom the liveupdate tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/liveupdate/luo_session.c
index 74c39d93d45a1,1caaa7886ec6d..0000000000000
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@@ -293,15 -306,9 +306,16 @@@ union ucmd_buffer=20
  	struct liveupdate_session_finish finish;
  	struct liveupdate_session_preserve_fd preserve;
  	struct liveupdate_session_retrieve_fd retrieve;
+ 	struct liveupdate_session_get_name get_name;
  };
 =20
 +/* Type of sessions the ioctl applies to. */
 +enum luo_ioctl_type {
 +	LUO_IOCTL_INCOMING,
 +	LUO_IOCTL_OUTGOING,
 +	LUO_IOCTL_ALL,
 +};
 +
  struct luo_ioctl_op {
  	unsigned int size;
  	unsigned int min_size;
@@@ -323,30 -328,15 +337,32 @@@
 =20
  static const struct luo_ioctl_op luo_session_ioctl_ops[] =3D {
  	IOCTL_OP(LIVEUPDATE_SESSION_FINISH, luo_session_finish,
 -		 struct liveupdate_session_finish, reserved),
 +		 struct liveupdate_session_finish, reserved, LUO_IOCTL_INCOMING),
  	IOCTL_OP(LIVEUPDATE_SESSION_PRESERVE_FD, luo_session_preserve_fd,
 -		 struct liveupdate_session_preserve_fd, token),
 +		 struct liveupdate_session_preserve_fd, token, LUO_IOCTL_OUTGOING),
  	IOCTL_OP(LIVEUPDATE_SESSION_RETRIEVE_FD, luo_session_retrieve_fd,
 -		 struct liveupdate_session_retrieve_fd, token),
 +		 struct liveupdate_session_retrieve_fd, token, LUO_IOCTL_INCOMING),
+ 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
 -		 struct liveupdate_session_get_name, name),
++		 struct liveupdate_session_get_name, name, LUO_IOCTL_OUTGOING),
  };
 =20
 +static bool luo_ioctl_type_valid(struct luo_session *session,
 +				 const struct luo_ioctl_op *op)
 +{
 +	switch (op->type) {
 +	case LUO_IOCTL_INCOMING:
 +		/* Retrieved is only set on incoming sessions */
 +		return session->retrieved;
 +	case LUO_IOCTL_OUTGOING:
 +		return !session->retrieved;
 +	case LUO_IOCTL_ALL:
 +		return true;
 +	}
 +
 +	/* Catch-all. */
 +	return false;
 +}
 +
  static long luo_session_ioctl(struct file *filep, unsigned int cmd,
  			      unsigned long arg)
  {

--HWjSFyAGBNNxnCFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVpWAACgkQJNaLcl1U
h9CIZAf+OsjMUqLf3e9r4xE01oLmyPh8JnUujS9WMSTADb4RcrBuI7WRJfdVtxCk
jW/N+zwmwUbhSpGa/iUTDGTevcSYhmSVtfqxE4AqjjlKJwZdHVcAFHgdY6fSfKV3
hDHHRpn8Mq5nTGnUqUNwYlCw1VUBM+VPQYaRyPVr0D77nXHFTvtprdoONPgPlUiZ
spxypEtag/EP289ZIOAGQxXr6U0bYCq3nupXY/30sx28zpqJlDbO+aX+IW+jejMm
yLi76Oe/t+CWzbuxPrNHYuSYw3A0KksmCO3H6SzPemTRNKxyTxQPSOj264JoFw0F
VKfvP7ztlAaLCLpyN7nr9qzFfyBvMA==
=N9yi
-----END PGP SIGNATURE-----

--HWjSFyAGBNNxnCFe--
