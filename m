From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Date: Tue, 28 Oct 2014 07:54:09 +0100
Message-ID: <544F3D91.1070604@samsung.com>
References: <20141028152444.79bd9fe9@canb.auug.org.au>
 <20141027232910.952850f8.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20141027232910.952850f8.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

Hello,

On 2014-10-28 07:29, Andrew Morton wrote:
> On Tue, 28 Oct 2014 15:24:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Today's linux-next merge of the akpm-current tree got a conflict in
>> mm/cma.c between commit 16195ddd4ebc ("mm: cma: Ensure that
>> reservations never cross the low/high mem boundary") from the
>> dma-mapping tree and commit 2a70e5a78672 ("mm/cma: ake kmemleak ignore
>> CMA regions") from the akpm-current tree.
> hm, we have multiple trees altering mm/cma.c?
>
> I'm a bit surprised that this series was merged, given that Laurent
> said he would be sending out a v2...

v2 of Laurent's patches has been posted on 24th October
(https://lkml.org/lkml/2014/10/24/207 ), but since I didn't notice them 
to be taken
I thought that it would make sense to get them via my tree and send them 
to Linus
during the 3.18-rc cycle. If this was not appropriate, I will drop my tree.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
