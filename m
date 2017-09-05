From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pci tree with the net tree
Date: Wed, 6 Sep 2017 09:10:18 +1000
Message-ID: <20170906091018.13e37960@canb.auug.org.au>
References: <20170816095128.7205e4f1@canb.auug.org.au>
        <20170904145427.60b35b0c@canb.auug.org.au>
        <22fb2201-6ecd-bfc9-9f65-4807d7bf36a1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50575 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752471AbdIEXKV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Sep 2017 19:10:21 -0400
In-Reply-To: <22fb2201-6ecd-bfc9-9f65-4807d7bf36a1@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sinan Kaya <okaya@codeaurora.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ding Tianhong <dingtianhong@huawei.com>, Casey Leedom <leedom@chelsio.com>

Hi Sinan,

On Tue, 5 Sep 2017 18:54:38 -0400 Sinan Kaya <okaya@codeaurora.org> wrote:
>
> On 9/4/2017 12:54 AM, Stephen Rothwell wrote:
> > Just a reminder that this conflict still exists.  
> 
> I suppose this was a message for Bjorn, right?

Correct.  It was just a reminder that he may have to tell Linus about
the conflict when he asks Linus to merge his tree (depending on how
complex the conflict is and if he gets in before Dave gets the net-next
tree merged).

-- 
Cheers,
Stephen Rothwell
