Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB521A682F;
	Wed, 11 Mar 2026 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231702; cv=none; b=beGeC2zJ/hdE97ZgoIs5EtzF4+s+/D70oWiGcnr7OtseeMeU1NgapPl+yNKm8gE9eWn8KOFpoOm6LWDpsdVeTwgMs45TU2GnThd5yiCne6ALyAFgHXOtaV1++l1JW0lf5LEDx+QEt6KLyy8wnbXJw3f90iBjr5kThadMyHfAIO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231702; c=relaxed/simple;
	bh=09ZphwjCiEM+164trmBOpnWofJVnReb7rKNf75H0KCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1iyBlWchNGe6TriSLNOGz+I5Ahr3mNa09lIZ0MKh5xa4Po+p+RQXGW5OTR5faCljK+uEcOWXufUwUssTSi427Ljrq9hCq05YhD0hBbJc2pGinCLDnx8vzT0FQ4TeZPuGIJMTUTAaRD+Stqo0HP3qd0irsvu+2j26NM5Htf1Bwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5tgGmcH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5tgGmcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BF0C4CEF7;
	Wed, 11 Mar 2026 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773231702;
	bh=09ZphwjCiEM+164trmBOpnWofJVnReb7rKNf75H0KCQ=;
	h=Date:From:To:Cc:Subject:From;
	b=n5tgGmcHhfhz6Tt8pACZLpiE2fMQvIp28jPRQ8mFC0lW+HkBErzyqthu3k7XtTHyn
	 LT1IC6B4hLkdKUYKGOisX9YL4oMeQ4dySbowP51CEXzBvmHOYW3rNedJu8mlqcXvoC
	 4Iqs843GRz+nCWorWsitDDOqt4p/vVDnqpY3vo3Br6ig1Hwuhn+afzmpnXhZbW9H6x
	 4TdaBOC/gJl6qXBg0L4CDQcaWEC9wmrtdYMW/OFIizPQU9jzBfBeWrBOapX3RRr+w9
	 1TWmKHI0y971ucX39LOmyb9al9mE9E4oMn9R3L3qanQioB+JPbo5FFzvXu9ufM99hm
	 M/OukitVRCLGw==
Date: Wed, 11 Mar 2026 12:21:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: linux-next: manual merge of the audit tree with the vfs-brauner tree
Message-ID: <abFeUpxZzjZBdsSx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z1rLQHiW7eMe9fT2"
Content-Disposition: inline


--Z1rLQHiW7eMe9fT2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the audit tree got a conflict in:

  include/linux/audit.h

between commit:

  125dfa218134d ("audit: widen ino fields to u64")

=66rom the vfs-brauner tree and commit:

  360160f75592b ("audit: handle unknown status requests in audit_receive_ms=
g()")

=66rom the audit tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/audit.h
index b915aaa7ed739,d79218bf075a0..0000000000000
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@@ -15,7 -15,16 +15,16 @@@
  #include <uapi/linux/audit.h>
  #include <uapi/linux/fanotify.h>
 =20
+ #define AUDIT_STATUS_ALL (AUDIT_STATUS_ENABLED | \
+ 			  AUDIT_STATUS_FAILURE | \
+ 			  AUDIT_STATUS_PID | \
+ 			  AUDIT_STATUS_RATE_LIMIT | \
+ 			  AUDIT_STATUS_BACKLOG_LIMIT | \
+ 			  AUDIT_STATUS_BACKLOG_WAIT_TIME | \
+ 			  AUDIT_STATUS_LOST | \
+ 			  AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL)
+=20
 -#define AUDIT_INO_UNSET ((unsigned long)-1)
 +#define AUDIT_INO_UNSET ((u64)-1)
  #define AUDIT_DEV_UNSET ((dev_t)-1)
 =20
  struct audit_sig_info {

--Z1rLQHiW7eMe9fT2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxXlEACgkQJNaLcl1U
h9DSjgf/RpWGA9jCa8ffPbW/osbY72wsCkkzuzhYpaDCRnCCMQay/mTUHhbhnOmx
sivxOLTKmqb+qXYSo8ABRHvNzqZlKR/BaC0MFzS2bMLxaj4ovODJn8T0Yi6/LFrb
w0A5FzvwwIL4+85CtaZC9KMHeLOIqw7fQLhWm8HQvU/te/2PvIoLFHKQqQKsvjRm
kN8rUn2LhjiZyxdkfjxaN2AMQ7nJX6BOMhnqkS2VlT6UvlJwmsR6UDc2qJfKyV+r
aAmfcqK6pn0eZGfjKlBPi8xX9ymie5gczKJLxjf+xC9rhDlITqBA1VPjZ6QSmx/z
wpM/QkRorcfgMbnO02WwOLiht8N/NA==
=fqvN
-----END PGP SIGNATURE-----

--Z1rLQHiW7eMe9fT2--
