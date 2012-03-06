From: David Howells <dhowells@redhat.com>
Subject: Re: [tip:x86/asm] bitops: Optimise get_order()
Date: Tue, 06 Mar 2012 14:24:38 +0000
Message-ID: <2506.1331043878@redhat.com>
References: <20120301113106.020c3ad0560425970c9de34e@canb.auug.org.au> <20120220223928.16199.29548.stgit@warthog.procyon.org.uk> <tip-d66acc39c7cee323733c8503b9de1821a56dff7e@git.kernel.org> <CAP=VYLr5id0TrsQFbaKOi6FoK7=_zW-Q9dwH+rAEbnmYunHvNQ@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:13671 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030718Ab2CFOZA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Mar 2012 09:25:00 -0500
In-Reply-To: <20120301113106.020c3ad0560425970c9de34e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Paul Gortmaker <paul.gortmaker@windriver.com>, mingo@redhat.com, hpa@zytor.com, linux-kernel@vger.kernel.org, arnd@arndb.de, tglx@linutronix.de, linux-tip-commits@vger.kernel.org, linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Presumably it needs to include linux/bitops.h (and see below).

That won't help.  It already includes that via linux/log2.h.

The error chain looks suspiciously like a circular dependency has occurred.

David
