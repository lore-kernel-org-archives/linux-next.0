From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (powerpc related)
Date: Wed, 28 Dec 2011 21:32:14 +1100
Message-ID: <1325068334.6632.43.camel@pasglop>
References: <20111228194949.ff20a609745e816c266f7d91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:45364 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752625Ab1L1Kci (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Dec 2011 05:32:38 -0500
In-Reply-To: <20111228194949.ff20a609745e816c266f7d91@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Thomas Gleixner <tglx@linutronix.de>

On Wed, 2011-12-28 at 19:49 +1100, Stephen Rothwell wrote:
> Hi ,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> kernel/built-in.o: In function `irq_dispose_mapping':
> (.opd+0x159f0): multiple definition of `irq_dispose_mapping'
> arch/powerpc/kernel/built-in.o:(.opd+0x960): first defined here
> kernel/built-in.o: In function `irq_create_of_mapping':
> (.opd+0x15a20): multiple definition of `irq_create_of_mapping'
> arch/powerpc/kernel/built-in.o:(.opd+0x9a8): first defined here
> kernel/built-in.o: In function `.irq_create_of_mapping':
> (.text+0x147030): multiple definition of `.irq_create_of_mapping'
> arch/powerpc/kernel/built-in.o:(.text+0x9de0): first defined here
> kernel/built-in.o: In function `.irq_dispose_mapping':
> (.text+0x146f4c): multiple definition of `.irq_dispose_mapping'
> arch/powerpc/kernel/built-in.o:(.text+0x9684): first defined here
> 
> I am not sure what caused this. And have just left it broken.

Grant, is your irq remapper misbehaving ?

Cheers,
Ben.
