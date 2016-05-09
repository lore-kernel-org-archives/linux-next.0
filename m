From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the libata tree
Date: Mon, 9 May 2016 10:14:27 +1000
Message-ID: <20160509101427.4fd6fd36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mans Rullgard <mans@mansr.com>, Christian Lamparter <chunkeey@googlemail.com>
List-Id: linux-next.vger.kernel.org

Hi Tejun,

After merging the libata tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/ata/sata_dwc_460ex.c:203:2: error: unknown field 'm_master' specified in initializer
  .m_master = 1,
  ^
/home/sfr/next/next/drivers/ata/sata_dwc_460ex.c:204:2: error: unknown field 'p_master' specified in initializer
  .p_master = 0,
  ^
/home/sfr/next/next/drivers/ata/sata_dwc_460ex.c: In function 'sata_dwc_dma_init_old':
/home/sfr/next/next/drivers/ata/sata_dwc_460ex.c:269:9: error: too few arguments to function 'dw_dma_probe'
  return dw_dma_probe(hsdev->dma);
         ^

Caused by commit

  30ee9d52f7a7 ("ata: sata_dwc_460ex: use "dmas" DT property to find dma channel")

I have used the libata tree from next-20160506 for today.

-- 
Cheers,
Stephen Rothwell
