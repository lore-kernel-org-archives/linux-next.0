From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for Apr 17 (kvm)
Date: Wed, 17 Apr 2013 15:55:28 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1304171555030.10112@chino.kir.corp.google.com>
References: <20130417170450.5dd6e5f450de4d5bf197d997@canb.auug.org.au> <516EE5AB.4080201@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34714 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966900Ab3DQWzb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 18:55:31 -0400
Received: by mail-pa0-f42.google.com with SMTP id kq13so1145777pab.15
        for <linux-next@vger.kernel.org>; Wed, 17 Apr 2013 15:55:31 -0700 (PDT)
In-Reply-To: <516EE5AB.4080201@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM <kvm@vger.kernel.org>

On Wed, 17 Apr 2013, Randy Dunlap wrote:

> On 04/17/13 00:04, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20130416:
> > 
> 
> 
> on i386, SMP is disabled, X86_UP_APIC is not enabled, but
> CONFIG_KVM_APIC_ARCHITECTURE=y:
> 
> arch/x86/kvm/vmx.c: In function 'vmx_deliver_posted_interrupt':
> arch/x86/kvm/vmx.c:3950:3: error: 'apic' undeclared (first use in this function)
> 

Confirmed this happens on x86_64 as well, it seems that CONFIG_SMP=n is 
the key.
