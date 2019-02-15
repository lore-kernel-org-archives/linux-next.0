From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/2] misc: fastrpc: select CONFIG_DMA_SHARED_BUFFER
Date: Fri, 15 Feb 2019 15:14:14 -0800
Message-ID: <92483887-d10c-9ee0-3e75-192286c4a66f@infradead.org>
References: <20190215104007.27103-1-srinivas.kandagatla@linaro.org>
 <20190215104007.27103-2-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215104007.27103-2-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2/15/19 2:40 AM, Srinivas Kandagatla wrote:
> Fastrpc is a dma buf exporter as well, so select the corresponding
> DMA_SHARED_BUFFER config to fix below compilation errors on platforms
> without this config.
> 
> ld: drivers/misc/fastrpc.o: in function 'fastrpc_free_map':
> fastrpc.c:(.text+0xbe): undefined reference to 'dma_buf_unmap_attachment'
> ld: fastrpc.c:(.text+0xcb): undefined reference to 'dma_buf_detach'
> ld: fastrpc.c:(.text+0xd4): undefined reference to 'dma_buf_put'
> ld: drivers/misc/fastrpc.o: in function 'fastrpc_map_create':
> fastrpc.c:(.text+0xb2b): undefined reference to 'dma_buf_get'
> ld: fastrpc.c:(.text+0xb47): undefined reference to 'dma_buf_attach'
> ld: fastrpc.c:(.text+0xb61): undefined reference to 'dma_buf_map_attachment'
> ld: fastrpc.c:(.text+0xc36): undefined reference to 'dma_buf_put'
> ld: fastrpc.c:(.text+0xc48): undefined reference to 'dma_buf_detach'
> ld: drivers/misc/fastrpc.o: in function 'fastrpc_device_ioctl':
> fastrpc.c:(.text+0x1756): undefined reference to 'dma_buf_get'
> ld: fastrpc.c:(.text+0x1776): undefined reference to 'dma_buf_put'
> ld: fastrpc.c:(.text+0x1780): undefined reference to 'dma_buf_put'
> ld: fastrpc.c:(.text+0x1abf): undefined reference to 'dma_buf_export'
> ld: fastrpc.c:(.text+0x1ae7): undefined reference to 'dma_buf_fd'
> ld: fastrpc.c:(.text+0x1cb5): undefined reference to 'dma_buf_put'
> ld: fastrpc.c:(.text+0x1cca): undefined reference to 'dma_buf_put'
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/misc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 7e0726253755..53cd16f795d6 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -299,6 +299,7 @@ config QCOM_FASTRPC
>  	tristate "Qualcomm FastRPC"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on RPMSG
> +	select DMA_SHARED_BUFFER
>  	help
>  	  Provides a communication mechanism that allows for clients to
>  	  make remote method invocations across processor boundary to
> 


-- 
~Randy
