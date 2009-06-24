From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 24 Jun 2009 12:54:24 +0930
Message-ID: <200906241254.24945.rusty@rustcorp.com.au>
References: <20090623161416.072b43ba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:51326 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750775AbZFXDYX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2009 23:24:23 -0400
In-Reply-To: <20090623161416.072b43ba.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Tue, 23 Jun 2009 03:44:16 pm Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (arm realview-smp_defconfig) failed like this:
>
> arch/arm/kernel/smp.c: In function 'flush_tlb_mm':
> arch/arm/kernel/smp.c:646: error: lvalue required as unary '&' operand
> arch/arm/kernel/smp.c: In function 'flush_tlb_page':
> arch/arm/kernel/smp.c:657: error: lvalue required as unary '&' operand
> arch/arm/kernel/smp.c: In function 'flush_tlb_range':
> arch/arm/kernel/smp.c:680: error: lvalue required as unary '&' operand

Dumb typo + cut & paste.

Fixed,
Rusty.
