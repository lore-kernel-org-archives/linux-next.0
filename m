From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] instmem/gk20a: do not use non-portable dma_to_phys()
Date: Tue, 10 Nov 2015 22:52:03 -0800
Message-ID: <5642E593.1030102@roeck-us.net>
References: <1447132247-9767-1-git-send-email-acourbot@nvidia.com>
 <20151110144144.39c2a4109c26e91f4f3fb47b@linux-foundation.org>
 <CAAVeFuK6MCQ7+6jUemQ83Jh4XbFmERe6uofmh_Y810wcSddbkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33288 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752121AbbKKGwH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2015 01:52:07 -0500
In-Reply-To: <CAAVeFuK6MCQ7+6jUemQ83Jh4XbFmERe6uofmh_Y810wcSddbkQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 11/10/2015 10:27 PM, Alexandre Courbot wrote:
> On Wed, Nov 11, 2015 at 7:41 AM, Andrew Morton
> <akpm@linux-foundation.org> wrote:
>> On Tue, 10 Nov 2015 14:10:47 +0900 Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>>> dma_to_phys() is not guaranteed to be available on all platforms and
>>> should not be used outside of arch/. Replace it with what it is expected
>>> to do in our case: simply cast the DMA handle to a physical address.
>>
>> mainline i386 allmodconfig is now busted.
>
> How? I just managed to build it both with and without this patch (note
> that this is not to dispute the uglyness of this patch).
>

Good for you. For me, it is

ERROR: "dma_to_phys" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!

as recorded in

http://server.roeck-us.net:8010/builders/hwmon-i386-master/builds/338/steps/buildcommand/logs/stdio
http://server.roeck-us.net:8010/builders/hwmon-i386-master/builds/339/steps/buildcommand/logs/stdio

Guenter

>>
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
>>> @@ -134,13 +134,17 @@ static void __iomem *
>>>   gk20a_instobj_cpu_map_dma(struct nvkm_memory *memory)
>>>   {
>>>        struct gk20a_instobj_dma *node = gk20a_instobj_dma(memory);
>>> -     struct device *dev = node->base.imem->base.subdev.device->dev;
>>>        int npages = nvkm_memory_size(memory) >> 12;
>>>        struct page *pages[npages];
>>>        int i;
>>>
>>> -     /* phys_to_page does not exist on all platforms... */
>>> -     pages[0] = pfn_to_page(dma_to_phys(dev, node->handle) >> PAGE_SHIFT);
>>> +     /*
>>> +      * Ideally we would have a function to translate a handle to a physical
>>> +      * address, but there is no portable way of doing this. However since we
>>> +      * always use the DMA API without an IOMMU, we can assume that handles
>>> +      * are actual physical addresses.
>>> +      */
>>> +     pages[0] = pfn_to_page(((phys_addr_t)node->handle) >> PAGE_SHIFT);
>>
>> This looks ugly.
>
> It's what dma_to_phys() does. :)
>
>>
>> What's actually going on here?  Why is this driver doing something which
>> no other driver appears to need to do?
>
> So this code is actually a fallback for the case where no IOMMU is
> available. In such cases, we are using the DMA API to obtain
> contiguous memory for the GPU.
>
> Sometimes the CPU needs to touch this memory as well, and thus we need
> a memory mapping. However since this is rather occasional we do not
> want to clutter the CPU's memory space by using the permanent mapping
> that DMA API proposes - instead we allocate that memory with the
> DMA_ATTR_NO_KERNEL_MAPPING flag in order to manage the CPU mapping
> ourselves.
>
> What we want to do here is obtain the list of physical pages of the
> buffer so we can map it using vmap. However AFAIK there is no function
> that gives us the pages used by a buffer allocated using the DMA API.
> Since we know that in this case there is no IOMMU, we rely on the fact
> that that the handle points to the beginning of the physical address
> of the contiguous buffer.
>
>>
>> Is it the driver which is broken, or are the core kernel APIs inadequate?
>>
>> If the latter, what can we do to fix them up?
>>
>> IOW, how do we fix this properly?
>
> I guess a reasonable fix would be to have explicit CPU
> mapping/unmapping functions in the DMA API, instead of the current
> all-or-nothing situation (either a mapping that lasts as long as the
> buffer does, or the buffer is invisible to the CPU). This may take a
> while if it happens at all, as I suspect the current behavior must be
> driven by some limitation.
>
> For now the most urgent is to remove this use of dma_to_phys() outside
> of arch/, which was the purpose of this patch. Dave's fix does the
> trick too, but I'm concerned that it may make other people think that
> it is ok to call this function from drivers.
>
> Let's do the following instead: we drop this patch, and I will change
> that code to use the permanent mapping created by the DMA API. It is a
> fallback anyway, so it is not too much of a concern if it is not
> optimal. Besides it should be safer, as we know ARM does not like
> multiple CPU mappings.
>
> David, I will send you the proper patch ASAP, ideally later today.
>
> Apologies for breaking mainline. >_<;
>
