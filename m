From: Bart Van Assche <bart.vanassche@wdc.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 26 Jul 2018 13:54:45 -0700
Message-ID: <bddc1cad-5646-edf5-2253-9490717ae8e5@wdc.com>
References: <20180726145624.13a604ed@canb.auug.org.au>
 <20180726084833.GA23310@lst.de>
 <a65a6023-a527-b9c6-0d78-a175d47f55cf@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a65a6023-a527-b9c6-0d78-a175d47f55cf@kernel.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Wise <swise@opengridcomputing.com>
List-Id: linux-next.vger.kernel.org

On 07/26/18 10:48, Jens Axboe wrote:
> On 7/26/18 1:48 AM, Christoph Hellwig wrote:
>> On Thu, Jul 26, 2018 at 02:56:24PM +1000, Stephen Rothwell wrote:
>>> diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
>>> index 86121a7a19b2..8c30ac7d8078 100644
>>> --- a/drivers/nvme/target/rdma.c
>>> +++ b/drivers/nvme/target/rdma.c
>>> @@ -891,7 +891,7 @@ nvmet_rdma_find_get_device(struct rdma_cm_id *cm_id)
>>>   
>>>   	inline_page_count = num_pages(port->inline_data_size);
>>>   	inline_sge_count = max(cm_id->device->attrs.max_sge_rd,
>>> -				cm_id->device->attrs.max_sge) - 1;
>>> +				cm_id->device->attrs.max_send_sge) - 1;
>>
>> This should be max_recv_sge.
> 
> Why do we even have this conflicts to begin with?

Hello Jens,

A detailed description of why that change is necessary is available at
https://www.spinics.net/lists/linux-rdma/msg65954.html. As far as I know
the entire RDMA community supports that change.

Bart.
