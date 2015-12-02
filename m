From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the  tree
Date: Wed, 2 Dec 2015 14:07:50 -0800
Message-ID: <20151202220750.GA23818@kroah.com>
References: <20151202201743.15940e7e8853122af01ddff4@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53509 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754336AbbLBWHw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 17:07:52 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 83E6820464
	for <linux-next@vger.kernel.org>; Wed,  2 Dec 2015 17:07:51 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20151202201743.15940e7e8853122af01ddff4@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 02, 2015 at 08:17:43PM +0000, Mark Brown wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/rtl8188eu/include/phy.h between Linus' tree and commit
> "staging: rtl8188eu: using unique names is good" from the staging tree.
> 
> It looks like the patch is already applied so I skipped it.

Sounds good thanks.

Note, the "Subject" here looks a bit odd :)

greg k-h
