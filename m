From: James Hogan <james.hogan@imgtec.com>
Subject: Re: next-20130204 - bisected slab problem to "slab: Common constants
 for kmalloc boundaries"
Date: Tue, 5 Feb 2013 10:08:06 +0000
Message-ID: <5110DA06.1000804@imgtec.com>
References: <510FE051.7080107@imgtec.com> <0000013ca6a87485-3f013e82-046c-4374-86d5-67fb85a085f9-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <0000013ca6a87485-3f013e82-046c-4374-86d5-67fb85a085f9-000000@email.amazonses.com>
Sender: owner-linux-mm@kvack.org
To: Christoph Lameter <cl@linux.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Matt
 Mackall <mpm@selenic.com>, linux-mm@kvack.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-next.vger.kernel.org

On 04/02/13 19:22, Christoph Lameter wrote:
> On Mon, 4 Feb 2013, James Hogan wrote:
> 
>> I've hit boot problems in next-20130204 on Meta:
> 
> Meta is an arch that is not in the tree yet? How would I build for meta?

Yes (well, it's in -next now, so merging the for-next branch of
git://github.com/jahogan/metag-linux.git would add Meta support, which
at the point of your commit produces no conflicts).

It sounds like Stephen Warren has hit the same problem (in the
configuration I'm using ARCH_DMA_MINALIGN was also 64, but in another
configuration that worked, ARCH_DMA_MINALIGN was 8 (see
arch/metag/include/asm/cache.h).

For the record though, to cross compile, you'd need to build a
meta2_defconfig of the buildroot at
git://github.com/img-meta/metag-buildroot.git.

Cheers
James

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
