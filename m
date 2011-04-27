From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the wireless
 tree
Date: Wed, 27 Apr 2011 11:22:23 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1104271121580.12035@pobox.suse.cz>
References: <20110427114309.38d87c9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47320 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755563Ab1D0JW3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Apr 2011 05:22:29 -0400
In-Reply-To: <20110427114309.38d87c9d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>, Chaoming_Li <chaoming_li@realsil.com.cn>, Larry Finger <Larry.Finger@lwfinger.net>, "John W. Linville" <linville@tuxdriver.com>

On Wed, 27 Apr 2011, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> drivers/net/wireless/rtlwifi/pci.c between commit c7cfe38ee0f9 ("rtlwifi:
> Convert pci routines for addition of rtl8192se and rtl8192de") from the
> wireless tree and commit 6eab04a87677 ("treewide: remove extra
> semicolons") from the trivial tree.
> 
> The former removed the code that the latter fixed.

OK, I have reverted that particular hunk.

Thanks for reporting,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
