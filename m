From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with Linus' tree
Date: Mon, 12 Oct 2015 13:38:10 +1100
Message-ID: <20151012133810.325d7bc5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33623 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752662AbbJLCiM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 11 Oct 2015 22:38:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Benoit Lemarchand <benoit.lemarchand@gmail.com>

Hi Jonathan,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/Changes

between commit:

  283e8ba2dfde ("MODSIGN: Change from CMS to PKCS#7 signing if the openssl is too old")

from Linus' tree and commit:

  1c3a54e257f7 ("Documentation/Changes: Add bc in "Current Minimal Requirements" section")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/Changes
index f447f0516f07,268a849c4cc0..000000000000
--- a/Documentation/Changes
+++ b/Documentation/Changes
@@@ -43,7 -43,8 +43,8 @@@ o  udev                   08
  o  grub                   0.93                    # grub --version || grub-install --version
  o  mcelog                 0.6                     # mcelog --version
  o  iptables               1.4.2                   # iptables -V
 -o  openssl & libcrypto    1.0.1k                  # openssl version
 +o  openssl & libcrypto    1.0.0                   # openssl version
+ o  bc                     1.06.95                 # bc --version
  
  
  Kernel compilation
