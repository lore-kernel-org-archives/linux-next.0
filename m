From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 25 Nov 2016 10:43:12 +1100
Message-ID: <20161125104312.6bc3fdaf@canb.auug.org.au>
References: <20161124160151.20206af7@canb.auug.org.au>
        <9443137.1vHEJqnA2s@morokweng>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750723AbcKXXoG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Nov 2016 18:44:06 -0500
In-Reply-To: <9443137.1vHEJqnA2s@morokweng>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>

Hi Thiago,

On Thu, 24 Nov 2016 13:02:39 -0200 Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com> wrote:
>
> Am Donnerstag, 24. November 2016, 16:01:51 BRST schrieb Stephen Rothwell:
> > Hi Andrew,
> > 
> > After merging the akpm-current tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > powerpc-linux-ld: unrecognized option '--no-dynamic-linker'
> > 
> > Caused by patch
> > 
> >   "powerpc: add purgatory for kexec_file_load implementation"
> >   
> 
> Sorry about that. --no-dynamic-linker was added in binutils 2.26.
> The patch below fixes the problem.

OK, I will apply that patch instead of disabling CONFIG_KEXEC_FILE
today.

-- 
Cheers,
Stephen Rothwell
