From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: xen PV on HVM and initial domain merge in linux-next
Date: Tue, 19 Oct 2010 18:51:47 +0100
Message-ID: <alpine.DEB.2.00.1010191847290.10348@kaball-desktop>
References: <alpine.DEB.2.00.1010191254460.2423@kaball-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1010191254460.2423@kaball-desktop>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

I forgot to CC the LKML and linux-next...

On Tue, 19 Oct 2010, Stefano Stabellini wrote:
> Stephen,
> I have two patch series to merge in linux-next:
> 
> PV on HVM: receive interrupts as xen events
> xen: initial domain support
> 
> they have all the acked-by needed and are both stable since several
> weeks, however they depend on Konrad's xen-pcifront series and for this
> reason I waited until now to ask for a merge in linux-next.
> 
> Could you please pull:
> 
> git://xenbits.xen.org/people/sstabellini/linux-pvhvm.git linux-next-initial-domain-v4
> 
> it contains both series rebased on Konrad's pcifront series merged on
> linux-next (warning: it still contains the merge commit of
> xen-pcifront-0.8.2 in linux-next).
> Let me know if you have any conflicts or if you need me to change the
> branch somehow.
> 
> Many thanks in advance,
> 
> Stefano Stabellini
> 
