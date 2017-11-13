From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the integrity tree with the jc-docs
 tree
Date: Mon, 13 Nov 2017 16:35:24 +1100
Message-ID: <20171113163524.797e17d4@canb.auug.org.au>
References: <20171018105025.pj5rewvvg5vxhzbw@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751756AbdKMFf0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:35:26 -0500
In-Reply-To: <20171018105025.pj5rewvvg5vxhzbw@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Mimi Zohar <zohar@linux.vnet.ibm.com>, James Morris <jmorris@namei.org>
Cc: Mark Brown <broonie@kernel.org>, Matthew Garrett <mjg59@google.com>, Tom Saeger <tom.saeger@oracle.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Wed, 18 Oct 2017 11:50:25 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the integrity tree got a conflict in:
> 
>   Documentation/ABI/testing/evm
> 
> between commit:
> 
>   c7f66400f504fd5 ("Documentation: fix security related doc refs")
> 
> from the jc-docs tree and commit:
> 
>   cbad39d632b7c18 ("EVM: Allow userspace to signal an RSA key has been loaded")
> 
> from the integrity tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc Documentation/ABI/testing/evm
> index ca622c9aa24c,a0bbccb00736..000000000000
> --- a/Documentation/ABI/testing/evm
> +++ b/Documentation/ABI/testing/evm
> @@@ -7,17 -7,36 +7,36 @@@ Description
>   		HMAC-sha1 value across the extended attributes, storing the
>   		value as the extended attribute 'security.evm'.
>   
> - 		EVM depends on the Kernel Key Retention System to provide it
> - 		with a trusted/encrypted key for the HMAC-sha1 operation.
> - 		The key is loaded onto the root's keyring using keyctl.  Until
> - 		EVM receives notification that the key has been successfully
> - 		loaded onto the keyring (echo 1 > <securityfs>/evm), EVM
> - 		can not create or validate the 'security.evm' xattr, but
> - 		returns INTEGRITY_UNKNOWN.  Loading the key and signaling EVM
> - 		should be done as early as possible.  Normally this is done
> - 		in the initramfs, which has already been measured as part
> - 		of the trusted boot.  For more information on creating and
> - 		loading existing trusted/encrypted keys, refer to:
> - 		Documentation/security/keys/trusted-encrypted.rst.  (A sample
> - 		dracut patch, which loads the trusted/encrypted key and enables
> - 		EVM, is available from http://linux-ima.sourceforge.net/#EVM.)
> + 		EVM supports two classes of security.evm. The first is
> + 		an HMAC-sha1 generated locally with a
> + 		trusted/encrypted key stored in the Kernel Key
> + 		Retention System. The second is a digital signature
> + 		generated either locally or remotely using an
> + 		asymmetric key. These keys are loaded onto root's
> + 		keyring using keyctl, and EVM is then enabled by
> + 		echoing a value to <securityfs>/evm:
> + 
> + 		1: enable HMAC validation and creation
> + 		2: enable digital signature validation
> + 		3: enable HMAC and digital signature validation and HMAC
> + 		   creation
> + 
> + 		Further writes will be blocked if HMAC support is enabled or
> + 		if bit 32 is set:
> + 
> + 		echo 0x80000002 ><securityfs>/evm
> + 
> + 		will enable digital signature validation and block
> + 		further writes to <securityfs>/evm.
> + 
> + 		Until this is done, EVM can not create or validate the
> + 		'security.evm' xattr, but returns INTEGRITY_UNKNOWN.
> + 		Loading keys and signaling EVM should be done as early
> + 		as possible.  Normally this is done in the initramfs,
> + 		which has already been measured as part of the trusted
> + 		boot.  For more information on creating and loading
> + 		existing trusted/encrypted keys, refer to:
>  -		Documentation/keys-trusted-encrypted.txt. Both dracut
> ++		Documentation/security/keys/trusted-encrypted.rst. Both dracut
> + 		(via 97masterkey and 98integrity) and systemd (via
> + 		core/ima-setup) have support for loading keys at boot
> + 		time.

Just a reminder that this conflict still exists (and is now relevant to
the security tree).

-- 
Cheers,
Stephen Rothwell
