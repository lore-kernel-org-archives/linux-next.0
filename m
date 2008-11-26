From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 27 Nov 2008 10:16:35 +1100
Message-ID: <18733.55507.542008.590595@cargo.ozlabs.ibm.com>
References: <20081127013405.fcdaaed2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42538 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753014AbYKZXeR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 18:34:17 -0500
In-Reply-To: <20081127013405.fcdaaed2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Stephen Rothwell writes:

> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/built-in.o: In function `get_dma_ops':
> arch/powerpc/include/asm/dma-mapping.h:97: relocation truncated to fit: R_PPC64_REL24 against symbol `.ftrace_likely_update' defined in .text section in kernel/built-in.o

Is kernel/built-in.o getting to have more than 32MB of text perhaps?

Paul.
