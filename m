Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602163BD644;
	Mon, 20 Jul 2026 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558927; cv=none; b=bmU+VEJtiRi2JvyaD8T3Rjl9F3stfNsi2wTqT9WUF4kzk15LwQN+Ut5d6mYZvrhYES3Qut+PvUApBkiUpcqqZV1onpFkLAMichoW8zUzUeTewFltqxGeypPyzMEuaRAbd98OizvQKoPu+DfOksn8Y91JNQWjysaIn5r8GDsNSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558927; c=relaxed/simple;
	bh=ybev19ZJIUVFj0rA/F3nb/8z1l3dQf6u2JPurd2vDeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZVo9RS1n4YC50AZ5NVMVGumeIkOfyyxs3MK/Rkacl9wJxfEdKdESDJnk1CVPfbNu6M/c8MijCD2AfQFr/WWFP888VyfmKjZwoxDnHt4vLHRRH9WoL3mlLFEKDUkRPOCQRvwmQ7b6CikcRIuq9grMEeXqrBTIGK7KHmpUw73V/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOlIXkhF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOlIXkhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D4E1F00A3A;
	Mon, 20 Jul 2026 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558926;
	bh=qeQc4Ktc4C29808HtBe7aEqSq1HCSO7sARfiopRIeWw=;
	h=Date:From:To:Cc:Subject;
	b=MOlIXkhFmR5beDQriMz+RdJvid/ESU1lZZariS83bo7hh0b1sz1CvtvR+WTRZAAuo
	 c6GMJShKIXKhd4uVUEwLmWvUcJeNGH8IXvhC1s1Zyvd2v0aB0jSsVvx8NCwBc4GTMD
	 Eme27PzrkYBpOuxROnuCvgO/si6gak9b/EHURFTamtQvTJHEbI88qUFnM5vK0A9nCc
	 nBQdcbgJwHs0hMGVwb3+FQ11XhC7YZnAngxbOOqfZf5PwONrH5j9v9zs3A4fX+Jh9r
	 gWQWOl2qszfSQS2a/C+T2dee54NMvSoyGZbobpGZBxeH6fIkrcC4iJbeQy7CK6jt5b
	 cNwx3KFZH+9mQ==
Date: Mon, 20 Jul 2026 15:48:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jahnavi MN <jahnavimn@google.com>, Jann Horn <jannh@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Moore <paul@paul-moore.com>
Subject: linux-next: manual merge of the char-misc tree with the security tree
Message-ID: <al41SRxNtHYU5coA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ejmSgmVVEGF1Z8qb"
Content-Disposition: inline


--ejmSgmVVEGF1Z8qb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  rust/kernel/task.rs

between commits:

  ef2d3e4635761 ("rust: task: clarify comments on task UID accessors")
  15c1f17979712 ("cred: delete task_euid()")

=66rom the security tree and commit:

  2847d9ab088bb ("rust_binder: Add dynamic debug logging mask")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/task.rs
index c2b3457b700c1,1b290c61714db..0000000000000
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@@ -210,7 -210,14 +210,14 @@@ impl Task=20
          unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
      }
 =20
+     /// Returns the TGID (Thread Group ID / Process ID) of the given task.
+     pub fn tgid(&self) -> Pid {
+         // SAFETY: The tgid of a task never changes after initialization,=
 so reading this field is
+         // not a data race.
+         unsafe { *ptr::addr_of!((*self.as_ptr()).tgid) }
+     }
+=20
 -    /// Returns the UID of the given task.
 +    /// Returns the objective real UID of the given task.
      #[inline]
      pub fn uid(&self) -> Kuid {
          // SAFETY: It's always safe to call `task_uid` on a valid task.

--ejmSgmVVEGF1Z8qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeNUkACgkQJNaLcl1U
h9BhqAf/WLHKrnKs3Xz2r1RNvPQPsE0Hzfwj7LFbpxd3+Pou0VnCe5/omZ3Lk8YK
uBfTzPaXWwTRJorkES5P7M1fHatNjb2PEHNACkCxrRGKGrcdrz88PrV1jhAMc9mm
nWiSK7TDINudhWgJsbIfJ4/t6zWtC8iofz81myn4pcCLr90urs2+KPmltZ2O+1pT
56k45BJ2aqo2d3ZgQx8BjVDN7bZcSvEkrpUHlYAEXd6zuiUaNpgMFHL/th0jD2Y8
M5G/qyWB0X52HCDTy54DU7BjOivWrorggCO3iykage8OCs2iJlTDL15FvMD93x8t
rq80xMboWrvXRC997rWd+zhGK93BXA==
=X4o5
-----END PGP SIGNATURE-----

--ejmSgmVVEGF1Z8qb--
