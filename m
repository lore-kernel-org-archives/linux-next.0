From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH -next v2] Shorten constant names for EFI variable
 attributes
Date: Wed, 26 Sep 2012 00:12:46 +0100
Message-ID: <20120925231246.GA30343@srcf.ucam.org>
References: <20120720220841.GA32642@hp.com>
 <5009D770.1050905@zytor.com>
 <20120723132656.GC21495@srcf.ucam.org>
 <50117E40.8090904@hp.com>
 <20120726173332.GA19851@srcf.ucam.org>
 <20120925154100.GA13412@ldl.usa.hp.com>
 <20120926075528.e497436227403ecaf1b845d3@canb.auug.org.au>
 <1348614392.17507.5.camel@concerto.americas.hpqcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42142 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751804Ab2IYXNX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 19:13:23 -0400
Content-Disposition: inline
In-Reply-To: <1348614392.17507.5.camel@concerto.americas.hpqcorp.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Khalid Aziz <khalid.aziz@hp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, hpa@zytor.com, keescook@chromium.org, tony.luck@intel.com, Greg KH <gregkh@linuxfoundation.org>, cbouatmailru@gmail.com, ccross@android.com, paul.gortmaker@windriver.com, maxin.john@gmail.com, matt.fleming@intel.com, olof@lixom.net, dhowells@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, khalid@gonehiking.org

On Tue, Sep 25, 2012 at 05:06:32PM -0600, Khalid Aziz wrote:

> This is for code cleanup and does not impact functionality. This is
> based upon an earlier discussion -
> <https://lkml.org/lkml/2012/7/13/320>. The goal is to make the code more
> readable. V1 of this patch was discussed at
> <https://lkml.org/lkml/2012/7/20/414>.

Right. Keeping the spec names makes it difficult to write code in a 
readable way.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
