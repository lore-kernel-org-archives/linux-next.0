From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the net-next
 tree
Date: Wed, 7 Sep 2016 08:47:12 +0200
Message-ID: <20160907064712.GB31273@kroah.com>
References: <20160905165650.180e6c89@canb.auug.org.au>
 <20160905113353.GB27586@kroah.com>
 <DM2PR0301MB07835EA7440B54BE9B27A516A0F90@DM2PR0301MB0783.namprd03.prod.outlook.com>
 <DM2PR0301MB078354E908258795044BFCFEA0F90@DM2PR0301MB0783.namprd03.prod.outlook.com>
 <BLUPR0301MB209827200D789C51EC56DA41CCF90@BLUPR0301MB2098.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45251 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932263AbcIGGrG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Sep 2016 02:47:06 -0400
Content-Disposition: inline
In-Reply-To: <BLUPR0301MB209827200D789C51EC56DA41CCF90@BLUPR0301MB2098.namprd03.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Hemminger <sthemmin@microsoft.com>
Cc: KY Srinivasan <kys@microsoft.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>

On Tue, Sep 06, 2016 at 04:07:17PM +0000, Stephen Hemminger wrote:
> How about I setup a git tree (hyperv-next) to premerge these.
> 
> We are getting changes from multiple submitters through multiple trees now.

That's because there are multiple drivers in different subsystems, so
having a single git tree would have to cross multiple subsystem, making
merges a mess.

Also, I didn't want a git tree as I've still found problems with hyperv
patches in the near past, so don't quite trust that they go in without
review :(

thanks,

greg k-h
