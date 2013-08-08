From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 8 (not CONFIG_PCI_MSI conflict)
Date: Thu, 08 Aug 2013 13:03:04 -0700
Message-ID: <5203F978.2050504@infradead.org>
References: <20130808170822.82bf33d3cf5100f5e2646815@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:47671 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966063Ab3HHUEK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2013 16:04:10 -0400
In-Reply-To: <20130808170822.82bf33d3cf5100f5e2646815@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>

On 08/08/13 00:08, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130807:
> 

on i386 and x86_64:
when CONFIG_PCI_MSI is not enabled:

There are many of these errors:
include/linux/msi.h:65:6: error: expected identifier or '(' before 'void'
include/linux/msi.h:65:6: error: expected ')' before numeric constant

because arch/x86/include/asm/pci.h defines:
#define default_teardown_msi_irqs	NULL


-- 
~Randy
