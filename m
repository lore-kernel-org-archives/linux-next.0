From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/2] drivers: dma-coherent: Fix dev->cma_area vs
 dev->dma_mem breakage
Date: Fri, 7 Jul 2017 17:06:52 +0100
Message-ID: <6f26f0d9-506a-76bf-1410-19b00162c4a1@arm.com>
References: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
 <1499433779-16437-1-git-send-email-vitaly_kuzmichev@mentor.com>
 <20170707142746.GB10818@lst.de>
 <c9677667-e4c1-1384-04e4-e06a962feed9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c9677667-e4c1-1384-04e4-e06a962feed9@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Murzin <vladimir.murzin@arm.com>, Christoph Hellwig <hch@lst.de>, Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Cc: gregkh@linuxfoundation.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "George G. Davis" <george_davis@mentor.com>
List-Id: linux-next.vger.kernel.org

On 07/07/17 16:40, Vladimir Murzin wrote:
> Christoph,
> 
> On 07/07/17 15:27, Christoph Hellwig wrote:
>> Vladimir,
>>
>> this is why I really didn't like overloading the current
>> dma coherent infrastructure with the global pool.
>>
>> And this new patch seems like piling hacks over hacks.  I think we
>> should go back and make sure allocations from the global coherent
>> pool are done by the dma ops implementation, and not before calling
>> into them - preferably still reusing the common code for it.
>>
>> Vladimir or Vitaly - can you look into that?
>>
> 
> It is really sad that Vitaly and George did not join to discussions earlier,
> so we could avoid being in situation like this.
> 
> Likely I'm missing something, but what should happen if device relies on
> dma_contiguous_default_area?
> 
> Originally, intention behind dma-default was to simplify things, so instead of 
> 
>        reserved-memory {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges;
> 
>                 coherent_dma: linux,dma {
>                         compatible = "shared-dma-pool";
>                         no-map;
>                         reg = <0x78000000 0x800000>;
>                 };
>         };
> 
>   
>         dev0: dev@12300000 {
>                 memory-region = <&coherent_dma>;
>                 /* ... */
>         };
> 
>         dev1: dev@12500000 {
>                 memory-region = <&coherent_dma>;
>                 /* ... */
>         };
> 
>         dev2: dev@12600000 {
>                 memory-region = <&coherent_dma>;
>                 /* ... */
>         };
> 
> in device tree we could simply have
> 
>        reserved-memory {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges;
> 
>                 coherent_dma: linux,dma {
>                         compatible = "shared-dma-pool";
>                         no-map;
>                         reg = <0x78000000 0x800000>;
>                         linux,dma-default;
>                 };
>         };
> 
> and that just work in my (NOMMU) case because there is no CMA there...
> 
> However, given that dma-default is being overloaded and there are no device
> tree users merged yet, I would not object stepping back, reverting "drivers:
> dma-coherent: Introduce default DMA pool" and cooperatively rethinking
> design/implementation, so every party gets happy.

I don't think we need to go that far, I reckon it would be clear enough
to just split the per-device vs. global pool interfaces, something like
I've sketched out below (such that the ops->alloc implementation calls
dma_alloc_from_global_coherent() if dma_alloc_from_contiguous() fails).

If anyone wants to take that and run with it, feel free.

Robin.

----->8-----
diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
index 640a7e63c453..e6393c6d8359 100644
--- a/drivers/base/dma-coherent.c
+++ b/drivers/base/dma-coherent.c
@@ -143,6 +143,44 @@ void *dma_mark_declared_memory_occupied(struct
device *dev,
 }
 EXPORT_SYMBOL(dma_mark_declared_memory_occupied);

+static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
ssize_t size,
+					dma_addr_t *dma_handle)
+{
+	int order = get_order(size);
+	unsigned long flags;
+	int pageno;
+	int dma_memory_map;
+	void *ret;
+
+	spin_lock_irqsave(&mem->spinlock, flags);
+
+	if (unlikely(size > (mem->size << PAGE_SHIFT)))
+		goto err;
+
+	pageno = bitmap_find_free_region(mem->bitmap, mem->size, order);
+	if (unlikely(pageno < 0))
+		goto err;
+
+	/*
+	 * Memory was found in the coherent area.
+	 */
+	*dma_handle = mem->device_base + (pageno << PAGE_SHIFT);
+	ret = mem->virt_base + (pageno << PAGE_SHIFT);
+	dma_memory_map = (mem->flags & DMA_MEMORY_MAP);
+	spin_unlock_irqrestore(&mem->spinlock, flags);
+	if (dma_memory_map)
+		memset(ret, 0, size);
+	else
+		memset_io(ret, 0, size);
+
+	return ret;
+
+err:
+	spin_unlock_irqrestore(&mem->spinlock, flags);
+	return NULL;
+}
+EXPORT_SYMBOL(dma_alloc_from_coherent);
+
 /**
  * dma_alloc_from_coherent() - try to allocate memory from the
per-device coherent area
  *
@@ -162,10 +200,6 @@ int dma_alloc_from_coherent(struct device *dev,
ssize_t size,
 				       dma_addr_t *dma_handle, void **ret)
 {
 	struct dma_coherent_mem *mem;
-	int order = get_order(size);
-	unsigned long flags;
-	int pageno;
-	int dma_memory_map;

 	if (!dev)
 		return 0;
@@ -173,32 +207,10 @@ int dma_alloc_from_coherent(struct device *dev,
ssize_t size,
 	if (!mem)
 		return 0;

-	*ret = NULL;
-	spin_lock_irqsave(&mem->spinlock, flags);
+	*ret = __dma_alloc_from_coherent(mem, size, dma_handle);
+	if (*ret)
+		return 1;

-	if (unlikely(size > (mem->size << PAGE_SHIFT)))
-		goto err;
-
-	pageno = bitmap_find_free_region(mem->bitmap, mem->size, order);
-	if (unlikely(pageno < 0))
-		goto err;
-
-	/*
-	 * Memory was found in the per-device area.
-	 */
-	*dma_handle = mem->device_base + (pageno << PAGE_SHIFT);
-	*ret = mem->virt_base + (pageno << PAGE_SHIFT);
-	dma_memory_map = (mem->flags & DMA_MEMORY_MAP);
-	spin_unlock_irqrestore(&mem->spinlock, flags);
-	if (dma_memory_map)
-		memset(*ret, 0, size);
-	else
-		memset_io(*ret, 0, size);
-
-	return 1;
-
-err:
-	spin_unlock_irqrestore(&mem->spinlock, flags);
 	/*
 	 * In the case where the allocation can not be satisfied from the
 	 * per-device area, try to fall back to generic memory if the
@@ -208,6 +220,15 @@ int dma_alloc_from_coherent(struct device *dev,
ssize_t size,
 }
 EXPORT_SYMBOL(dma_alloc_from_coherent);

+void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t *dma_handle)
+{
+	if (!dma_coherent_default_memory)
+		return NULL;
+
+	return __dma_alloc_from_coherent(dma_coherent_default_memory, size,
+					 handle);
+}
+
 /**
  * dma_release_from_coherent() - try to free the memory allocated from
per-device coherent memory pool
  * @dev:	device from which the memory was allocated
