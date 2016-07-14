From: David Hildenbrand <dahi@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the kvm tree with the s390 tree
Date: Thu, 14 Jul 2016 08:58:13 +0200
Message-ID: <20160714085813.71e0931c@thinkpad-w530>
References: <20160714140334.7009275f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20160714140334.7009275f@canb.auug.org.au>
Sender: kvm-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in:
> 
>   arch/s390/mm/gmap.c
> 
> between commit:
> 
>   f04540298440 ("s390/mm: fix gmap tlb flush issues")
> 
> from the s390 tree and commit:
> 
>   6ea427bbbd40 ("s390/mm: add reference counter to gmap structure")
> 
> from the kvm tree.
> 
> I fixed it up (I just assumed that the update to gmap_free is no longer
> needed) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
> 

Yes, the tlb flush will be done in gmap_remove() instead of in gmap_free(),
which is also fixed by commit f04540298440. Unfortunately, that stable fix was
inevitable and collided with the already submitted patches for nested
virtualization.

Thanks for fixing that up, looks good to me.

David

