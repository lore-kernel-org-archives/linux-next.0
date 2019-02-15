From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: mmotm 2019-02-14-15-22 uploaded (drivers/misc/fastrpc.c)
Date: Fri, 15 Feb 2019 09:29:54 +0000
Message-ID: <619bd894-5849-1eab-b12b-da76d8d52c4c@linaro.org>
References: <20190214232307.rIB08%akpm@linux-foundation.org>
 <44c1e917-bd56-cc51-8b65-0bcedfcd5f4a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <44c1e917-bd56-cc51-8b65-0bcedfcd5f4a@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
Cc: robh+dt@kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

Thanks for Reporting this Randy,
I will send a patch to fix this!

On 15/02/2019 03:20, Randy Dunlap wrote:
> On 2/14/19 3:23 PM, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2019-02-14-15-22 has been uploaded to
>>
>>     http://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> http://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
>> You will need quilt to apply these patches to the latest Linus release (5.x
>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>> http://ozlabs.org/~akpm/mmotm/series
> 
> on x86_64:
> 
> when CONFIG_DMA_SHARED_BUFFER is not set:
> 
> ld: drivers/misc/fastrpc.o: in function `fastrpc_free_map':
> fastrpc.c:(.text+0xbe): undefined reference to `dma_buf_unmap_attachment'
> ld: fastrpc.c:(.text+0xcb): undefined reference to `dma_buf_detach'
> ld: fastrpc.c:(.text+0xd4): undefined reference to `dma_buf_put'
> ld: drivers/misc/fastrpc.o: in function `fastrpc_map_create':
> fastrpc.c:(.text+0xb2b): undefined reference to `dma_buf_get'
> ld: fastrpc.c:(.text+0xb47): undefined reference to `dma_buf_attach'
> ld: fastrpc.c:(.text+0xb61): undefined reference to `dma_buf_map_attachment'
> ld: fastrpc.c:(.text+0xc36): undefined reference to `dma_buf_put'
> ld: fastrpc.c:(.text+0xc48): undefined reference to `dma_buf_detach'
> ld: drivers/misc/fastrpc.o: in function `fastrpc_device_ioctl':
> fastrpc.c:(.text+0x1756): undefined reference to `dma_buf_get'
> ld: fastrpc.c:(.text+0x1776): undefined reference to `dma_buf_put'
> ld: fastrpc.c:(.text+0x1780): undefined reference to `dma_buf_put'
> ld: fastrpc.c:(.text+0x1abf): undefined reference to `dma_buf_export'
> ld: fastrpc.c:(.text+0x1ae7): undefined reference to `dma_buf_fd'
> ld: fastrpc.c:(.text+0x1cb5): undefined reference to `dma_buf_put'
> ld: fastrpc.c:(.text+0x1cca): undefined reference to `dma_buf_put'
> 
> 
> 
--srini
