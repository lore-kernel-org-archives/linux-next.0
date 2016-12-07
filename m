From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the crypto-current tree
Date: Thu, 8 Dec 2016 08:31:16 +1100
Message-ID: <20161208083116.7881820c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Mueller <smueller@chronox.de>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

After merging the crypto-current tree, today's linux-next build (x86_64
allmodconig) produced this warning:

crypto/algif_aead.c: In function 'aead_recvmsg':
crypto/algif_aead.c:539:9: warning: 'outlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
  return err ? err : outlen;
         ^
crypto/algif_aead.c:423:9: note: 'outlen' was declared here
  size_t outlen;
         ^

Introduced by commit

  0c1e16cd1ec4 ("crypto: algif_aead - fix AEAD tag memory handling")

-- 
Cheers,
Stephen Rothwell
