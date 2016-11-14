From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
Date: Mon, 14 Nov 2016 13:31:41 +0100
Message-ID: <20161114123141.GA14653@lst.de>
References: <20161114161624.784ab3da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161114161624.784ab3da@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 14, 2016 at 04:16:24PM +1100, Stephen Rothwell wrote:
> Hi Martin,
> 
> After merging the scsi-mkp tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/scsi/hpsa.c: In function 'hpsa_free_irqs':
> drivers/scsi/hpsa.c:8223:40: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    free_irq(pci_irq_vector(h->pdev, 0), &h->q[i]);

The i here shold be h->intr_mode, I'll send a fix in a bit.
