From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] staging/lustre/o2iblnd: remove references to
 ib_reg_phsy_mr()
Date: Tue, 18 Aug 2015 19:53:11 -0700
Message-ID: <20150819025311.GB4588@kroah.com>
References: <20150819100536.5b4d1ae6@canb.auug.org.au>
 <1439946275-1595274-1-git-send-email-green@linuxhacker.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56817 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751717AbbHSCxO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2015 22:53:14 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 23367204A8
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2015 22:53:14 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <1439946275-1595274-1-git-send-email-green@linuxhacker.ru>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: green@linuxhacker.ru
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Trond Myklebust <trond.myklebust@fys.uio.no>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Andreas Dilger <andreas.dilger@intel.com>, HPDD-discuss@ml01.01.org, Amir Shehata <amir.shehata@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

On Tue, Aug 18, 2015 at 09:04:35PM -0400, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
> 
> Removed references to ib_reg_phsy_mr() and PMR which was added
> to deal with some Chelsio specific scenario, but no longer needed
> now.
> 
> Signed-off-by: Amir Shehata <amir.shehata@intel.com>
> Signed-off-by: Oleg Drokin <oleg.drokin@intel.com>
> ---
> This fixes a build failure in Lustre due to ib_reg_phys_mr being removed.

You forgot a reported-by line :(

I'll go add it...
