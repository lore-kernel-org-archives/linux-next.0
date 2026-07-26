Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF9D231832;
	Sun, 26 Jul 2026 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785101658; cv=none; b=YTI+rFdG+WU4FS79zZHKoUc9PwkdRsqRL2uTKyLfrrqq9gR6MFZTU1xJrAiN6VhSPEh6BJ9W7ByWHyX+c/peR3X8Bj4/X3TGjGaX7+d2dXKd/mLfANeS3fF0YgmvVfBEudsrQEQutyy1NTjUOgoMeblUNMT85DKItp395SzhGs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785101658; c=relaxed/simple;
	bh=u4ZjOOV5CbRCEpoOQ3TfC5Bl6HgGIXTjIHhDGdvO4y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO/Z37xP1eL/covAu+Sdc2mWT9yC3O4nB6CX12BTHwQrWsQpcAviB5QxytuBA4iQZmCdh3K1XoSMvpapJRDEp8tQVkiMwBbgrBPhfjFrRgmcYxWpJyt5zIlpD1rJDkfvezbwrA7wBAiQJlPGJaE4HJUkDROH9us8p6wOf/oEekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EedqMFG+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EedqMFG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9B91F000E9;
	Sun, 26 Jul 2026 21:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785101657;
	bh=VDNsDisEpPZ51Bnzggu4tSDj7bHKPLqheNNdgZVfMsw=;
	h=Date:From:To:Cc:Subject;
	b=EedqMFG+5whcDA90MmJys8yfyjweR5AH3usECzPcl2V6Tb0vYzt/lSrOA2VQV3uOU
	 6d4Xxz1lgQdlTVxlqwbX5Ji6oyOlGvxU0ve3i2KE7PH8mmqUV0zeFbEdrTZ4Au3nP7
	 DyB/kwlFmfSZXOY3m1fmBdOI6Wa1DvnLhnk2dzbltGl84Ufoe6l/pQA+leumn2ZljX
	 2+gPEGa9q2zL1+Wb4bv6zir2JjLpy8MN6JF3DAAZVIp08k5HjW0JQl+JRo+SlmexD+
	 EKD76tskrm0aNkzxKaHP+LjSK8s0w/N8Nl7vpiFHtxz4Nbd2yGXgJ78VYduinmSrxG
	 4TxXp8Pg5Q10A==
Date: Sun, 26 Jul 2026 22:34:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the liveupdate tree with the
 liveupdate-fixes tree
Message-ID: <amZ9VX7-88zU7E6-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CgQKESAoJv8Q0reV"
Content-Disposition: inline


--CgQKESAoJv8Q0reV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the liveupdate tree got a conflict in:

  include/linux/liveupdate.h

between commit:

  459873adf5e90 ("liveupdate: Reference count outgoing FLB data")

=66rom the liveupdate-fixes tree and commit:

  36882f3392395 ("liveupdate: Reference count outgoing FLB data")

=66rom the liveupdate tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined include/linux/liveupdate.h
index 63ea5417de849,6051abc0612ce..0000000000000
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@@ -25,6 -25,7 +25,7 @@@ struct file
  /**
   * struct liveupdate_file_op_args - Arguments for file operation callback=
s.
   * @handler:          The file handler being called.
+  * @session:          The session this file belongs to.
   * @retrieve_status:  The retrieve status for the 'can_finish / finish'
   *                    operation. A value of 0 means the retrieve has not =
been
   *                    attempted, a positive value means the retrieve was
@@@ -45,6 -46,7 +46,7 @@@
   */
  struct liveupdate_file_op_args {
  	struct liveupdate_file_handler *handler;
+ 	struct liveupdate_session *session;
  	int retrieve_status;
  	struct file *file;
  	u64 serialized_data;
@@@ -247,6 -249,14 +249,14 @@@ void liveupdate_flb_put_incoming(struc
  int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp);
  void liveupdate_flb_put_outgoing(struct liveupdate_flb *flb);
 =20
+ /* kernel can internally retrieve files */
+ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
+ 				 struct file **filep);
+=20
+ /* Get a token for an outgoing file, or -ENOENT if file is not preserved =
*/
+ int liveupdate_get_token_outgoing(struct liveupdate_session *s,
+ 				  struct file *file, u64 *tokenp);
+=20
  #else /* CONFIG_LIVEUPDATE */
 =20
  static inline bool liveupdate_enabled(void)
@@@ -299,5 -309,17 +309,17 @@@ static inline void liveupdate_flb_put_o
  {
  }
 =20
+ static inline int liveupdate_get_file_incoming(struct liveupdate_session =
*s,
+ 					       u64 token, struct file **filep)
+ {
+ 	return -EOPNOTSUPP;
+ }
+=20
+ static inline int liveupdate_get_token_outgoing(struct liveupdate_session=
 *s,
+ 						struct file *file, u64 *tokenp)
+ {
+ 	return -EOPNOTSUPP;
+ }
+=20
  #endif /* CONFIG_LIVEUPDATE */
  #endif /* _LINUX_LIVEUPDATE_H */

--CgQKESAoJv8Q0reV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmfVQACgkQJNaLcl1U
h9C8FQf/ZfUOircLIjFF1GDpuBypaIoJpu7ZKjh+pQkHFW3NTPMhwYOu+hqbmQgS
599E5C6RNiRwgNVAOHxf2Gq5BD6Y0WfhxRNjXmcGk2wNHYcZIYJUp4X1aopcrdVA
4Dpvyb/g367zvkvBaaa7RACKyuRRXo9di9cOlcH/Wy3wtRRoXhX47A+kCeLeILFG
W5dbeR9kiPdQ9J5gkqU/1+SJkBLyr2CujTIypM9F4y5r7wDaFkmpE7UWkZtarHL1
egvoTOnNwtvU1P5hVEaRQo9iqnvf2n9sjA477DD6oLhlWSyR+jPKjiva7+hn2J78
7wpI54pMTozujHkJURIBmem0KCU55Q==
=tx8U
-----END PGP SIGNATURE-----

--CgQKESAoJv8Q0reV--
