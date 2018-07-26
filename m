From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 26 Jul 2018 14:13:55 -0700
Message-ID: <3e162f1d-f252-0f76-8929-fa9a0f566cb2@kernel.dk>
References: <20180726145624.13a604ed@canb.auug.org.au>
 <20180726084833.GA23310@lst.de>
 <a65a6023-a527-b9c6-0d78-a175d47f55cf@kernel.dk>
 <bddc1cad-5646-edf5-2253-9490717ae8e5@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bddc1cad-5646-edf5-2253-9490717ae8e5@wdc.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bart Van Assche <bart.vanassche@wdc.com>, Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Wise <swise@opengridcomputing.com>
List-Id: linux-next.vger.kernel.org

On 7/26/18 1:54 PM, Bart Van Assche wrote:
> On 07/26/18 10:48, Jens Axboe wrote:
>> On 7/26/18 1:48 AM, Christoph Hellwig wrote:
>>> On Thu, Jul 26, 2018 at 02:56:24PM +1000, Stephen Rothwell wrote:
>>>> diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
>>>> index 86121a7a19b2..8c30ac7d8078 100644
>>>> --- a/drivers/nvme/target/rdma.c
>>>> +++ b/drivers/nvme/target/rdma.c
>>>> @@ -891,7 +891,7 @@ nvmet_rdma_find_get_device(struct rdma_cm_id *cm_id)
>>>>   
>>>>   	inline_page_count = num_pages(port->inline_data_size);
>>>>   	inline_sge_count = max(cm_id->device->attrs.max_sge_rd,
>>>> -				cm_id->device->attrs.max_sge) - 1;
>>>> +				cm_id->device->attrs.max_send_sge) - 1;
>>>
>>> This should be max_recv_sge.
>>
>> Why do we even have this conflicts to begin with?
> 
> Hello Jens,
> 
> A detailed description of why that change is necessary is available at
> https://www.spinics.net/lists/linux-rdma/msg65954.html. As far as I know
> the entire RDMA community supports that change.

Thanks - I'm not against the change, I just always get a little
suspicious when we have merge conflicts across subsystems. But this
one seems warranted.

-- 
Jens Axboe
