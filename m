Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845EE369985;
	Mon,  2 Feb 2026 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039452; cv=none; b=PmToxzhW+Hbcdjv/zoRGZHQNbM+DGQu7lVmvqjnXfIPw6PI/KsIQTPRCcfgE4DAQ1AamZffFhN2RmQRBrKTTmVNlk7ruS5R/BBocl1qXbDgRbmGB5z1OmbrGSlMwW+goI1NsWThPiPyy5AV/GbIJHfu/vOhQFSq0WJU6MQh864w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039452; c=relaxed/simple;
	bh=fgjSGgfhwiPq4r4DhKu2F3/qXQYbYwcKFOU/z/gS9X4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rw6r9LSzTf+tKF5XYeEIbgSr0tjNoQ61Gh9ysw1sex+kLyUGDGd4udPTTt2a9VM3/Z3Ij6Us957Q7YtidZdTywzkIi7qnLHA698eiz0K2CNBis4n5gMC6GbNztHDIlQSGOzHXhvPdxUkhv2b3MIG6O+HfFYxXDNJUKFtJg0FrrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z60hLVPm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z60hLVPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2840C116C6;
	Mon,  2 Feb 2026 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770039452;
	bh=fgjSGgfhwiPq4r4DhKu2F3/qXQYbYwcKFOU/z/gS9X4=;
	h=Date:From:Cc:Subject:From;
	b=Z60hLVPmSH7pCfHXcBjMem9vbO5AIg0jduTpDx64sWjdW3wH1u1b1TeJgkG8zvntr
	 QLhyW17w3LF5wO6FTeehjvQXygftO4l993YQA0HOJnMihJlbC/Xb2qMt1onME4P5YY
	 l0r/WXeJEneFCoywKrZvRJNte+qmXT2Ehk+/vu6wWRxMcc9K7gYmQG4QkrK9V6qGKD
	 fh8hNMLm/WlOF4kPBDqcLhfPKRSmvAufgzysA8zr+yTMyuhh0vqCZEvky6JlN00uEx
	 5B0pL+cyBFtdU9SC8jL0iTLYuAIKc98hWta4gT8ny6OmJXHnr0LT3vaQdpx9PpAEKN
	 gN7Jxbwicrhag==
Date: Mon, 2 Feb 2026 13:37:28 +0000
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Askar Safin <safinaskar@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Li Chen <me@linux.beauty>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the mm-hotfixes
 tree
Message-ID: <aYComD0uH0J9jQu5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7q6dWmKzQtOgzzx"
Content-Disposition: inline


--O7q6dWmKzQtOgzzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  Documentation/admin-guide/kernel-parameters.txt

between commit:

  204cbd056d724 ("Documentation: document liveupdate cmdline parameter")

=66rom the mm-hotfixes tree and commit:

  7f3b33668595e ("init: remove deprecated "load_ramdisk" and "prompt_ramdis=
k" command line parameters")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/admin-guide/kernel-parameters.txt
index d1b7676e6de27,05b0041dabc12..0000000000000
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@@ -3472,13 -3472,6 +3472,11 @@@ Kernel parameter
  			If there are multiple matching configurations changing
  			the same attribute, the last one is used.
 =20
 +	liveupdate=3D	[KNL,EARLY]
 +			Format: <bool>
 +			Enable Live Update Orchestrator (LUO).
 +			Default: off.
 +
- 	load_ramdisk=3D	[RAM] [Deprecated]
-=20
  	lockd.nlm_grace_period=3DP  [NFS] Assign grace period.
  			Format: <integer>
 =20

--O7q6dWmKzQtOgzzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAqJcACgkQJNaLcl1U
h9BlCQf/X/kRNnFuzJ9u5ii4/MrcUeqLhHwLQrsS/dBI5LBd7ljv+O8HPLYY3l/i
9oZvFyis9ixKZDZYlHTnwlaOfx0fu0D+jXRNDkUTHlzzrci4ZsRaOufnk6J0lNCN
cx36nV4VB87/COU5cCeI3kM8y4he9fUwSJUFxKdyaF+mMlytlVw4Q+QKZ47+M+BT
JHrkRlX3Xtg/Cpl+Rx4xHZhidNN9soTCCyJctO2fn6THeYlY5m5acpoNe3S6i9aA
sSd1SMCqpQYRrDVG5kpmbZi8U7dJpxq/NbQvOLqBOD3gf33fIfQfdQt3RjFd6ZgP
6/L5E3olP9gXZy6ythAMvpEbigsO+w==
=x3c7
-----END PGP SIGNATURE-----

--O7q6dWmKzQtOgzzx--
