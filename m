From: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v2 1/2] drivers: dma-coherent: Fix dev->cma_area vs
 dev->dma_mem breakage
Date: Fri, 7 Jul 2017 16:40:16 +0100
Message-ID: <c9677667-e4c1-1384-04e4-e06a962feed9@arm.com>
References: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
 <1499433779-16437-1-git-send-email-vitaly_kuzmichev@mentor.com>
 <20170707142746.GB10818@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170707142746.GB10818@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Cc: gregkh@linuxfoundation.org, m.szyprowski@samsung.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "George G. Davis" <george_davis@mentor.com>
List-Id: linux-next.vger.kernel.org

Christoph,

On 07/07/17 15:27, Christoph Hellwig wrote:
> Vladimir,
> 
> this is why I really didn't like overloading the current
> dma coherent infrastructure with the global pool.
> 
> And this new patch seems like piling hacks over hacks.  I think we
> should go back and make sure allocations from the global coherent
> pool are done by the dma ops implementation, and not before calling
> into them - preferably still reusing the common code for it.
> 
> Vladimir or Vitaly - can you look into that?
> 

It is really sad that Vitaly and George did not join to discussions earlier,
so we could avoid being in situation like this.

Likely I'm missing something, but what should happen if device relies on
dma_contiguous_default_area?

Originally, intention behind dma-default was to simplify things, so instead of 

       reserved-memory {
                #address-cells = <1>;
                #size-cells = <1>;
                ranges;

                coherent_dma: linux,dma {
                        compatible = "shared-dma-pool";
                        no-map;
                        reg = <0x78000000 0x800000>;
                };
        };

  
        dev0: dev@12300000 {
                memory-region = <&coherent_dma>;
                /* ... */
        };

        dev1: dev@12500000 {
                memory-region = <&coherent_dma>;
                /* ... */
        };

        dev2: dev@12600000 {
                memory-region = <&coherent_dma>;
                /* ... */
        };

in device tree we could simply have

       reserved-memory {
                #address-cells = <1>;
                #size-cells = <1>;
                ranges;

                coherent_dma: linux,dma {
                        compatible = "shared-dma-pool";
                        no-map;
                        reg = <0x78000000 0x800000>;
                        linux,dma-default;
                };
        };

and that just work in my (NOMMU) case because there is no CMA there...

However, given that dma-default is being overloaded and there are no device
tree users merged yet, I would not object stepping back, reverting "drivers:
dma-coherent: Introduce default DMA pool" and cooperatively rethinking
design/implementation, so every party gets happy. 

The rest of my original patch set should be enough to keep NOMMU working.

Cheers
Vladimir
