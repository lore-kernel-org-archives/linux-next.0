From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the integrity tree with the security
 tree
Date: Thu, 2 Nov 2017 13:02:02 +1100
Message-ID: <20171102130202.4f6e5d18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  MAINTAINERS

between commit:

  e28aa8aeab43 ("MAINTAINERS: remove David Safford as maintainer for encrypted+trusted keys")

from the security tree and commit:

  46d6c35e6882 ("MAINTAINERS: update the IMA, EVM, trusted-keys, encrypted-keys entries")

from the integrity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index df4a2519b306,80023acd6a7c..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -7680,7 -7623,8 +7677,7 @@@ F:	kernel/kexec
  
  KEYS-ENCRYPTED
  M:	Mimi Zohar <zohar@linux.vnet.ibm.com>
- L:	linux-security-module@vger.kernel.org
 -M:	David Safford <safford@us.ibm.com>
+ L:	linux-integrity@vger.kernel.org
  L:	keyrings@vger.kernel.org
  S:	Supported
  F:	Documentation/security/keys/trusted-encrypted.rst
@@@ -7688,8 -7632,9 +7685,8 @@@ F:	include/keys/encrypted-type.
  F:	security/keys/encrypted-keys/
  
  KEYS-TRUSTED
 -M:	David Safford <safford@us.ibm.com>
  M:	Mimi Zohar <zohar@linux.vnet.ibm.com>
- L:	linux-security-module@vger.kernel.org
+ L:	linux-integrity@vger.kernel.org
  L:	keyrings@vger.kernel.org
  S:	Supported
  F:	Documentation/security/keys/trusted-encrypted.rst
