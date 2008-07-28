From: Nick Andrew <nick@nick-andrew.net>
Subject: Re: linux-next: manual merge of the trivial tree
Date: Mon, 28 Jul 2008 19:41:10 +1000
Message-ID: <20080728094110.GA6278@mail.local.tull.net>
References: <20080728133707.087f1d73.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vps1.tull.net ([66.180.172.116]:45611 "HELO vps1.tull.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1750728AbYG1JlP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 05:41:15 -0400
Content-Disposition: inline
In-Reply-To: <20080728133707.087f1d73.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, linux-next@vger.kernel.org, Arthur Jones <ajones@riverbed.com>

Hi all,

On Mon, Jul 28, 2008 at 01:37:07PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the trivial tree got a conflict in
> Documentation/edac.txt between commit
> 327dafb1c61c9da7b95ac6cc7634a2340cc9509c ("edac: core fix redundant sysfs
> controls to parameters") from Linus' tree and commit
> 0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
> from the trivial tree.

Should we drop the patch or alternately split it into one patch
per affected file? This must be at least the 3rd time this patch
has conflicted with other changes.

Nick.
-- 
PGP Key ID = 0x418487E7                      http://www.nick-andrew.net/
PGP Key fingerprint = B3ED 6894 8E49 1770 C24A  67E3 6266 6EB9 4184 87E7
