From: Francesco Fusco <ffusco@redhat.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Wed, 18 Dec 2013 16:10:16 +0100
Message-ID: <52B1BAD8.2060606@redhat.com>
References: <20131218125643.8ff140371e1f8c306327d354@canb.auug.org.au> <20131217.212145.893665929052097867.davem@davemloft.net> <20131217.213033.1019416869378407851.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41878 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754703Ab3LRPKY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Dec 2013 10:10:24 -0500
In-Reply-To: <20131217.213033.1019416869378407851.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dborkman@redhat.com, tgraf@redhat.com

On 12/18/2013 03:30 AM, David Miller wrote:
> From: David Miller <davem@davemloft.net>
> Date: Tue, 17 Dec 2013 21:21:45 -0500 (EST)
>
>> I'll try to fix this up, thanks for the report.
>
> Here's what I committed, thanks again Stephen:
>
> ====================
> [PATCH] lib: Add missing arch generic-y entries for asm-generic/hash.h
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: David S. Miller <davem@davemloft.net>

Sorry for the inconvenient. Thanks for fixing it up.

Francesco
