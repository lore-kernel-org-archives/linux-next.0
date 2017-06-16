From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Fri, 16 Jun 2017 08:09:01 +0200
Message-ID: <20170616060901.GA6320@lst.de>
References: <20170616152136.161630bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:41910 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750983AbdFPGJD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Jun 2017 02:09:03 -0400
Content-Disposition: inline
In-Reply-To: <20170616152136.161630bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>

The uuid-types tree in uuid.git is immutable, please work on top
of that for ACPI - in fact ACPI was on the of trees we explicitly did this
for.   So don't sneak any acpi bits in through the arm64 tree.
