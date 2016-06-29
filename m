From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the powerpc tree with Linus' tree
Date: Wed, 29 Jun 2016 16:33:38 +1000
Message-ID: <1467182018.12626.1.camel@ellerman.id.au>
References: <20160629103507.52c60714@canb.auug.org.au>
	 <20160629052426.GB14508@naverao1-tp.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59269 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751020AbcF2Gds (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jun 2016 02:33:48 -0400
In-Reply-To: <20160629052426.GB14508@naverao1-tp.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thadeu Lima de Souza Cascardo <cascardo@redhat.com>

On Wed, 2016-06-29 at 10:54 +0530, Naveen N. Rao wrote:
> On 2016/06/29 10:35AM, Stephen Rothwell wrote:
> > 
> > Today's linux-next merge of the powerpc tree got a conflict in:
> > 
> >   arch/powerpc/Kconfig
> > 
> > between commit:
> > 
> >   844e3be47693 ("powerpc/bpf/jit: Disable classic BPF JIT on ppc64le")
> 
> Ah, I see that the above commit is not part of powerpc next tree, which 
> explains the conflict.
 
I'll probably merge the fixes branch into next at some point, so then it will
be sorted.

> > I fixed it up (see below - I am not sure this entirely correct) and can

That resolution is fine.

cheers
