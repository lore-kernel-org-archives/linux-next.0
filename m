From: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v2 1/2] drivers: dma-coherent: Fix dev->cma_area vs
 dev->dma_mem breakage
Date: Mon, 10 Jul 2017 14:42:20 +0100
Message-ID: <bda7328e-eb24-cc60-5be4-a65469f5caa2@arm.com>
References: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
 <1499433779-16437-1-git-send-email-vitaly_kuzmichev@mentor.com>
 <20170707142746.GB10818@lst.de>
 <c9677667-e4c1-1384-04e4-e06a962feed9@arm.com>
 <6f26f0d9-506a-76bf-1410-19b00162c4a1@arm.com>
 <451e9f50-3e47-1554-ae62-be5244cc1869@arm.com>
 <fb080997-5f7b-7f85-7a4a-f68f689dff55@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:35738 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932084AbdGJNmY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Jul 2017 09:42:24 -0400
In-Reply-To: <fb080997-5f7b-7f85-7a4a-f68f689dff55@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Cc: gregkh@linuxfoundation.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "George G. Davis" <george_davis@mentor.com>

On 07/07/17 18:55, Robin Murphy wrote:
> On 07/07/17 17:44, Vladimir Murzin wrote:
>> On 07/07/17 17:06, Robin Murphy wrote:
>>> On 07/07/17 16:40, Vladimir Murzin wrote:
>>>> Christoph,
>>>>
>>>> On 07/07/17 15:27, Christoph Hellwig wrote:
>>>>> Vladimir,
>>>>>
>>>>> this is why I really didn't like overloading the current
>>>>> dma coherent infrastructure with the global pool.
>>>>>
>>>>> And this new patch seems like piling hacks over hacks.  I think we
>>>>> should go back and make sure allocations from the global coherent
>>>>> pool are done by the dma ops implementation, and not before calling
>>>>> into them - preferably still reusing the common code for it.
>>>>>
>>>>> Vladimir or Vitaly - can you look into that?
>>>>>
>>>>
>>>> It is really sad that Vitaly and George did not join to discussions earlier,
>>>> so we could avoid being in situation like this.
>>>>
>>>> Likely I'm missing something, but what should happen if device relies on
>>>> dma_contiguous_default_area?
>>>>
>>>> Originally, intention behind dma-default was to simplify things, so instead of 
>>>>
>>>>        reserved-memory {
>>>>                 #address-cells = <1>;
>>>>                 #size-cells = <1>;
>>>>                 ranges;
>>>>
>>>>                 coherent_dma: linux,dma {
>>>>                         compatible = "shared-dma-pool";
>>>>                         no-map;
>>>>                         reg = <0x78000000 0x800000>;
>>>>                 };
>>>>         };
>>>>
>>>>   
>>>>         dev0: dev@12300000 {
>>>>                 memory-region = <&coherent_dma>;
>>>>                 /* ... */
>>>>         };
>>>>
>>>>         dev1: dev@12500000 {
>>>>                 memory-region = <&coherent_dma>;
>>>>                 /* ... */
>>>>         };
>>>>
>>>>         dev2: dev@12600000 {
>>>>                 memory-region = <&coherent_dma>;
>>>>                 /* ... */
>>>>         };
>>>>
>>>> in device tree we could simply have
>>>>
>>>>        reserved-memory {
>>>>                 #address-cells = <1>;
>>>>                 #size-cells = <1>;
>>>>                 ranges;
>>>>
>>>>                 coherent_dma: linux,dma {
>>>>                         compatible = "shared-dma-pool";
>>>>                         no-map;
>>>>                         reg = <0x78000000 0x800000>;
>>>>                         linux,dma-default;
>>>>                 };
>>>>         };
>>>>
>>>> and that just work in my (NOMMU) case because there is no CMA there...
>>>>
>>>> However, given that dma-default is being overloaded and there are no device
>>>> tree users merged yet, I would not object stepping back, reverting "drivers:
>>>> dma-coherent: Introduce default DMA pool" and cooperatively rethinking
>>>> design/implementation, so every party gets happy.
>>>
>>> I don't think we need to go that far, I reckon it would be clear enough
>>> to just split the per-device vs. global pool interfaces, something like
>>> I've sketched out below (such that the ops->alloc implementation calls
>>> dma_alloc_from_global_coherent() if dma_alloc_from_contiguous() fails).
>>
>> Would not we need also release and mmap variants?
> 
> Sure, that was just bashed out in 2 minutes and diffed into an email on
> the assumption that code would help illustrate the general idea I had in
> mind more clearly than prose alone. I'm certain it won't even compile
> as-is ;)

Ok. I've added missed pieces and even wire-up that with ARM NOMMU and it works
fine for me, but before I go further it'd be handy to know
 1. what does Christoph think of that idea?
 2. what is Vitaly's use case for dma-default?

Cheers
Vladimir

> 
> Robin.
> 
