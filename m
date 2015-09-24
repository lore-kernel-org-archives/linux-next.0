From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Sep 23
Date: Thu, 24 Sep 2015 12:50:17 +0530
Message-ID: <20150924072017.GE19202@sudip-pc>
References: <20150923142343.35797c0f@canb.auug.org.au>
 <20150923074207.GA27002@sudip-pc>
 <20150923214236.GA28778@NP-P-BURTON>
 <20150924070744.GD21784@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:35364 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752574AbbIXHUY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2015 03:20:24 -0400
Content-Disposition: inline
In-Reply-To: <20150924070744.GD21784@linux-mips.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org

On Thu, Sep 24, 2015 at 09:07:44AM +0200, Ralf Baechle wrote:
> On Wed, Sep 23, 2015 at 02:42:36PM -0700, Paul Burton wrote:
> 
> > Hi Ralf,
> > 
> > That patch as I submitted it definitely adds arch/mips/mm/sc-debugfs.c
> > but somehow that file has been lost from the commit in your
> > mips-for-linux-next tree. Could you re-apply it?
> 
> Thanks for reporting.  The patch didn't apply cleanly and when applying
> it manually I forgot to git-add the new file.  Of course the file was
> in the local repo so my test builds did succeed.  I fixed that now.
next-20150924 also failed with the same error. I guess next-20150925
should be ok.
Today's build log at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/81906839

regards
sudip
