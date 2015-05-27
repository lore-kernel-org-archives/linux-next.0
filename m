From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Date: Wed, 27 May 2015 05:36:55 -0700
Message-ID: <20150527123655.GB16894@kroah.com>
References: <20150527155201.43e0bbb0@canb.auug.org.au>
 <5B8DA87D05A7694D9FA63FD143655C1B3C4A2662@hasmsx109.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39418 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751558AbbE0Mg5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2015 08:36:57 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CE18B20A56
	for <linux-next@vger.kernel.org>; Wed, 27 May 2015 08:36:56 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B3C4A2662@hasmsx109.ger.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 27, 2015 at 07:08:06AM +0000, Winkler, Tomas wrote:
> 
> 
> > Hi all,
> > 
> > After merging the char-misc tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> Might be the case that this one was left out ?
> https://lkml.org/lkml/2015/5/7/522 
> uuid: extract macros for assigning raw arrays

Odd, somehow I missed that one.  Can you please resend it, I don't see
it in my queue anywhere.

thanks,

greg k-h
