From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Thu, 18 Jun 2009 12:49:08 +0300
Message-ID: <4A3A0D94.4000803@redhat.com>
References: <20090618111120.9c226ab7.sfr@canb.auug.org.au> <1245299157.2871.1.camel@ht.satnam>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:55159 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752358AbZFRJto (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 05:49:44 -0400
In-Reply-To: <1245299157.2871.1.camel@ht.satnam>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Graf <agraf@suse.de>

On 06/18/2009 07:25 AM, Jaswinder Singh Rajput wrote:
> [PATCH] KVM: use MSR_K7_HWCR for MSRC001_0015 Hardware Configuration Register (HWCR)
>
> MSR_K8_MSR is removed as it is duplicating MSRC001_0015 Hardware
> Configuration Register (HWCR), which is already defined as MSR_K7_HWCR
>
> Fix x86_64 allmodconfig :
>
> arch/x86/kvm/svm.c: In function 'svm_set_msr':
> arch/x86/kvm/svm.c:2152: error: 'MSR_K8_HWCR' undeclared (first use in this function)
>
>    

Applied, thanks.

-- 
error compiling committee.c: too many arguments to function
