From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Request for linux-next inclusion of the voyager tree
Date: Mon, 08 Jun 2009 11:10:23 -0500
Message-ID: <1244477423.4079.228.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:55331 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755265AbZFHQKZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Jun 2009 12:10:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Could you add this (as a postmerge tree) somewhere after the x86 trees,
please (it depends on the auto-x86-next branch).

I'll be sending the pull request for it to Linus somewhere in the next
merge window (probably towards the end) and if he takes it, linux-next
inclusion for a small number of patches it contains will probably be a
recurring feature.

The tree is at:

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/voyager-2.6.git#master

Thanks,

James
