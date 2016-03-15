From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 09:37:54 +0100
Message-ID: <20160315083754.GA12196@lst.de>
References: <20160314153214.41d7c2fe@canb.auug.org.au> <20160314073523.GA16639@lst.de> <20160314152438.GG17923@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:45107 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753870AbcCOIh4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Mar 2016 04:37:56 -0400
Content-Disposition: inline
In-Reply-To: <20160314152438.GG17923@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 14, 2016 at 11:24:38AM -0400, Benjamin LaHaise wrote:
> On Mon, Mar 14, 2016 at 08:35:23AM +0100, Christoph Hellwig wrote:
> > The aio changes have either been reviewed negatively or not at all.  That 
> > tree should be dropped.
> 
> That isn't solely your decision.  If you have comments, please provide 
> constructive feedback, as there are users and use-cases that need this 
> kind of functionality.

Nothing should be a "sole decision".  But you have patches that stomp
all over areas outside your maintainership, and even those in there
aren't reviewed.  This does not fit the Linux-next criteria.
