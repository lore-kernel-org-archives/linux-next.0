From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 25 Jun 2008 22:54:39 -0700 (PDT)
Message-ID: <20080625.225439.174795604.davem@davemloft.net>
References: <20080613215601.GA8345@tuxdriver.com>
	<20080625180430.GA13730@tuxdriver.com>
	<20080626154020.b8979c6a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:53942
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753453AbYFZFyj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 01:54:39 -0400
In-Reply-To: <20080626154020.b8979c6a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linville@tuxdriver.com, linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 Jun 2008 15:40:20 +1000

> Hi John, Dave,
> 
> On Wed, 25 Jun 2008 14:04:30 -0400 "John W. Linville" <linville@tuxdriver.com> wrote:
> >
> > I just sent a pull request for Dave that will result in nasty-looking
> > conflict in iwl4965-base.c.  I have a sample merge available here:
> > 
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next-2.6 merge-test
> > 
> > The overview of the resolution is to ignore any changes in
> > iwl4965-base.c and take drivers/net/wireless/iwlwifi/iwl-scan.c from
> > the URL above.
> 
> I have done as instructed.  Thanks.

Well, I didn't pull from John's tree yet, so you shouldn't
have needed to do this :-)
