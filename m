From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: build failure after merge of the xen tree
Date: Thu, 22 Jul 2010 21:48:46 -0700
Message-ID: <4C491F2E.8010606@goop.org>
References: <20100723140107.2883b2d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:50012 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751342Ab0GWEsr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jul 2010 00:48:47 -0400
In-Reply-To: <20100723140107.2883b2d3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefano Stabellini <stefano.stabellini@eu.citrix.com>

On 07/22/2010 09:01 PM, Stephen Rothwell wrote:
> Hi Jeremy,
>
> After merging the xen tree, today's linux-next build (86_64 allmodconfig)
> failed like this:
>
> arch/x86/xen/enlighten.c:71: error: __pcpu_scope_xen_vcpu causes a section type conflict
> arch/x86/xen/enlighten.c:72: error: __pcpu_scope_xen_vcpu_info causes a section type conflict
> arch/x86/xen/enlighten.c:71: error: __pcpu_unique_xen_vcpu causes a section type conflict
> arch/x86/xen/enlighten.c:72: error: __pcpu_unique_xen_vcpu_info causes a section type conflict
> arch/x86/xen/enlighten.c:558: error: __pcpu_unique_idt_desc causes a section type conflict
> arch/x86/xen/enlighten.c:760: error: __pcpu_unique_xen_cr0_value causes a section type conflict
>
> Not sure what has caused this.  I have dropped the xen tree for today.
> gcc version 4.4.4 binutils version 2.20.1.
>   


How mysterious.  I couldn't reproduce it with an allmodconfig with gcc
4.4.3  binutils 2.19.51 (Fedora 12).  I'm re-trying with Fedora 13's
toolchain, which has matching version numbers to yours.

Thanks,
    J
