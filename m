From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the keys tree with the crypto tree
Date: Wed, 13 Apr 2016 12:03:21 +1000
Message-ID: <20160413120321.396226c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47474 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965107AbcDMCDY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Apr 2016 22:03:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Colin Ian King <colin.king@canonical.com>

Hi David,

Today's linux-next merge of the keys tree got a conflict in:

  crypto/asymmetric_keys/pkcs7_parser.c

between commit:

  06af9b0f4949 ("PKCS#7: fix missing break on OID_sha224 case")

from the crypto tree and commit:

  566a117a8b24 ("PKCS#7: Make the signature a pointer rather than embedding it")

from the keys tree.

I fixed it up (the latter added the same "break" statement) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
