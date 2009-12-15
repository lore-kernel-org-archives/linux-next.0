From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the md-current tree with Linus' tree
Date: Tue, 15 Dec 2009 10:57:20 +0100
Message-ID: <200912151057.20807.arnd@arndb.de>
References: <20091214102428.f50557a0.sfr@canb.auug.org.au> <200912141127.27019.arnd@arndb.de> <20091215140502.5edd6678@notabene.brown>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:63845 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589AbZLOJ51 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2009 04:57:27 -0500
In-Reply-To: <20091215140502.5edd6678@notabene.brown>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 15 December 2009, Neil Brown wrote:
> I had already rebased that patch on the lasted from Linus and asked him to
> pull again.
> He how seems to have done that, so md should be up-to-date in -linus,
> including the compat_ioctl stuff.
> If you would like to double check that it matches what you expect, that would
> be great.

The old ULONG_IOCTL numbers (HOT_{ADD,REMOVE}_DISK, SET_DISK_FAULTY
and SET_BITMAP_FILE) that Stephen missed are still left in fs/compat_ioctl.c,
but that is completely harmless. I'll remove them in my next batch of cleanups,
which can probably wait until 2.6.34.

Thanks for your help,

	Arnd
