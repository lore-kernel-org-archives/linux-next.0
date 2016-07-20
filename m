From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Wed, 20 Jul 2016 17:46:34 +1000
Message-ID: <20160720174634.53bad636@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38895 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751580AbcGTHqh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 03:46:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paulo Flabiano Smorigo <pfsmorigo@linux.vnet.ibm.com>, "Leonidas S. Barbosa" <leosilva@linux.vnet.ibm.com>

Hi all,

After merging the dax-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/crypto/vmx/aesp8-ppc.S: Assembler messages:
drivers/crypto/vmx/aesp8-ppc.S:2036: Error: symbol `.aes_p8_xts_decrypt' is already defined

Caused by commit

  11c6e16ee13a ("crypto: vmx - Adding asm subroutines for XTS")

I have reverted that commit (and commit c07f5d3da643 ("crypto: vmx -
Adding support for XTS")) for today.

-- 
Cheers,
Stephen Rothwell
