Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE61369D71;
	Tue, 11 Aug 2026 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461340; cv=none; b=ZlkXTE678woAbzP349rcK59G84X7+CoghUWqnNKFkCNZy4w2NMv2Di1VGS2OZXfMfelpPcAbgrMIQEZaYUSoiDIMK4ZnoFUrr7ggn6WxpiybWkdNEYashKofUhxUuyyfxgy2m5Q7e5EQg1gLyu3hY9Bijog4e7fDFGerxjNsLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461340; c=relaxed/simple;
	bh=e04YXYj3P6JKbZjMO78H2/qHGVQ9mb2eReXj9r9FouI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f61mNJd9aTb04SUgrIuSR0txb05V6JH8zCp9xJWgdU9LOqTKZgyMNEcEMIqeCLg2tHvAcseWwAutnHeIBsRi8mR0yC0oVLxhtYjv/XViQrfu/6m8RdlANBnKEtIoSQwKCE1dOY0umZ0Vhl1SkUlQU3NsyJeYXkLBG2dV3++yj9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln+cIipQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln+cIipQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8819B1F000E9;
	Tue, 11 Aug 2026 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786461339;
	bh=BK9ZHAB16zdsNQzm9fzc3YNg7h04rWD1jucbBnZPc4c=;
	h=Date:From:To:Cc:Subject;
	b=ln+cIipQDKa1qMhblBAbUR8kGeu4MJQSFd7p1rFHhmYsX3UoGZYyMOH0FpnASbAYj
	 1PpujgGqNQun8ZkhxBiEsYKLK1YFiEr9V3BDMK/QwVjKsefmEnQEFMHINz0TKoE4sx
	 7biVlrqlEkDAd8pvmd/f/L38PuwFM4BxtdG8fsZR+PRJLc289pDNpKZrqiiliBsdHX
	 /OHHvdZD0W5O1k49tY69iqX+NiKWT0JmX/WUruUGSR7zWykincp/GQOt1G6BOMnk7W
	 Ag8je/a2g7Jcd0jL4jzyDMqUZd1qA0G2WHrKjxn5lm/y68QWpio64+GiX8F9sWp6jr
	 rW6zQmIMKjTOQ==
Date: Tue, 11 Aug 2026 16:15:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Subject: linux-next: manual merge of the char-misc tree with the rust tree
Message-ID: <ans8lsGbkro4pO6N@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pE3Ge7QndP22UbZI"
Content-Disposition: inline


--pE3Ge7QndP22UbZI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  rust/uapi/uapi_helper.h

between commit:

  cdfcaa36ac93a ("rust: uapi: replace direct asm-generic/ioctl.h include wi=
th linux/ioctl.h")

=66rom the rust tree and commit:

  f14e0c8183bc7 ("rust_binder: report netlink transactions")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/uapi/linux/kvm.h
index 70e36e6a0ad4b,9fc8dfdfd65ff..0000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -997,7 -997,7 +997,8 @@@ struct kvm_enable_cap=20
  #define KVM_CAP_S390_KEYOP 247
  #define KVM_CAP_S390_VSIE_ESAMODE 248
  #define KVM_CAP_S390_HPAGE_2G 249
 -#define KVM_CAP_ARM_PMU_V3_STRICT 250
 +#define KVM_CAP_PPC_COMPAT_CAPS 250
++#define KVM_CAP_ARM_PMU_V3_STRICT 251
 =20
  struct kvm_irq_routing_irqchip {
  	__u32 irqchip;

--pE3Ge7QndP22UbZI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7PJYACgkQJNaLcl1U
h9C72wf/dl3K7yOAbcctQzFU+BonA1h+yfIOD9hianTZNBwZ14nb6z7W5DoQ3rnx
C+hcp8wNCJ35en7L1ZQaYd5z7qRtuTdXHui8l38nR+Bdg/NIGj/vPcyj7UGCW0jl
retiNp3InqgABwzLH9fw8Tm/Bk6NIUynvfyO5W8V+T+55N19H2EuhnzfE3QZitZV
+iuFJQzOLUoZ73phesqhklY67mgE5T9pXAbsif/GlKVOALG/Kw2nX8VNKW5FRhcE
vnCq71zJJpO252esN+h17ajh+G7XSQHQFo1G2Gl9NfiXGFTuzAcOq3Wb2e/0WXtg
zMf2YyNo9tk3Es7BxOEGO9v4WbgWaQ==
=P2uv
-----END PGP SIGNATURE-----

--pE3Ge7QndP22UbZI--
