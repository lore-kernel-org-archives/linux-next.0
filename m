From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: build failure after merge of the xen tree
Date: Thu, 22 Jul 2010 23:05:10 -0700
Message-ID: <4C493116.1040107@goop.org>
References: <20100723140107.2883b2d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:34272 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751300Ab0GWGFL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jul 2010 02:05:11 -0400
In-Reply-To: <20100723140107.2883b2d3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/22/2010 09:01 PM, Stephen Rothwell wrote:
> arch/x86/xen/enlighten.c:71: error: __pcpu_scope_xen_vcpu causes a section type conflict
> arch/x86/xen/enlighten.c:72: error: __pcpu_scope_xen_vcpu_info causes a section type conflict
> arch/x86/xen/enlighten.c:71: error: __pcpu_unique_xen_vcpu causes a section type conflict
> arch/x86/xen/enlighten.c:72: error: __pcpu_unique_xen_vcpu_info causes a section type conflict
> arch/x86/xen/enlighten.c:558: error: __pcpu_unique_idt_desc causes a section type conflict
> arch/x86/xen/enlighten.c:760: error: __pcpu_unique_xen_cr0_value causes a section type conflict
>
> Not sure what has caused this.  I have dropped the xen tree for today.
>
> gcc version 4.4.4 binutils version 2.20.1.
>   

I've updated upstream/xen with the patch I just posted to fix this problem.

Thanks,
    J
