From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the integrity tree with the jc-docs tree
Date: Wed, 18 Oct 2017 11:50:25 +0100
Message-ID: <20171018105025.pj5rewvvg5vxhzbw@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dnfe6ffk27iphesa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36052 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750817AbdJRKud (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Oct 2017 06:50:33 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@google.com>, Tom Saeger <tom.saeger@oracle.com>, Jonathan Corbet <corbet@lwn.net>, Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--dnfe6ffk27iphesa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  Documentation/ABI/testing/evm

between commit:

  c7f66400f504fd5 ("Documentation: fix security related doc refs")

=66rom the jc-docs tree and commit:

  cbad39d632b7c18 ("EVM: Allow userspace to signal an RSA key has been load=
ed")

=66rom the integrity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/ABI/testing/evm
index ca622c9aa24c,a0bbccb00736..000000000000
--- a/Documentation/ABI/testing/evm
+++ b/Documentation/ABI/testing/evm
@@@ -7,17 -7,36 +7,36 @@@ Description
  		HMAC-sha1 value across the extended attributes, storing the
  		value as the extended attribute 'security.evm'.
 =20
- 		EVM depends on the Kernel Key Retention System to provide it
- 		with a trusted/encrypted key for the HMAC-sha1 operation.
- 		The key is loaded onto the root's keyring using keyctl.  Until
- 		EVM receives notification that the key has been successfully
- 		loaded onto the keyring (echo 1 > <securityfs>/evm), EVM
- 		can not create or validate the 'security.evm' xattr, but
- 		returns INTEGRITY_UNKNOWN.  Loading the key and signaling EVM
- 		should be done as early as possible.  Normally this is done
- 		in the initramfs, which has already been measured as part
- 		of the trusted boot.  For more information on creating and
- 		loading existing trusted/encrypted keys, refer to:
- 		Documentation/security/keys/trusted-encrypted.rst.  (A sample
- 		dracut patch, which loads the trusted/encrypted key and enables
- 		EVM, is available from http://linux-ima.sourceforge.net/#EVM.)
+ 		EVM supports two classes of security.evm. The first is
+ 		an HMAC-sha1 generated locally with a
+ 		trusted/encrypted key stored in the Kernel Key
+ 		Retention System. The second is a digital signature
+ 		generated either locally or remotely using an
+ 		asymmetric key. These keys are loaded onto root's
+ 		keyring using keyctl, and EVM is then enabled by
+ 		echoing a value to <securityfs>/evm:
+=20
+ 		1: enable HMAC validation and creation
+ 		2: enable digital signature validation
+ 		3: enable HMAC and digital signature validation and HMAC
+ 		   creation
+=20
+ 		Further writes will be blocked if HMAC support is enabled or
+ 		if bit 32 is set:
+=20
+ 		echo 0x80000002 ><securityfs>/evm
+=20
+ 		will enable digital signature validation and block
+ 		further writes to <securityfs>/evm.
+=20
+ 		Until this is done, EVM can not create or validate the
+ 		'security.evm' xattr, but returns INTEGRITY_UNKNOWN.
+ 		Loading keys and signaling EVM should be done as early
+ 		as possible.  Normally this is done in the initramfs,
+ 		which has already been measured as part of the trusted
+ 		boot.  For more information on creating and loading
+ 		existing trusted/encrypted keys, refer to:
 -		Documentation/keys-trusted-encrypted.txt. Both dracut
++		Documentation/security/keys/trusted-encrypted.rst. Both dracut
+ 		(via 97masterkey and 98integrity) and systemd (via
+ 		core/ima-setup) have support for loading keys at boot
+ 		time.

--dnfe6ffk27iphesa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnnMfAACgkQJNaLcl1U
h9D2qAf6AyOWBSnMiNYndia/U8yWZxPU8EO/26/AdfBoB5RsFjBSTM8UxE92OiYz
OQxjmZeykSsO6V1oeknk0hqy2FwZHpNwLFS+IdO9NwsO35vPY3gM5uCo5togj0jv
xL3kTC4NrOnjTouHVqEXAADFEjmPXlJ2yRZqdrahKEUzFeXxxfcT4a3LijrQ5kRC
ENdSIyGGYCSm/7lTUKRElprggJD7PG7K/yanjrQRLqpc47xBXlAbCOLtCr1v9Q/C
NRFGkhGrNXL4LYmlvc61AEvDtGSaO25jyyqOIa61ihdYxvKPM+2EEY2sedZEb17J
+mZKcetjzPX1oemwKJsu3hpUQ/X2xQ==
=48Er
-----END PGP SIGNATURE-----

--dnfe6ffk27iphesa--
