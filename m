From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH v2] kvm: fix irqfd build failure discovered in linux-next
Date: Thu, 21 May 2009 16:52:06 +0300
Message-ID: <4A155C86.7010604@redhat.com>
References: <20090521172122.bb12027c.sfr@canb.auug.org.au> <20090521132817.8218.92948.stgit@dev.haskins.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:44306 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752792AbZEUNwL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2009 09:52:11 -0400
In-Reply-To: <20090521132817.8218.92948.stgit@dev.haskins.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory Haskins <ghaskins@novell.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, kvm@vger.kernel.org

Gregory Haskins wrote:
> Stephen Rothwell noted a build failure in arch != x86 in last nights
> linux-next tree, as noted here:
>
> http://lkml.org/lkml/2009/5/21/32
>
> This patch corrects the build issue by requiring explicit support for
> IRQFD to be defined, and only defining it on x86 (the only arch fully
> supported).  The code itself isnt architecture dependent, but we need
> to add a new file to each makefile, advertise the capability, and
> of course, test that it works for each supported arch.  We will submit
> patches against each relevant arch at a later time to enable support
> there as well.
>
>  
> +config HAVE_KVM_EVENTFD
> +       bool
> +       default y
> +
>   

The build system will complain if it sees a symbol used but not defined; 
so you have to define it for all four archs.  So I went ahead and did 
virt/kvm/Kconfig and adapted your patch to use it.


-- 
error compiling committee.c: too many arguments to function
