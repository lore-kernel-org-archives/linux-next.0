From: Avi Kivity <avi@redhat.com>
Subject: Re: next-0409: kvm-ia64 build failure when !MODULES
Date: Thu, 09 Apr 2009 18:23:39 +0300
Message-ID: <49DE12FB.9030703@redhat.com>
References: <a4423d670904090605w2f26970o37b2493e9bbf2630@mail.gmail.com> <706158FABBBA044BAD4FE898A02E4BC2327A201E@pdsmsx503.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:55394 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761174AbZDIPXq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2009 11:23:46 -0400
In-Reply-To: <706158FABBBA044BAD4FE898A02E4BC2327A201E@pdsmsx503.ccr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "kvm-ia64@vger.kernel.org" <kvm-ia64@vger.kernel.org>

Zhang, Xiantao wrote:
> Hi, Avi 
>     Please apply this patch to fix the issue. 
> Xiantao
>
>
> From 053f7d5480916b693ffc89f7d4c57883467dbeff Mon Sep 17 00:00:00 2001
> From: Xiantao Zhang <xiantao.zhang@intel.com>
> Date: Thu, 9 Apr 2009 21:27:44 +0800
> Subject: [PATCH] KVM: ia64: make kvm depend on CONFIG_MODULES.
>
> Since kvm-intel modue can't be built-in, so make kvm depend on
> CONFIG_MODULES.
>   

Applied, thanks.

-- 
Do not meddle in the internals of kernels, for they are subtle and quick to panic.
