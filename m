From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the random tree with the kspp tree
Date: Tue, 26 Jul 2016 14:52:52 +1000
Message-ID: <20160726145252.3d820d06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42074 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754540AbcGZEwy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jul 2016 00:52:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>

Hi Theodore,

Today's linux-next merge of the random tree got a conflict in:

  drivers/char/random.c

between commit:

  8c6a68e9eaa5 ("latent_entropy: Mark functions with __latent_entropy")

from the kspp tree and commit:

  e192be9d9a30 ("random: replace non-blocking pool with a Chacha20-based CRNG")

from the random tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/char/random.c
index 6cca3ed45817,8d0af74f6569..000000000000
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@@ -442,10 -471,15 +471,15 @@@ struct entropy_store 
  	__u8 last_data[EXTRACT_SIZE];
  };
  
+ static ssize_t extract_entropy(struct entropy_store *r, void *buf,
+ 			       size_t nbytes, int min, int rsvd);
+ static ssize_t _extract_entropy(struct entropy_store *r, void *buf,
+ 				size_t nbytes, int fips);
+ 
+ static void crng_reseed(struct crng_state *crng, struct entropy_store *r);
  static void push_to_pool(struct work_struct *work);
 -static __u32 input_pool_data[INPUT_POOL_WORDS];
 -static __u32 blocking_pool_data[OUTPUT_POOL_WORDS];
 +static __u32 input_pool_data[INPUT_POOL_WORDS] __latent_entropy;
 +static __u32 blocking_pool_data[OUTPUT_POOL_WORDS] __latent_entropy;
- static __u32 nonblocking_pool_data[OUTPUT_POOL_WORDS] __latent_entropy;
  
  static struct entropy_store input_pool = {
  	.poolinfo = &poolinfo_table[0],
