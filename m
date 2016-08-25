From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: build warning after merge of the crypto tree
Date: Thu, 25 Aug 2016 08:20:10 +0200
Message-ID: <20160825082010.5523ae6f@mschwide>
References: <20160825113824.61ca7364@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160825113824.61ca7364@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 25 Aug 2016 11:38:24 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> crypto/xor.c: In function 'calibrate_xor_blocks':
> crypto/xor.c:156:1: warning: label 'out' defined but not used [-Wunused-label]
>  out:
>  ^
> 
> Introduced by commit
> 
>   39457acda913 ("crypto: xor - skip speed test if the xor function is selected automatically")
> 
> This build does not have XOR_SELECT_TEMPLATE set.

Hmm, this is probably the best option to get rid of the warning: 
--
diff --git a/crypto/xor.c b/crypto/xor.c
index b8975d9..f00edfc 100644
--- a/crypto/xor.c
+++ b/crypto/xor.c
@@ -117,7 +117,8 @@ calibrate_xor_blocks(void)
 		printk(KERN_INFO "xor: automatically using best "
 				 "checksumming function   %-10s\n",
 		       fastest->name);
-		goto out;
+		active_template = fastest;
+		return 0;
 	}
 #endif
 
@@ -153,7 +154,6 @@ calibrate_xor_blocks(void)
 #undef xor_speed
 
 	free_pages((unsigned long)b1, 2);
-out:
 	active_template = fastest;
 	return 0;
 }
-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
