From: James Hogan <james.hogan@imgtec.com>
Subject: Re: next-20130204 - bisected slab problem to "slab: Common constants
 for kmalloc boundaries"
Date: Tue, 5 Feb 2013 17:08:26 +0000
Message-ID: <51113C8A.2060908@imgtec.com>
References: <510FE051.7080107@imgtec.com> <51100E79.9080101@wwwdotorg.org> <alpine.DEB.2.02.1302042019170.32396@gentwo.org> <0000013cab3780f7-5e49ef46-e41a-4ff2-88f8-46bf216d677e-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <0000013cab3780f7-5e49ef46-e41a-4ff2-88f8-46bf216d677e-000000@email.amazonses.com>
Sender: owner-linux-mm@kvack.org
To: Christoph Lameter <cl@linux.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

On 05/02/13 16:36, Christoph Lameter wrote:
> OK I was able to reproduce it by setting ARCH_DMA_MINALIGN in slab.h. This
> patch fixes it here:
> 
> 
> Subject: slab: Handle ARCH_DMA_MINALIGN correctly
> 
> A fixed KMALLOC_SHIFT_LOW does not work for arches with higher alignment
> requirements.
> 
> Determine KMALLOC_SHIFT_LOW from ARCH_DMA_MINALIGN instead.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>

Thanks, your patch fixes it for me.

Cheers
James

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
