From: Jeff Garzik <jgarzik@pobox.com>
Subject: Re: [PATCH 15/17] libata: update gfp/slab.h includes
Date: Mon, 29 Mar 2010 16:14:25 -0400
Message-ID: <4BB10A21.9080602@pobox.com>
References: <1269885165-18617-1-git-send-email-tj@kernel.org> <1269885165-18617-16-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:51030 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab0C2UO2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2010 16:14:28 -0400
In-Reply-To: <1269885165-18617-16-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/29/2010 01:52 PM, Tejun Heo wrote:
> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> gfp.h or slab.h is included as necessary.
>
> Signed-off-by: Tejun Heo<tj@kernel.org>
> Cc: Stephen Rothwell<sfr@canb.auug.org.au>
> Cc: Jeff Garzik<jgarzik@pobox.com>
> ---
>   drivers/ata/ahci_platform.c |    1 +
>   drivers/ata/libahci.c       |    1 +
>   2 files changed, 2 insertions(+), 0 deletions(-)

Unless you object, I'll go ahead and apply this to #upstream...
