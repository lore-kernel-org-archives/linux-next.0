From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Tue, 20 Jun 2017 21:17:34 +0300
Message-ID: <1497982654.22624.172.camel@linux.intel.com>
References: <20170616152136.161630bf@canb.auug.org.au>
         <20170619091942.GA2702@arm.com>
         <1497866790.22624.164.camel@linux.intel.com>
         <20170619102240.GC2702@arm.com>
         <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
         <20170620084007.GA30664@arm.com> <20170620084307.GA9703@lst.de>
         <1497948465.22624.167.camel@linux.intel.com>
         <25d08c14-eea7-8b58-675a-1124200b50a6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:12423 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750993AbdFTSTI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 14:19:08 -0400
In-Reply-To: <25d08c14-eea7-8b58-675a-1124200b50a6@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Baicar, Tyler" <tbaicar@codeaurora.org>, Christoph Hellwig <hch@lst.de>, Will Deacon <will.deacon@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, 2017-06-20 at 12:13 -0600, Baicar, Tyler wrote:
> On 6/20/2017 2:47 AM, Andy Shevchenko wrote:
> > On Tue, 2017-06-20 at 10:43 +0200, Christoph Hellwig wrote:
> > > 
> Andy,
> 
> The patch that was causing compilation failures on your branch was:
> 
> 22e31da efi: Switch to use new generic UUID API
> 
> The failures were because of the removed guid_t * casts. Note that
> this 
> patch will conflict with my patch series, so you may want to rebase
> it 
> onto linux-next once they are in.

Thanks for pointing out.
That branch is WIP, it's okay it fails to compile.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
