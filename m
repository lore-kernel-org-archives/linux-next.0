From: Steve Wise <swise@opengridcomputing.com>
Subject: Re: linux-next: build warning after merge of the rdma tree
Date: Mon, 14 May 2018 13:09:33 -0500
Message-ID: <2c3cedda-da0c-8a7a-e950-7d32c02af95f@opengridcomputing.com>
References: <20180507094454.4a71f8a2@canb.auug.org.au>
 <20180514180326.GM21517@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514180326.GM21517@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 5/14/2018 1:03 PM, Jason Gunthorpe wrote:
> On Mon, May 07, 2018 at 09:44:54AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the rdma tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> drivers/infiniband/hw/cxgb4/restrack.c: In function 'fill_res_qp_entry':
>> drivers/infiniband/hw/cxgb4/restrack.c:140:6: warning: 'last_rq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>   if (rdma_nl_put_driver_u32(msg, "idx", idx))
>>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/cxgb4/restrack.c:180:20: note: 'last_rq_idx' was declared here
>>   u16 first_rq_idx, last_rq_idx;
>>                     ^~~~~~~~~~~
>> drivers/infiniband/hw/cxgb4/restrack.c:140:6: warning: 'first_rq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>   if (rdma_nl_put_driver_u32(msg, "idx", idx))
>>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/cxgb4/restrack.c:180:6: note: 'first_rq_idx' was declared here
>>   u16 first_rq_idx, last_rq_idx;
>>       ^~~~~~~~~~~~
>> drivers/infiniband/hw/cxgb4/restrack.c:228:6: warning: 'last_sq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>   if (fill_swsqes(msg, &wq.sq, first_sq_idx, fsp, last_sq_idx, lsp))
>>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/cxgb4/restrack.c:228:6: warning: 'first_sq_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>
>> Introduced by commit
>>
>>   056f9c7f39bf ("iw_cxgb4: dump detailed driver-specific QP information")
>>
> SteveW, is there a patch to fix this that I'm missing?
>
> Thanks,
> Jason

Hey Jason, 

I'll send you one shortly. 

Steve.
