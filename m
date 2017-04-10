From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 11 Apr 2017 09:55:51 +1000
Message-ID: <20170411095551.7738b6ef@canb.auug.org.au>
References: <20170410164557.4a7880b4@canb.auug.org.au>
        <20170410140606.cf357748173361bceb5b10ef@linux-foundation.org>
        <20170411073309.01cc161c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53337 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751862AbdDJXzy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 19:55:54 -0400
In-Reply-To: <20170411073309.01cc161c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huang Ying <ying.huang@intel.com>

Hi Andrew,

On Tue, 11 Apr 2017 07:33:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Mon, 10 Apr 2017 14:06:06 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > No, mm-introduce-kvalloc-helpers.patch is still in there but I had it
> > staged after
> > mm-swap-use-kvzalloc-to-allocate-some-swap-data-structure.patch.  ANd
> > after linux-next.patch which is presumably what tricked you.  
> 
> Yeah, I noticed that later.  So presumably patch
> 
>   "mm, swap: U=use kvzalloc to allocate some swap data structure"
> 
> needs to be moved to after
> 
>   mm-introduce-kvalloc-helpers.patch

I have done that in linux-next today.

-- 
Cheers,
Stephen Rothwell
