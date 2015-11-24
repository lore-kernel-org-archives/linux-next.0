From: "hch@lst.de" <hch@lst.de>
Subject: Re: + arc-convert-to-dma_map_ops.patch added to -mm tree
Date: Tue, 24 Nov 2015 08:50:47 +0100
Message-ID: <20151124075047.GA29572@lst.de>
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org> <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
Sender: owner-linux-mm@kvack.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "hch@lst.de" <hch@lst.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, arcml <linux-snps-arc@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Anton Kolesov <Anton.Kolesov@synopsys.com>
List-Id: linux-next.vger.kernel.org

Hi Vineet,

the original version went through the buildbot, which succeeded.  It seems
like the official buildbot does not support arc, and might benefit from
helping to set up an arc environment.  However in the meantime Guenther
send me output from his buildbot and I sent a fix for arc.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
