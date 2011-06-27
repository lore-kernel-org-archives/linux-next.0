From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: Tree for June 27 (uml)
Date: Mon, 27 Jun 2011 18:30:43 +0200
Message-ID: <201106271830.43698.richard@nod.at>
References: <20110627161656.688820b9.sfr@canb.auug.org.au> <20110627082733.75e58ae4.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:53499 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752756Ab1F0Qaz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2011 12:30:55 -0400
In-Reply-To: <20110627082733.75e58ae4.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeff Dike <jdike@addtoit.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, user-mode-linux-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk

Am Montag 27 Juni 2011, 17:27:33 schrieb Randy Dunlap:
> On Mon, 27 Jun 2011 16:16:56 +1000 Stephen Rothwell wrote:
> > Hi all,
> 
> > Changes since 20110624:
> uml defconfig builds on x86 (32-bit and 64-bit) fail with:
> 
> fs/hostfs/hostfs_kern.c:756: error: 'mask' undeclared (first use in this
> function)

Hmm, "->permission() sanitizing: don't pass flags to ->permission()" is the evil doer.
Al?

Thanks,
//richard
