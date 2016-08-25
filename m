From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build warning after merge of the crypto tree
Date: Thu, 25 Aug 2016 15:47:01 +0800
Message-ID: <20160825074701.GA11175@gondor.apana.org.au>
References: <20160825113824.61ca7364@canb.auug.org.au>
 <20160825082010.5523ae6f@mschwide>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160825082010.5523ae6f@mschwide>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Aug 25, 2016 at 08:20:10AM +0200, Martin Schwidefsky wrote:
> On Thu, 25 Aug 2016 11:38:24 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Herbert,
> > 
> > After merging the crypto tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > crypto/xor.c: In function 'calibrate_xor_blocks':
> > crypto/xor.c:156:1: warning: label 'out' defined but not used [-Wunused-label]
> >  out:
> >  ^
> > 
> > Introduced by commit
> > 
> >   39457acda913 ("crypto: xor - skip speed test if the xor function is selected automatically")
> > 
> > This build does not have XOR_SELECT_TEMPLATE set.
> 
> Hmm, this is probably the best option to get rid of the warning: 

I'm going to do something like this:

---8<---
This patch fixes an unused label warning triggered when the macro
XOR_SELECT_TEMPLATE is not set.

Fixes: 39457acda913 ("crypto: xor - skip speed test if the xor...")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/xor.c b/crypto/xor.c
index b8975d9..69866e9 100644
--- a/crypto/xor.c
+++ b/crypto/xor.c
@@ -113,13 +113,14 @@ calibrate_xor_blocks(void)
 
 #ifdef XOR_SELECT_TEMPLATE
 	fastest = XOR_SELECT_TEMPLATE(fastest);
+#endif
+
 	if (fastest) {
 		printk(KERN_INFO "xor: automatically using best "
 				 "checksumming function   %-10s\n",
 		       fastest->name);
 		goto out;
 	}
-#endif
 
 	/*
 	 * Note: Since the memory is not actually used for _anything_ but to

-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
