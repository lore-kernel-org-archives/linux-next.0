From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 1/2] drivers: dma-coherent: Fix dev->cma_area vs
        dev->dma_mem breakage
Date: Fri, 7 Jul 2017 16:27:46 +0200
Message-ID: <20170707142746.GB10818@lst.de>
References: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com> <1499433779-16437-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499433779-16437-1-git-send-email-vitaly_kuzmichev@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Cc: gregkh@linuxfoundation.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "George G. Davis" <george_davis@mentor.com>, Vladimir Murzin <vladimir.murzin@arm.com>
List-Id: linux-next.vger.kernel.org

Vladimir,

this is why I really didn't like overloading the current
dma coherent infrastructure with the global pool.

And this new patch seems like piling hacks over hacks.  I think we
should go back and make sure allocations from the global coherent
pool are done by the dma ops implementation, and not before calling
into them - preferably still reusing the common code for it.

Vladimir or Vitaly - can you look into that?
