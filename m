From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the mips tree
Date: Tue, 15 Jul 2008 14:14:56 +0100
Message-ID: <20080715131456.GA12237@linux-mips.org>
References: <20080715230219.86638f63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ftp.linux-mips.org ([213.58.128.207]:43580 "EHLO
	ftp.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755322AbYGONXD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jul 2008 09:23:03 -0400
Received: from localhost.localdomain ([127.0.0.1]:6629 "EHLO
	ditditdahdahdah-dahdahdahditdit.dl5rb.org.uk") by ftp.linux-mips.org
	with ESMTP id S28579188AbYGONPH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jul 2008 14:15:07 +0100
Content-Disposition: inline
In-Reply-To: <20080715230219.86638f63.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>, Adrian Bunk <bunk@kernel.org>

On Tue, Jul 15, 2008 at 11:02:19PM +1000, Stephen Rothwell wrote:

> Hi Ralf,
> 
> Today's linux-next merge of the mips tree got a trivial conflict in
> drivers/mtd/maps/mtx-1_flash.c between commit
> 59018b6d2acabb114ab58637e6ab95ba424a89d0 ("MTD/JFFS2: remove CVS
> keywords") from the mtd tree and commit
> 16a21f086d79f09e3f4318b4989f854266bb41a8 ("[MIPS] MTX-1 flash partition
> setup move to platform devices registration") from the mips tree.
> 
> The former removed the CVS keywords from a file that the latter deleted.
> 
> I just removed the file.

That's fine.  I'm planning to send my grand pull request for 2.6.27 to
Linus tonight so your tomorrow's MIPS pull will be empty.

Cheers,

  Ralf
