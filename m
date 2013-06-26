From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 26 (xen/x86)
Date: Wed, 26 Jun 2013 11:48:58 -0700
Message-ID: <51CB379A.7010606@infradead.org>
References: <20130626180653.57aee1721b4b5096ddc8f82d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:40454 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285Ab3FZSt0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 14:49:26 -0400
In-Reply-To: <20130626180653.57aee1721b4b5096ddc8f82d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org

On 06/26/13 01:06, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130625:
> 

CONFIG_SMP is not set
CONFIG_X86_UP_APIC is not set

on i386:

drivers/built-in.o: In function `xen_callback_vector':
(.text+0x1dc3cb): undefined reference to `first_system_vector'
drivers/built-in.o: In function `xen_callback_vector':
(.text+0x1dc3f5): undefined reference to `first_system_vector'


-- 
~Randy
