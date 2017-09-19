From: Tobin Harding <me@tobin.cc>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging tree
Date: Wed, 20 Sep 2017 01:50:48 +1000
Message-ID: <1505836248.392159.1111298816.4DE9BCE7@webmail.messagingengine.com>
References: <20170919075455.59a3183b@canb.auug.org.au>
 <20170919060915.GA1628@kroah.com>
 <1505835299.387461.1111276008.64AD9525@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52321 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751283AbdISPut (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Sep 2017 11:50:49 -0400
In-Reply-To: <1505835299.387461.1111276008.64AD9525@webmail.messagingengine.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


On Wed, Sep 20, 2017, at 01:34, Tobin Harding wrote:
> 
> On Tue, Sep 19, 2017, at 16:09, Greg KH wrote:
> > On Tue, Sep 19, 2017 at 07:54:55AM +1000, Stephen Rothwell wrote:
> > > Hi Greg,
> > > 
> > > Commits
> > > 
> > >   688a0206cfb8 ("staging: rtlwifi: fix parenthesis alignment")
> > >   85d309d53f7a ("staging: rtlwifi: use kcalloc instead of multiply")
> > >   f216f6cdeb1d ("staging: rtlwifi: remove unused functions")
> > > 
> > > are missing a Signed-off-by from their author.
> > 
> > Ugh, I totally missed that, Tobin, what went wrong here?
> 
> Apologies, I bet I didn't set up my environment on the laptop fully.
> Usual dev machine is a desktop, I did these patches as prep for OSS. 

I've got a strong feeling I didn't enable the driver before I 'built'
this patch series also.  Bad Tobin.

Luckily the kbot didn't punish me.
