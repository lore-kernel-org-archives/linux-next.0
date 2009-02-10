From: Steve Wise <swise@opengridcomputing.com>
Subject: [ofa-general] Re: [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Tue, 10 Feb 2009 13:10:34 -0600
Message-ID: <4991D12A.8090309@opengridcomputing.com>
References: <20090210184448.22891.31130.stgit@dell3.ogc.int>
	<4991CFD7.30503@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <4991CFD7.30503@oracle.com>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: rdreier@cisco.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org


Randy Dunlap wrote:
> Steve Wise wrote:
>   
>> From: Steve Wise <swise@opengridcomputing.com>
>>
>> Removes the need for special u64 math on i386 systems.
>>
>> Fixes i386 build break in linux-next introduced by 
>> commit 1e27e8cee0698259ccb1fe6abeaf4b48969c0945.
>>
>> Signed-off-by: Steve Wise <swise@opengridcomputing.com>
>>     
>
> Yes, that works, thanks.  But this patch should go into 2.6.29, not
> just 2.6.30.
>
>
>   
I thought the commit that caused this was:

1e27e8cee0698259ccb1fe6abeaf4b48969c0945

And that was going in 2.6.30.  (I thought).




>> ---
>>
>>  drivers/infiniband/hw/cxgb3/iwch_qp.c |    8 ++++----
>>  1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/infiniband/hw/cxgb3/iwch_qp.c b/drivers/infiniband/hw/cxgb3/iwch_qp.c
>> index 2cf6f13..5bb299a 100644
>> --- a/drivers/infiniband/hw/cxgb3/iwch_qp.c
>> +++ b/drivers/infiniband/hw/cxgb3/iwch_qp.c
>> @@ -232,8 +232,8 @@ static int iwch_sgl2pbl_map(struct iwch_dev *rhp, struct ib_sge *sg_list,
>>  			return -EINVAL;
>>  		}
>>  		offset = sg_list[i].addr - mhp->attr.va_fbo;
>> -		offset += ((u64) mhp->attr.va_fbo) %
>> -		          (1UL << (12 + mhp->attr.page_size));
>> +		offset += mhp->attr.va_fbo &
>> +			  ((1UL << (12 + mhp->attr.page_size)) - 1);
>>  		pbl_addr[i] = ((mhp->attr.pbl_addr -
>>  			        rhp->rdev.rnic_info.pbl_base) >> 3) +
>>  			      (offset >> (12 + mhp->attr.page_size));
>> @@ -263,8 +263,8 @@ static int build_rdma_recv(struct iwch_qp *qhp, union t3_wr *wqe,
>>  		wqe->recv.sgl[i].len = cpu_to_be32(wr->sg_list[i].length);
>>  
>>  		/* to in the WQE == the offset into the page */
>> -		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
>> -				(1UL << (12 + page_size[i])));
>> +		wqe->recv.sgl[i].to = cpu_to_be64(((u64) wr->sg_list[i].addr) &
>> +				((1UL << (12 + page_size[i]))-1));
>>  
>>  		/* pbl_addr is the adapters address in the PBL */
>>  		wqe->recv.pbl_addr[i] = cpu_to_be32(pbl_addr[i]);
>>     
>
>
>   
