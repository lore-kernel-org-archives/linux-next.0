From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Tue, 12 Feb 2019 08:15:28 -0800
Message-ID: <20190212161528.GN12668@bombadil.infradead.org>
References: <20190212162003.1aa1ffbd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212162003.1aa1ffbd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 12, 2019 at 04:20:03PM +1100, Stephen Rothwell wrote:
> Caused by commit
> 
>   a3e4d3f97ec8 ("XArray: Redesign xa_alloc API")
> 
> interacting with commits
> 
>   e59178d895af ("RDMA/devices: Use xarray to store the clients")
>   0df91bb67334 ("RDMA/devices: Use xarray to store the client_data")
> 
> from the rdma tree.
> 
> Its a bit of a pain modifying a published API like this :-(

Yes, it is.  I wasn't expecting people to actually start using it ;-)

Seriously, there are several defects in the published API which do
warrant a change.  The most severe one is that it's really easy to
forget to initialise the start index.  And while I'm making that change,
I should fix smaller things like the errno at the same time.

> I have added the following merge fixup patch for today (I assume some
> of the assignments are also now redundant).

I think the first of these should be using the alloc_cyclic API, like this:

diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index 283ecc2aee89..d0b56c70a553 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -586,20 +586,8 @@ static int assign_name(struct ib_device *device, const char *name)
 	}
 	strlcpy(device->name, dev_name(&device->dev), IB_DEVICE_NAME_MAX);
 
-	/* Cyclically allocate a user visible ID for the device */
-	device->index = last_id;
-	ret = xa_alloc(&devices, &device->index, device,
-		       XA_LIMIT(last_id, INT_MAX), GFP_KERNEL);
-	if (ret == -ENOSPC) {
-		device->index = 0;
-		ret = xa_alloc(&devices, &device->index, device,
-			       XA_LIMIT(0, INT_MAX), GFP_KERNEL);
-	}
-	if (ret)
-		goto out;
-	last_id = device->index + 1;
-
-	ret = 0;
+	ret = xa_alloc_cyclic(&devices, &device->index, device, xa_limit_31b,
+			&last_id, GFP_KERNEL);
 
 out:
 	up_write(&devices_rwsem);
@@ -750,7 +738,7 @@ int ib_register_device(struct ib_device *device, const char *name)
 	int ret;
 
 	ret = assign_name(device, name);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	ret = setup_device(device);
