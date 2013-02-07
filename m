From: James Hogan <james.hogan@imgtec.com>
Subject: linux-next build conflict between modules and metag trees (LOCKDEP_NOW_UNRELIABLE)
Date: Thu, 7 Feb 2013 11:16:12 +0000
Message-ID: <51138CFC.9000508@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:38718 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751261Ab3BGLQU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Feb 2013 06:16:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Rusty,

The metag architecture tree adds an add_taint(TAINT_DIE) like other
architectures do, and the modules-next tree adds the
LOCKDEP_NOW_UNRELIABLE flag to all uses of add_taint (but obviously
misses arch/metag since it doesn't exist yet), causing a compile error
on metag in -next when the two are merged together.

Is it okay for me to merge your commit 373d4d0 ("taint: add explicit
flag to show whether lock dep is still OK.") in modules-next into the
base of the metag tree and expect it not to be rebased, so that I can
then squash the fix into the metag tree?

The only commits this would include are:
$ git log --oneline linus/master..373d4d0
373d4d0 taint: add explicit flag to show whether lock dep is still OK.
64748a2 module: printk message when module signature fail taints kernel.

Thanks
James
