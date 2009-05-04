From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 4 May 2009 04:55:30 +0100
Message-ID: <20090504035530.GF8633@ZenIV.linux.org.uk>
References: <20090504131303.11a57799.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:55617 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751251AbZEDDzb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 May 2009 23:55:31 -0400
Content-Disposition: inline
In-Reply-To: <20090504131303.11a57799.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ian Kent <raven@themaw.net>

On Mon, May 04, 2009 at 01:13:03PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in
> fs/autofs4/expire.c between commit
> a8985f3ac503b51c5abf8883fc4fb912e13b955c ("autofs4: fix incorrect return
> in autofs4_mount_busy()") from Linus' tree and commit
> 552b170bd50157881fc65d1a58ec73b225a2e9bf ("switch follow_down()") from
> the vfs tree.

If you want rediffed, see #untested in the same repository.
