From: Vinod Koul <vkoul@kernel.org>
Subject: Re: linux-next: manual merge of the slave-dma tree with Linus' tree
Date: Tue, 26 Feb 2019 22:52:53 +0530
Message-ID: <20190226172253.GT31146@vkoul-mobl>
References: <20190226152417.29e1f3ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190226152417.29e1f3ed@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandru Ardelean <alexandru.ardelean@analog.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On 26-02-19, 15:24, Stephen Rothwell wrote:
> Hi Vinod,
> 
> Today's linux-next merge of the slave-dma tree got a conflict in:
> 
>   drivers/dma/dmatest.c
> 
> between commit:
> 
>   6454368a804c ("dmaengine: dmatest: Abort test in case of mapping error")
> 
> from Linus' tree and commit:
> 
>   361deb7243d2 ("dmaengine: dmatest: wrap src & dst data into a struct")
> 
> from the slave-dma tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the fix, this seems fine to me. Also, in this case that Linus
so let me see how to ease it :)

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/dma/dmatest.c
> index 6511928b4cdf,50221d467d86..000000000000
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@@ -708,12 -726,14 +726,12 @@@ static int dmatest_func(void *data
>   
>   			um->addr[i] = dma_map_page(dev->dev, pg, pg_off,
>   						   um->len, DMA_TO_DEVICE);
> - 			srcs[i] = um->addr[i] + src_off;
> + 			srcs[i] = um->addr[i] + src->off;
>   			ret = dma_mapping_error(dev->dev, um->addr[i]);
>   			if (ret) {
>  -				dmaengine_unmap_put(um);
>   				result("src mapping error", total_tests,
> - 				       src_off, dst_off, len, ret);
> + 				       src->off, dst->off, len, ret);
>  -				failed_tests++;
>  -				continue;
>  +				goto error_unmap_continue;
>   			}
>   			um->to_cnt++;
>   		}
> @@@ -728,9 -748,11 +746,9 @@@
>   					       DMA_BIDIRECTIONAL);
>   			ret = dma_mapping_error(dev->dev, dsts[i]);
>   			if (ret) {
>  -				dmaengine_unmap_put(um);
>   				result("dst mapping error", total_tests,
> - 				       src_off, dst_off, len, ret);
> + 				       src->off, dst->off, len, ret);
>  -				failed_tests++;
>  -				continue;
>  +				goto error_unmap_continue;
>   			}
>   			um->bidi_cnt++;
>   		}
> @@@ -758,10 -780,12 +776,10 @@@
>   		}
>   
>   		if (!tx) {
> - 			result("prep error", total_tests, src_off,
> - 			       dst_off, len, ret);
>  -			dmaengine_unmap_put(um);
> + 			result("prep error", total_tests, src->off,
> + 			       dst->off, len, ret);
>   			msleep(100);
>  -			failed_tests++;
>  -			continue;
>  +			goto error_unmap_continue;
>   		}
>   
>   		done->done = false;
> @@@ -770,10 -794,12 +788,10 @@@
>   		cookie = tx->tx_submit(tx);
>   
>   		if (dma_submit_error(cookie)) {
> - 			result("submit error", total_tests, src_off,
> - 			       dst_off, len, ret);
>  -			dmaengine_unmap_put(um);
> + 			result("submit error", total_tests, src->off,
> + 			       dst->off, len, ret);
>   			msleep(100);
>  -			failed_tests++;
>  -			continue;
>  +			goto error_unmap_continue;
>   		}
>   		dma_async_issue_pending(chan);
>   
> @@@ -782,23 -808,25 +800,23 @@@
>   
>   		status = dma_async_is_tx_complete(chan, cookie, NULL, NULL);
>   
>  -		dmaengine_unmap_put(um);
>  -
>   		if (!done->done) {
> - 			result("test timed out", total_tests, src_off, dst_off,
> + 			result("test timed out", total_tests, src->off, dst->off,
>   			       len, 0);
>  -			failed_tests++;
>  -			continue;
>  +			goto error_unmap_continue;
>   		} else if (status != DMA_COMPLETE) {
>   			result(status == DMA_ERROR ?
>   			       "completion error status" :
> - 			       "completion busy status", total_tests, src_off,
> - 			       dst_off, len, ret);
> + 			       "completion busy status", total_tests, src->off,
> + 			       dst->off, len, ret);
>  -			failed_tests++;
>  -			continue;
>  +			goto error_unmap_continue;
>   		}
>   
>  +		dmaengine_unmap_put(um);
>  +
>   		if (params->noverify) {
> - 			verbose_result("test passed", total_tests, src_off,
> - 				       dst_off, len, 0);
> + 			verbose_result("test passed", total_tests, src->off,
> + 				       dst->off, len, 0);
>   			continue;
>   		}
>   
> @@@ -833,15 -861,9 +851,15 @@@
>   			       len, error_count);
>   			failed_tests++;
>   		} else {
> - 			verbose_result("test passed", total_tests, src_off,
> - 				       dst_off, len, 0);
> + 			verbose_result("test passed", total_tests, src->off,
> + 				       dst->off, len, 0);
>   		}
>  +
>  +		continue;
>  +
>  +error_unmap_continue:
>  +		dmaengine_unmap_put(um);
>  +		failed_tests++;
>   	}
>   	ktime = ktime_sub(ktime_get(), ktime);
>   	ktime = ktime_sub(ktime, comparetime);



-- 
~Vinod
