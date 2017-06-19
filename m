From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Mon, 19 Jun 2017 10:28:49 +1000
Message-ID: <20170619102849.6b4bb740@canb.auug.org.au>
References: <20170616152136.161630bf@canb.auug.org.au>
        <20170616060901.GA6320@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47805 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753141AbdFSA2v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Jun 2017 20:28:51 -0400
In-Reply-To: <20170616060901.GA6320@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>

Hi all,

On Fri, 16 Jun 2017 08:09:01 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> The uuid-types tree in uuid.git is immutable, please work on top
> of that for ACPI - in fact ACPI was on the of trees we explicitly did this
> for.   So don't sneak any acpi bits in through the arm64 tree.

OK, I have moved the merging of the uuid tree to very early so the
conflicts against the arm64 tree appear when I merge the arm64 tree.
For today, I have merged the arm64 tree from next-20170615 (head commit
c484f2564db1 "arm64: kconfig: allow support for memory failure
handling").

-- 
Cheers,
Stephen Rothwell
