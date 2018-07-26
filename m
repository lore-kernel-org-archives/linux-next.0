From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 26 Jul 2018 10:48:33 +0200
Message-ID: <20180726084833.GA23310@lst.de>
References: <20180726145624.13a604ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180726145624.13a604ed@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Wise <swise@opengridcomputing.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 26, 2018 at 02:56:24PM +1000, Stephen Rothwell wrote:
> diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
> index 86121a7a19b2..8c30ac7d8078 100644
> --- a/drivers/nvme/target/rdma.c
> +++ b/drivers/nvme/target/rdma.c
> @@ -891,7 +891,7 @@ nvmet_rdma_find_get_device(struct rdma_cm_id *cm_id)
>  
>  	inline_page_count = num_pages(port->inline_data_size);
>  	inline_sge_count = max(cm_id->device->attrs.max_sge_rd,
> -				cm_id->device->attrs.max_sge) - 1;
> +				cm_id->device->attrs.max_send_sge) - 1;

This should be max_recv_sge.
