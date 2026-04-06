Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED2372667;
	Mon,  6 Apr 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481244; cv=none; b=iu9aPGq89+oAWiNaB8zdCAHRnmXpHhf1lbZQ5vmWYKNtf5m/y5rqmjVe7Y2H0iWxLg2wrKkPI9F05j2uBveZuoIJ5vDjC/8xjUW0WQjnk7H4o6C4lNjBdRScOQ45e9wC375T1GPs1C67Ayge24YxwJnLSgoPx6BdmQ0nd4JRzzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481244; c=relaxed/simple;
	bh=7rwIDcE/MwQeP/3oqDtBB1UXn5AoF+DlFSR0bs/+wjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gxo6k7G/RtaneTUhO+S+22uXrSXELVnVEhAGeOU2htMsXRVtaizTk65STmR61Va7pfqcGtCuucxK2lVHwY3wIn79Kdl3lxSbpj4qKi7FFumw+NnRczUhrn6NSUweeHE6qeO16EyoTizn7mMRVuZ+4eJfAJj/cBj2UIV6efLE7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lq2ZNOpu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lq2ZNOpu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F4FC4CEF7;
	Mon,  6 Apr 2026 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481244;
	bh=7rwIDcE/MwQeP/3oqDtBB1UXn5AoF+DlFSR0bs/+wjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Lq2ZNOpuQNbjYXyetyBASX8jPnlBanB6BTFOpWdr6VnFASgbRkv6I1EtqFtaQrP3f
	 nUJqh48TCCdAtlVbLRA/mHUWVWgg449KTtCeNk5UAuJDK0jDLsldPoSQ2X7Xm5jGfq
	 Z6rqGIlBemC+4+fCco4E8IGw/dvJ1uYB5DhTl8kvMXAScRV9+14lrnpxpNXKAx5YRI
	 jrYwNDRLTz7Ofkpx3js38pPUf2m+bDtG9FeR2T1vjlN0SQyBXnOYkqOMFVzWki7CgQ
	 MDyy8CovD015MBzKDlnGKkUbyFoHl3kvhfZMGhxgMo0c5RywKvuQU/PTWNvx4kDdfz
	 5yLH4wqBY3KjQ==
Date: Mon, 6 Apr 2026 14:14:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the rust tree
Message-ID: <adOxmJeAu9XZWpUn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Milx+RS6bQy9G67v"
Content-Disposition: inline


--Milx+RS6bQy9G67v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/process/changes.rst

between commits:

  254c422f2f1e0 ("rust: bump Rust minimum supported version to 1.85.0 (Debi=
an Trixie)")
  a032c07f00fc4 ("rust: bump `bindgen` minimum supported version to 0.71.1 =
(Debian Trixie)")

=66rom the rust tree and commit:

  ece7e57afd51e ("docs: changes.rst and ver_linux: sort the lists")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/process/changes.rst
index 84156d0313659,adbd52869458d..0000000000000
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@@ -29,40 -30,41 +30,41 @@@ you probably do not need to concern you
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
          Program        Minimal version       Command to check the version
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
- GNU C                  8.1              gcc --version
- Clang/LLVM (optional)  15.0.0           clang --version
- Rust (optional)        1.85.0           rustc --version
- bindgen (optional)     0.71.1           bindgen --version
- GNU make               4.0              make --version
  bash                   4.2              bash --version
- binutils               2.30             ld -v
- flex                   2.5.35           flex --version
- bison                  2.0              bison --version
- pahole                 1.22             pahole --version
- util-linux             2.10o            mount --version
- kmod                   13               depmod -V
- e2fsprogs              1.41.4           e2fsck -V
- jfsutils               1.1.3            fsck.jfs -V
- xfsprogs               2.6.0            xfs_db -V
- squashfs-tools         4.0              mksquashfs -version
- btrfs-progs            0.18             btrfs --version
- pcmciautils            004              pccardctl -V
- quota-tools            3.09             quota -V
- PPP                    2.4.0            pppd --version
- nfs-utils              1.0.5            showmount --version
- procps                 3.2.0            ps --version
- udev                   081              udevd --version
- grub                   0.93             grub --version || grub-install --=
version
- mcelog                 0.6              mcelog --version
- iptables               1.4.2            iptables -V
- openssl & libcrypto    1.0.0            openssl version
  bc                     1.06.95          bc --version
- Sphinx\ [#f1]_         3.4.3            sphinx-build --version
 -bindgen (optional)     0.65.1           bindgen --version
++bindgen (optional)     0.71.1           bindgen --version
+ binutils               2.30             ld -v
+ bison                  2.0              bison --version
+ btrfs-progs            0.18             btrfs --version
+ Clang/LLVM (optional)  15.0.0           clang --version
+ e2fsprogs              1.41.4           e2fsck -V
+ flex                   2.5.35           flex --version
+ gdb                    7.2              gdb --version
+ GNU awk (optional)     5.1.0            gawk --version
+ GNU C                  8.1              gcc --version
+ GNU make               4.0              make --version
  GNU tar                1.28             tar --version
+ GRUB                   0.93             grub --version || grub-install --=
version
  gtags (optional)       6.6.5            gtags --version
+ iptables               1.4.2            iptables -V
+ jfsutils               1.1.3            fsck.jfs -V
+ kmod                   13               kmod -V
+ mcelog                 0.6              mcelog --version
  mkimage (optional)     2017.01          mkimage --version
+ nfs-utils              1.0.5            showmount --version
+ openssl & libcrypto    1.0.0            openssl version
+ pahole                 1.22             pahole --version
+ pcmciautils            004              pccardctl -V
+ PPP                    2.4.0            pppd --version
+ procps                 3.2.0            ps --version
  Python                 3.9.x            python3 --version
- GNU AWK (optional)     5.1.0            gawk --version
+ quota-tools            3.09             quota -V
 -Rust (optional)        1.78.0           rustc --version
++Rust (optional)        1.85.0           rustc --version
+ Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+ squashfs-tools         4.0              mksquashfs -version
+ udev                   081              udevadm --version
+ util-linux             2.10o            mount --version
+ xfsprogs               2.6.0            xfs_db -V
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
 =20
  .. [#f1] Sphinx is needed only to build the Kernel documentation

--Milx+RS6bQy9G67v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTsZcACgkQJNaLcl1U
h9CpKggAg1Zc6lpXVKWrE6ECghcjjZxigGzQY0gd0+sB1Mg90eGmVCAl3mQj9KFI
Pl4TqoyKAVvsbT/HWJH+sr3miaeZQJQioZ8/RJd4EAGGJH9aoayQfLOkmfG+z55E
g8G8J+B9hI2+vur93x9r3JS/uKPWXp9VmZ2BICSAfOA/XO/VCsyj7VkqVijx37VJ
QquqvXFwcHtp8EnjsBT/OJH1hUjBWr9kRL67vpfSzuv3H71D3Wfn022dDcgh0Idr
RFmUy0qGJYvbz7ZTb/AEqiCEgWsXwOUu9xi5ZV18aIZf+imAX+ds5MAftB+8ivCB
Yr3GY0plb8qu2ZIbqKrS3maogz2NcA==
=Wqzy
-----END PGP SIGNATURE-----

--Milx+RS6bQy9G67v--
