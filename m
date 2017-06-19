From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Mon, 19 Jun 2017 10:19:43 +0100
Message-ID: <20170619091942.GA2702@arm.com>
References: <20170616152136.161630bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47382 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753702AbdFSJTh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jun 2017 05:19:37 -0400
Content-Disposition: inline
In-Reply-To: <20170616152136.161630bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tyler Baicar <tbaicar@codeaurora.org>

Hi Stephen, Christoph, Tyler,

On Fri, Jun 16, 2017 at 03:21:36PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the uuid tree got conflicts in:
> 
>   drivers/acpi/apei/ghes.c
>   include/uapi/linux/uuid.h
> 
> between commits:
> 
>   f4dccde3f9b9 ("ras: acpi/apei: cper: add support for generic data v3 structure")
>   476e4940c251 ("ras: acpi / apei: generate trace event for unrecognized CPER section")
>   8a0456ea3dec ("trace, ras: add ARM processor error trace event")
> 
> from the arm64 tree and commit:
> 
>   60927bc31436 ("uuid: remove uuid_be defintions from the uapi header")
>   f9727a17db9b ("uuid: rename uuid types")
>   5b53696a30d5 ("ACPI / APEI: Switch to use new generic UUID API")
> 
> from the uuid tree.
> 
> I really can't fix this up, so can you guys get together and sort this
> out, please.
> 
> For today, I have just dropped the uuid tree, sorry.

Apologies for this: I've just dropped the offending merge from the arm64
tree so you can include the uuid tree in -next again.

Tyler: please rebase your patches on top of Christoph's uuid-types branch
and send me a new series.

Will
