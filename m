From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: Re: linux-next: build warning after merge of the slave-dma tree
Date: Mon, 30 Mar 2015 11:56:08 +0530
Message-ID: <0d71a355-1f27-4f9f-ad87-01a68aeaaca3@BL2FFO11OLC014.protection.gbl>
References: <20150330172053.63896266@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150330172053.63896266@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kedareswara rao Appana <appana.durga.rao@xilinx.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen Rothwell,

I will fix this and will send a patch.

Regards,
Kedar.

On 3/30/2015 11:50 AM, Stephen Rothwell wrote:
> Hi Vinod,
>
> After merging the slave-dma tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> include/linux/dmapool.h:18:4: warning: 'struct device' declared inside parameter list
>      size_t size, size_t align, size_t allocation);
>      ^
> include/linux/dmapool.h:18:4: warning: its scope is only this definition or declaration, which is probably not what you want
> include/linux/dmapool.h:31:7: warning: 'struct device' declared inside parameter list
>         size_t size, size_t align, size_t allocation);
>         ^
> drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_vdma_alloc_chan_resources':
> drivers/dma/xilinx/xilinx_vdma.c:501:20: warning: passing argument 2 of 'dma_pool_create' from incompatible pointer type
>    chan->desc_pool = dma_pool_create("xilinx_vdma_desc_pool",
>                      ^
> In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> include/linux/dmapool.h:17:18: note: expected 'struct device *' but argument is of type 'struct device *'
>   struct dma_pool *dma_pool_create(const char *name, struct device *dev,
>                    ^
>
> Presumable caused by the include order change in commit 937abe88aea3
> ("dmaengine: xilinx-dma: move header file to common location").
>
> I guess that dmapool.h needs a "struct device;" line near the top.
>



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
