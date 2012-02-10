From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Thu, 9 Feb 2012 16:25:22 -0800
Message-ID: <20120210002522.GA15718@quad.lixom.net>
References: <20120210105026.0075dcf9eba39eb98e7b44ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:55245 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758658Ab2BJAZZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2012 19:25:25 -0500
Content-Disposition: inline
In-Reply-To: <20120210105026.0075dcf9eba39eb98e7b44ef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

On Fri, Feb 10, 2012 at 10:50:26AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-at91/at91cap9.c between commit fa23e771d863 ("Merge branch
> 'fixes' into for-next") from the arm tree and commit 9918ceafd4a9 ("ARM:
> at91: code removal of CAP9 SoC") from the arm-soc tree.
> 
> The latter removes the file, so I did that.

Yep, that's the correct fixup.


Thanks,

-Olof
