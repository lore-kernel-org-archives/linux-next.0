From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [BUG -next] "random: make /dev/urandom scalable for silly
 userspace programs" causes crash
Date: Wed, 27 Jul 2016 23:46:01 -0400
Message-ID: <20160728034601.GC20032@thunk.org>
References: <20160727071400.GA3912@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20160727071400.GA3912@osiris>
Sender: owner-linux-mm@kvack.org
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 27, 2016 at 09:14:00AM +0200, Heiko Carstens wrote:
> it looks like your patch "random: make /dev/urandom scalable for silly
> userspace programs" within linux-next seems to be a bit broken:
> 
> It causes this allocation failure and subsequent crash on s390 with fake
> NUMA enabled

Thanks for reporting this.  This patch fixes things for you, yes?

       	   	     	    	       	     	    - Ted

commit 59b8d4f1f5d26e4ca92172ff6dcd1492cdb39613
Author: Theodore Ts'o <tytso@mit.edu>
Date:   Wed Jul 27 23:30:25 2016 -0400

    random: use for_each_online_node() to iterate over NUMA nodes
    
    This fixes a crash on s390 with fake NUMA enabled.
    
    Reported-by: Heiko Carstens <heiko.carstens@de.ibm.com>
    Fixes: 1e7f583af67b ("random: make /dev/urandom scalable for silly userspace programs")
    Signed-off-by: Theodore Ts'o <tytso@mit.edu>

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 8d0af74..7f06224 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1668,13 +1668,12 @@ static int rand_initialize(void)
 #ifdef CONFIG_NUMA
 	pool = kmalloc(num_nodes * sizeof(void *),
 		       GFP_KERNEL|__GFP_NOFAIL|__GFP_ZERO);
-	for (i=0; i < num_nodes; i++) {
+	for_each_online_node(i) {
 		crng = kmalloc_node(sizeof(struct crng_state),
 				    GFP_KERNEL | __GFP_NOFAIL, i);
 		spin_lock_init(&crng->lock);
 		crng_initialize(crng);
 		pool[i] = crng;
-
 	}
 	mb();
 	crng_node_pool = pool;

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
