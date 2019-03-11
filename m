From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Sun, 10 Mar 2019 19:44:34 -0700
Message-ID: <20190311024434.GA19508@bombadil.infradead.org>
References: <20190221171332.262cf619@canb.auug.org.au>
 <20190221123440.GD17501@mtr-leonro.mtl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190221123440.GD17501@mtr-leonro.mtl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leonro@mellanox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 21, 2019 at 12:34:42PM +0000, Leon Romanovsky wrote:
> On Thu, Feb 21, 2019 at 05:13:32PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the xarray tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:

[API change]

So I ended up being really busy last week and not having time to send
my merge request for XArray yet.  I'm going to send a request this week;
Leon and Jason, how does this merge resolution look?

Compile tested only.

diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index a9f29156e486..8a93c0c95953 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -668,19 +668,10 @@ static int assign_name(struct ib_device *device, const char *name)
 	}
 	strlcpy(device->name, dev_name(&device->dev), IB_DEVICE_NAME_MAX);
 
-	/* Cyclically allocate a user visible ID for the device */
-	device->index = last_id;
-	ret = xa_alloc(&devices, &device->index, INT_MAX, device, GFP_KERNEL);
-	if (ret == -ENOSPC) {
-		device->index = 0;
-		ret = xa_alloc(&devices, &device->index, INT_MAX, device,
-			       GFP_KERNEL);
-	}
-	if (ret)
-		goto out;
-	last_id = device->index + 1;
-
-	ret = 0;
+	ret = xa_alloc_cyclic(&devices, &device->index, device, xa_limit_31b,
+			&last_id, GFP_KERNEL);
+	if (ret > 0)
+		ret = 0;
 
 out:
 	up_write(&devices_rwsem);
@@ -1059,14 +1050,14 @@ static int assign_client_id(struct ib_client *client)
 	 * to get the LIFO order. The extra linked list can go away if xarray
 	 * learns to reverse iterate.
 	 */
-	if (list_empty(&client_list))
+	if (list_empty(&client_list)) {
 		client->client_id = 0;
-	else
-		client->client_id =
-			list_last_entry(&client_list, struct ib_client, list)
-				->client_id;
-	ret = xa_alloc(&clients, &client->client_id, INT_MAX, client,
-		       GFP_KERNEL);
+	} else {
+		struct ib_client *last = list_last_entry(&client_list,
+				struct ib_client, list);
+		client->client_id = last->client_id + 1;
+	}
+	ret = xa_insert(&clients, client->client_id, client, GFP_KERNEL);
 	if (ret)
 		goto out;
 
diff --git a/drivers/infiniband/core/restrack.c b/drivers/infiniband/core/restrack.c
index fa804093fafb..3b5ff2f7b5f8 100644
--- a/drivers/infiniband/core/restrack.c
+++ b/drivers/infiniband/core/restrack.c
@@ -13,28 +13,6 @@
 #include "cma_priv.h"
 #include "restrack.h"
 
-static int rt_xa_alloc_cyclic(struct xarray *xa, u32 *id, void *entry,
-			      u32 *next)
-{
-	int err;
-
-	*id = *next;
-	if (*next == U32_MAX)
-		*id = 0;
-
-	xa_lock(xa);
-	err = __xa_alloc(xa, id, U32_MAX, entry, GFP_KERNEL);
-	if (err && *next != U32_MAX) {
-		*id = 0;
-		err = __xa_alloc(xa, id, *next, entry, GFP_KERNEL);
-	}
-
-	if (!err)
-		*next = *id + 1;
-	xa_unlock(xa);
-	return err;
-}
-
 /**
  * rdma_restrack_init() - initialize and allocate resource tracking
  * @dev:  IB device
@@ -226,7 +204,8 @@ static void rdma_restrack_add(struct rdma_restrack_entry *res)
 	kref_init(&res->kref);
 	init_completion(&res->comp);
 	if (res->type != RDMA_RESTRACK_QP)
-		ret = rt_xa_alloc_cyclic(&rt->xa, &res->id, res, &rt->next_id);
+		ret = xa_alloc_cyclic(&rt->xa, &res->id, res, xa_limit_32b,
+				&rt->next_id, GFP_KERNEL);
 	else {
 		/* Special case to ensure that LQPN points to right QP */
 		struct ib_qp *qp = container_of(res, struct ib_qp, res);
