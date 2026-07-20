Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3924307BC;
	Mon, 20 Jul 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558688; cv=none; b=Lgcqkkvt4f/GniVijPNNfyf05qMzN8eViHqhIaUYuXQoE6gdLmiAGMHpGZYgZY67vHB5dKpRtZgbLLhP/2ahgRQmG7b6ABezS9D/O+5x0rh5Qx5MlLkEjzXsX82DUKej6Hbf1b7WS6Skn00tgvb1v6Z9VjHa+bOrtlyY+aeWFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558688; c=relaxed/simple;
	bh=tQQaBG2iu3wPfWvKXdYYtZJsgpcpp0FNKFaOJAN/eHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dxPka07nng1s+i9nDXmfvybDHcbMvw9GvClz5DEMsg4TienZFaiJ69AmsuuDhER15v5TLbxm6uoecX8RGN2sJRaXavpGoeHnQnL1ZVeDPjkii9FW6XCXd8CXIUm5j1HxEV3Od5oYpAIzTSAqkN/cR/+qb4LtWAOcu3AkmzsDrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SziOxgDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SziOxgDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC6F1F000E9;
	Mon, 20 Jul 2026 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558686;
	bh=SWfPLaIV2JEtoBCMYloeN8U1PNGpW4U1pVWinBHVaDM=;
	h=Date:From:To:Cc:Subject;
	b=SziOxgDLHG1/BsMnNJPVWkdKYwb5HyjH4/af1yuPFgZXqWoN8ZKxAfAgHm/SyMbFK
	 OUxTO4a62pKALJ91oNOZ1YxICnFSlSTBicqJwuACQecT9177oB/O1woZFLtrMhynSJ
	 cjKOeYPP/+/vG647AELJCeWSeV8BJtzM4moE0pg9meqmyTA8MTpiqLtb2oR6V//JRa
	 eA0quqtA/FdJjZtgNKAl9ww6ZC7EvcVjS7pVa993K8//8ahBZlTklvXFNJFvOgt2vZ
	 3+dQXwvXPvW421pihL4RU9qp/9NXZrE+97AUiK2Zs+cbKbA5QQFQdqCajcnn0PyxLH
	 t1MhqcDUYv+ew==
Date: Mon, 20 Jul 2026 15:44:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jahnavi MN <jahnavimn@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <al40WiyRukYGQ68S@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UEes+c8ww1MHHZ5x"
Content-Disposition: inline


--UEes+c8ww1MHHZ5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/android/binder/thread.rs

between commit:

  bb66b1a345253 ("rust_binder: only print failure if error has source")

=66rom the char-misc.current tree and commit:

  c61f3ad2213cf ("rust_binder: Implement BINDER_DEBUG_FAILED_TRANSACTION")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/android/binder/thread.rs
index bc0ef8927905c,a51821dde0adf..0000000000000
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@@ -1273,14 -1295,25 +1295,24 @@@ impl Thread=20
                          inner.extended_error =3D
                              ExtendedError::new(info.debug_id as u32, err.=
reply, source.to_errno());
                      }
 -                }
 =20
-                     pr_warn!(
-                         "{}:{} transaction to {} failed: {err:?}",
-                         info.from_pid,
-                         info.from_tid,
-                         info.to_pid
 -                binder_debug!(
 -                    FailedTransaction,
 -                    "transaction {} to {}:{} failed {:?}, code {} size {}=
-{}",
 -                    if info.is_reply {
 -                        "reply"
 -                    } else if info.is_oneway() {
 -                        "async"
 -                    } else {
 -                        "call"
 -                    },
 -                    info.to_pid,
 -                    info.to_tid,
 -                    err,
 -                    info.code,
 -                    info.data_size,
 -                    info.offsets_size
 -                );
++                    binder_debug!(
++                        FailedTransaction,
++                        "transaction {} to {}:{} failed {:?}, code {} siz=
e {}-{}",
++                        if info.is_reply {
++                            "reply"
++                        } else if info.is_oneway() {
++                            "async"
++                        } else {
++                            "call"
++                        },
++                        info.to_pid,
++                        info.to_tid,
++                        err,
++                        info.code,
++                        info.data_size,
++                        info.offsets_size
 +                    );
-                 }
              }
          }
 =20

--UEes+c8ww1MHHZ5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeNFkACgkQJNaLcl1U
h9AhHAf/RV3SUHI8+kp663sPUOJzSyuxxe2jKL3R+SoLZnFmkVs5UY7oVd8QDLRL
B8pL8+O7I96k8ihBP2UUtP7xX6DXYvSQDyDZZpel3/xS0Pxja1PArDQhlZEWMjxd
6UejfuuQhaL0u3O9IJ4s/KP4NefNjMbfnakuxoVoH2ffe5vvyzzoFyWd8FKoDHuq
0D57cy3eotrUdsSQLYhygdQbkD4GHk+YwwdoK0DiE3mVj+dGENxfxsmZ/Z6dFL95
KdGLnamEuUTbdggR4NzEeb+RY4J0TBtWdfE+GnzMIUkleXfGvF1tNvGRWakRYL4P
qG3S7nBMt5twq+pJ6B+EnOyu9vu2nA==
=odnh
-----END PGP SIGNATURE-----

--UEes+c8ww1MHHZ5x--
