From: Greg KH <greg@kroah.com>
Subject: New Char/Misc tree to be added to linux-next
Date: Mon, 14 Nov 2011 16:14:19 -0800
Message-ID: <20111115001419.GA31817@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:47434 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751475Ab1KOAOZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Nov 2011 19:14:25 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 97733208F5
	for <linux-next@vger.kernel.org>; Mon, 14 Nov 2011 19:14:24 -0500 (EST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

Arnd and I are going to maintain the drivers/char/* and drivers/misc/*
directories with the goal of getting them under control, or at least a
false-sense of control :)

So could you please add my new git tree:
	git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git

which contains the two branches, "char-misc-linus" to hold patches to
send to Linus for this merge window, and "char-misc-next" to hold
patches for the next merge window.

thanks,

greg k-h
