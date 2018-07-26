From: "Steve Wise" <swise@opengridcomputing.com>
Subject: RE: linux-next: build failure after merge of the block tree
Date: Thu, 26 Jul 2018 07:32:16 -0500
Message-ID: <011b01d424dc$b0a69820$11f3c860$@opengridcomputing.com>
References: <20180726145624.13a604ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726145624.13a604ed@canb.auug.org.au>
Content-Language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Jens Axboe' <axboe@kernel.dk>, 'Doug Ledford' <dledford@redhat.com>, 'Jason Gunthorpe' <jgg@mellanox.com>
Cc: 'Linux-Next Mailing List' <linux-next@vger.kernel.org>, 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>, 'Christoph Hellwig' <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hey Stephen:

> I have applied the following merge fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 26 Jul 2018 14:32:15 +1000
> Subject: [PATCH] nvme-dma: merge fix up for replacement of max_sge
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/nvme/host/rdma.c   | 2 +-
>  drivers/nvme/target/rdma.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
> index cfa0319fcd1c..368fe5ac0c6b 100644
> --- a/drivers/nvme/host/rdma.c
> +++ b/drivers/nvme/host/rdma.c
> @@ -378,7 +378,7 @@ nvme_rdma_find_get_device(struct rdma_cm_id
> *cm_id)
>  	}
> 
>  	ndev->num_inline_segments =
> min(NVME_RDMA_MAX_INLINE_SEGMENTS,
> -					ndev->dev->attrs.max_sge - 1);
> +					ndev->dev->attrs.max_send_sge - 1);
>  	list_add(&ndev->entry, &device_list);
>  out_unlock:
>  	mutex_unlock(&device_list_mutex);
> diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
> index 86121a7a19b2..8c30ac7d8078 100644
> --- a/drivers/nvme/target/rdma.c
> +++ b/drivers/nvme/target/rdma.c
> @@ -891,7 +891,7 @@ nvmet_rdma_find_get_device(struct rdma_cm_id
> *cm_id)
> 
>  	inline_page_count = num_pages(port->inline_data_size);
>  	inline_sge_count = max(cm_id->device->attrs.max_sge_rd,
> -				cm_id->device->attrs.max_sge) - 1;
> +				cm_id->device->attrs.max_send_sge) - 1;

This should actually be max_recv_sge.

Thanks!

Steve.
