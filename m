From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the memblock tree
Date: Wed, 7 Dec 2011 13:30:44 -0800
Message-ID: <CAOS58YOSp6VOJ6WCOyYf3KEJ=_p9ZG4LXmK8YiDgn4Y7DbVHKA@mail.gmail.com>
References: <20111206143808.3fa5f3785538a37c9686734d@canb.auug.org.au>
	<20111208075405.911cefd2ee3c2ed81cdc5f4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:46183 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758287Ab1LGVaq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2011 16:30:46 -0500
In-Reply-To: <20111208075405.911cefd2ee3c2ed81cdc5f4b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Wed, Dec 7, 2011 at 12:54 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Caused by commit 9d0d131f9f6d ("memblock: Kill early_node_map[]") which
>> seems to have misspelled CONFIG_HAVE_MEMBLOCK_NODE_MAP as
>> CONFIG_MEMBLOCK_HAVE_NODE_MAP in include/linux/mmzone.h.
>>
>> I have dropped the memblock tree for today - we can try again tomorrow.
>
> Ping?

Still trying to restore my cross build setup. I think I will be able
to send update series later today.

Thanks.

-- 
tejun
