From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: Next April 24 : BUG: lock held at task exit time!
Date: Fri, 24 Apr 2009 15:04:45 +0100
Message-ID: <20090424140445.GL8633@ZenIV.linux.org.uk>
References: <20090424150456.ff35e4ea.sfr@canb.auug.org.au> <49F1626D.6080102@in.ibm.com> <20090424175509.561c96ad.sfr@canb.auug.org.au> <Pine.LNX.4.64.0904241249180.20196@blonde.anvils>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:52006 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756428AbZDXOE4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2009 10:04:56 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0904241249180.20196@blonde.anvils>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hugh Dickins <hugh@veritas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sachin Sant <sachinp@in.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, Ingo Molnar <mingo@redhat.com>, peterz@infradead.org, Oleg Nesterov <oleg@redhat.com>

On Fri, Apr 24, 2009 at 12:55:44PM +0100, Hugh Dickins wrote:

> Indeed, thanks for the headsup Stephen.  My own config gives, not
> Sachin's message (or not still visibly on screen anyway), but an
> outright panic.  Shame that leaked out into the big world, we'd
> all have preferred a quiet fixup!  Here's a patch, which I'll
> also send as reply to the relevant thread.

Applied, will fold on reorder (since Ingo is asking for what will amount
to reorder anyway).
