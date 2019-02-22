From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: linux-next: build failure after merge of the rpmsg tree
Date: Fri, 22 Feb 2019 14:02:20 +0000
Message-ID: <e643b3be45d342adb331d5c07139b505@SFHDAG7NODE2.st.com>
References: <20190222161817.32e35462@canb.auug.org.au>
 <20190222125046.GB29125@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222125046.GB29125@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

Changes in remoteproc have been introduced to associate dedicated dma coherent memory pool to each virtio device.
It is needed when we have several virtio devices for which buffers can't be allocated from the same memory region.
Patch introduces support in both ways:
- memory region declared thanks to reserved memory and associated thanks to of_reserved_mem_device_init_by_idx(): mainly used for regions located in DDR.
- memory region specified in rproc driver itself and defined as dma coherent thanks to dma_declare_coherent_memory(): These regions are generally located in coprocessor/SoC internal memories and declared in different ways by the different rproc drivers (regs in DT, hard coded values in drivers...).

For me, dma_declare_coherent_memory based solution is there to allow a smooth transition from current rproc drivers implementations to a cleaner and unified one based on reserved memory declaration.

Regards,
Loic

> -----Original Message-----
> From: Christoph Hellwig <hch@lst.de>
> Sent: vendredi 22 février 2019 13:51
> To: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>; Christoph Hellwig
> <hch@lst.de>; Linux Next Mailing List <linux-next@vger.kernel.org>; Linux
> Kernel Mailing List <linux-kernel@vger.kernel.org>; Loic PALLARDY
> <loic.pallardy@st.com>
> Subject: Re: linux-next: build failure after merge of the rpmsg tree
> 
> FYI, can I please get an explanation for the remoteproc changes?
> 
> We really should avoid adding new callers of
> dma_declare_coherent_memory,
> which is a rather badly designed interface.
