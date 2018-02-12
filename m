From: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the nios2 tree
Date: Mon, 12 Feb 2018 10:16:07 +0800
Message-ID: <1518401767.49408.6.camel@intel.com>
References: <20180212092043.33045460@canb.auug.org.au>
         <1518398629.49408.4.camel@intel.com>
         <20180212131414.0ca70c63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:37745 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932483AbeBLCQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Feb 2018 21:16:10 -0500
In-Reply-To: <20180212131414.0ca70c63@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ley Foon Tan <lftan@altera.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 2018-02-12 at 13:14 +1100, Stephen Rothwell wrote:
> Hi Ley,
> 
> On Mon, 12 Feb 2018 09:23:49 +0800 Ley Foon Tan <ley.foon.tan@intel.c
> om> wrote:
> > 
> > 
> > On Mon, 2018-02-12 at 09:20 +1100, Stephen Rothwell wrote:
> > > 
> > > 
> > > Commits
> > > 
> > >   5d13c7317998 ("nios2: dts: Remove leading 0x and 0s from
> > > bindings
> > > notation")
> > >   e0691ebb33c1 ("nios2: defconfig: Cleanup from old Kconfig
> > > options")
> > > 
> > > are missing a Signed-off-by from their committer.
> > There are Signed-off-by in the commits.
> > 
> > Signed-off-by: Mathieu Malaterre <malat@debian.org>
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> They are the authors of the patches, but you are the committer i.e.
> you
> are on the path form the authors to Linus, so you need to add a
> Signed-off-by tag as well.  I see Linus has merged theses commits
> now,
> so there is nothing to be done for them, but in the future please add
> a
> Signed-off-by tag for anything that you commit.
> 
> See section 11 of Documentation/process/submitting-patches.rst
> --
Noted. Thanks.

Regards
Ley Foon
