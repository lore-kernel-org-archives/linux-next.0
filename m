Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A13624B8;
	Fri,  6 Mar 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801927; cv=none; b=kwAeapz/+z+z63QA1vSIcxJDhTFMDbyYupaZq75MdyQEQN4/LWVTg/seoUBDDSB4IiaEhADNXucJHniEA4skoVQoPmjyEf54CzWc5RryP0m17ilWupHv9OX0Jd7eTIrgt6vMjeSv4XOI8jGNATEEzA3B0vkixxqDmEtRwUcnWjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801927; c=relaxed/simple;
	bh=qkjbMpCxpkt6aCVMXAbZsBf26ONdRhk73SzT9XMJUQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dp/XitQsFXSMJAE86Hxv6FkYP5CoM6CPERzCRiIjhfMf6J4BWBjiy86bupn5wrAu9B2Npvz+QHjsueA57TBTRYjjCE8gB3PDmT2RqS4B+hjrap581RlfrJSA770oD8ThfOov64Le4tTpIGGVmzuY1R9KPzPJz32p6McBqhwHGcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhTE0S+H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhTE0S+H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50BFC2BC86;
	Fri,  6 Mar 2026 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772801927;
	bh=qkjbMpCxpkt6aCVMXAbZsBf26ONdRhk73SzT9XMJUQU=;
	h=Date:From:To:Cc:Subject:From;
	b=bhTE0S+Hmb86JueebPQKObM28hvZ4/Qlbka0MlTnOw4FnRsnfHhMm3mNvWrFi7+x8
	 95DE+pstfVq+zHIwAdLQGrysx2JQ/lCebuyLZEEzuazwrl7pY2qLajTCR1NnqeG/Db
	 qkLEDR5Ba/ufVV++XkWsrsyrl8Wmj7nH0mxiK1EWEMrTk0wRVIeGWhVd80xSMhfJCc
	 z2eDCp98MNFB44Q1i/LedvqsM0UBDy2W3NylnK5YWoraXlDsDGaZex/p5193o/RJYc
	 Cj/PbXA/48E5k8u9no3bHGVXxrsKolg2ZAmTMDLO9hHyzhuCh67FNZMK1p1+qnkFFw
	 RiNCWBNS9JzSA==
Date: Fri, 6 Mar 2026 12:58:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, David Hildenbrand <david@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-unstable tree with the
 char-misc.current tree
Message-ID: <aarPg_AVR3TN9frW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dutRrOaDo7JBUUuJ"
Content-Disposition: inline


--dutRrOaDo7JBUUuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  drivers/android/binder/page_range.rs

between commit:

  8ef2c15aeae07 ("rust_binder: check ownership before using vma")

=66rom the char-misc.current tree and commit:

  3c9b6aa5c9119 ("mm: rename zap_page_range_single() to zap_vma_range()")

=66rom the mm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/android/binder/page_range.rs
index 9dfc154e5dd4e,2fddd4ed8d4c4..0000000000000
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@@ -759,11 -717,9 +759,11 @@@ unsafe extern "C" fn rust_shrink_free_p
      // SAFETY: The lru lock is locked when this method is called.
      unsafe { bindings::spin_unlock(&raw mut (*lru).lock) };
 =20
 -    if let Some(vma) =3D mmap_read.vma_lookup(vma_addr) {
 -        let user_page_addr =3D vma_addr + (page_index << PAGE_SHIFT);
 -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
 +    if let Some(unchecked_vma) =3D mmap_read.vma_lookup(vma_addr) {
 +        if let Some(vma) =3D check_vma(unchecked_vma, range_ptr) {
 +            let user_page_addr =3D vma_addr + (page_index << PAGE_SHIFT);
-             vma.zap_page_range_single(user_page_addr, PAGE_SIZE);
++            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
 +        }
      }
 =20
      drop(mmap_read);

--dutRrOaDo7JBUUuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqz4IACgkQJNaLcl1U
h9CIegf/Unl2v4sioCZWDjMi6be31k3dQW1T7z5TbaE3SXyVDD8s4Vw0azkhfQZ1
nu2g1zdyfYLBDUXITusYv+cxtGiKDQO1b4JSsJBIyvUBY9lpzReK+kCAvwWk+Pk2
FIgh8EIQMPWC8MTGbjXZpqMCt5qfbtTebu7UzV5zWoeGb1IdXJGXbzk2MhGHchy2
fEdOelLrw4yR7vqg2EybEriU4hi5STMXddX2PO+3FIe/xe2Fhr6S5hwWd9VMehrY
//z3to69XWCBHDoGnrM3hJa6ld51GPDGZ5sLxhsVecJcT+71v5peAbXHCgEt720s
1d1x05Tk+VJ23pMwSnH219/v1xsSpQ==
=yx/z
-----END PGP SIGNATURE-----

--dutRrOaDo7JBUUuJ--
