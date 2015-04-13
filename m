From: Bob Liu <bob.liu@oracle.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
Date: Mon, 13 Apr 2015 16:36:58 +0800
Message-ID: <552B802A.3080709@oracle.com>
References: <20150413180902.59d8e9bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030609070506060203060808"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150413180902.59d8e9bd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Liu <wei.liu2@citrix.com>, David Vrabel <david.vrabel@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--------------030609070506060203060808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 04/13/2015 04:09 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the xen-tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> drivers/char/tpm/xen-tpmfront.c: In function 'setup_ring':
> drivers/char/tpm/xen-tpmfront.c:203:7: warning: passing argument 2 of 'xenbus_grant_ring' makes pointer from integer without a cast
>    rv = xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
>         ^
> In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
> include/xen/xenbus.h:206:5: note: expected 'void *' but argument is of type 'long unsigned int'
>   int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
>       ^
> drivers/char/tpm/xen-tpmfront.c:203:7: error: too few arguments to function 'xenbus_grant_ring'
>    rv = xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
>         ^
> In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
> include/xen/xenbus.h:206:5: note: declared here
>   int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
>       ^
>
> Caused by commit 1b1586eeeb8c ("xenbus_client: Extend interface to
> support multi-page ring").
>
> I have used the xen-tip tree from next-20150410 for today.
>

Sorry for this issue, I missed the xentpm-front.c file in that patch.
(Original patch from Wei Liu already included the right modification 
which didn't exist in Paul's.)

Attached patch should fix this build failure.

-- 
Regards,
-Bob

--------------030609070506060203060808
Content-Type: text/x-patch;
 name="0001-xen-tpmfront-fix-build-error.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xen-tpmfront-fix-build-error.patch"

>From 973eacee793595b9790957186ffd27f192f5dd4f Mon Sep 17 00:00:00 2001
From: Bob Liu <bob.liu@oracle.com>
Date: Mon, 13 Apr 2015 16:29:10 +0800
Subject: [PATCH] xen-tpmfront: fix build failure

Fix build failure caused by commit 1b1586eeeb8c ("xenbus_client: Extend
interface to support multi-page ring"), xen-tpmfront was missed in that commit.

Signed-off-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/char/tpm/xen-tpmfront.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index c3b4f5a..3111f27 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -193,6 +193,7 @@ static int setup_ring(struct xenbus_device *dev, struct tpm_private *priv)
 	struct xenbus_transaction xbt;
 	const char *message = NULL;
 	int rv;
+	grant_ref_t gref;
 
 	priv->shr = (void *)__get_free_page(GFP_KERNEL|__GFP_ZERO);
 	if (!priv->shr) {
@@ -200,11 +201,11 @@ static int setup_ring(struct xenbus_device *dev, struct tpm_private *priv)
 		return -ENOMEM;
 	}
 
-	rv = xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
+	rv = xenbus_grant_ring(dev, &priv->shr, 1, &gref);
 	if (rv < 0)
 		return rv;
 
-	priv->ring_ref = rv;
+	priv->ring_ref = gref;
 
 	rv = xenbus_alloc_evtchn(dev, &priv->evtchn);
 	if (rv)
-- 
1.7.10.4


--------------030609070506060203060808--
