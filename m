From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: linux-next: manual merge of the vhost tree with the iommu tree
Date: Mon, 13 May 2019 15:29:01 +0100
Message-ID: <7b10be49-f379-c586-d8fd-d67bb932fabd@arm.com>
References: <20190227152506.4696a59f@canb.auug.org.au>
 <2370af99-9dc1-b694-9f1c-1951d1e70435@arm.com>
 <20190227085546-mutt-send-email-mst@kernel.org>
 <20190228100442.GB1594@8bytes.org>
 <20190512131410-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190512131410-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lan Tianyu <Tianyu.Lan@microsoft.com>
List-Id: linux-next.vger.kernel.org

On 12/05/2019 18:16, Michael S. Tsirkin wrote:
> On Thu, Feb 28, 2019 at 11:04:42AM +0100, Joerg Roedel wrote:
>> On Wed, Feb 27, 2019 at 08:58:36AM -0500, Michael S. Tsirkin wrote:
>>> Even though it's not going into 5.1 I feel it's helpful to keep it in
>>> the vhost tree until the next cycle, it helps make sure unrelated
>>> changes don't break it.
>>
>> It is not going to 5.1, so it shouldn't be in linux-next, no? And when
>> it is going upstream, it should do so through the iommu tree. If you
>> keep it separatly in the vhost tree for testing purposes, please make
>> sure it is not included into your linux-next branch.
>>
>> Regards,
>>
>> 	Joerg
> 
> Joerg, what are we doing with these patches?
> It was tested in next with no bad effects.
> I sent an ack - do you want to pick it up?
> Or have me include it in my pull?

I'll resend the driver for v5.3 with some changes. They should be minor
but one of the changes (domain bits -> domain range) touches UAPI and
isn't backward compatible, so it would be better not to merge it this
time around.

Thanks,
Jean
