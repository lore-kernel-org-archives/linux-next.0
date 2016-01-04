From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the security tree with the vfs tree
Date: Sun, 03 Jan 2016 20:37:20 -0500
Message-ID: <1451871440.2772.16.camel@linux.vnet.ibm.com>
References: <20151231152453.08cfae79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([125.16.236.4]:34041 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752497AbcADBha (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2016 20:37:30 -0500
Received: from localhost
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zohar@linux.vnet.ibm.com>;
	Mon, 4 Jan 2016 07:07:27 +0530
In-Reply-To: <20151231152453.08cfae79@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>

On Thu, 2015-12-31 at 15:24 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the security tree got a conflict in:
> 
>   security/integrity/ima/ima_fs.c
> 
> between commit:
> 
>   3bc8f29b149e ("new helper: memdup_user_nul()")
> 
> from the vfs tree and commit:
> 
>   38d859f991f3 ("IMA: policy can now be updated multiple times")
> 
> from the security tree.
> 
> I fixed it up (hopefully, see below) and can carry the fix as necessary
> (no action is required).

Hi Stephen,

FYI, I pushed out Petko's patch to linux-integrity/next earlier today.
His patch moves taking the ima_write_mutex to after the the call to
copy_from_user(), as discussed.  This obviously won't fix the conflict
with Al's patch.  How do you want to handle it?  Do I need to do
anything?

Thanks!

Mimi
