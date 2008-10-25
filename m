From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: left over things in linux-next after 2.6.28-c1
Date: Sat, 25 Oct 2008 14:58:17 +0100
Message-ID: <20081025135817.GL28946@ZenIV.linux.org.uk>
References: <20081026005009.50dbbb33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:56067 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbYJYN6U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Oct 2008 09:58:20 -0400
Content-Disposition: inline
In-Reply-To: <20081026005009.50dbbb33.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Sun, Oct 26, 2008 at 12:50:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following is an approximate list of commits left in linux-next
> relative to 2.6.28-rc1.  Some things here may have been included in
> Linus' tree in a slightly different form.  The kvm tree is excluded from
> this list because the bits of it submitted to Linus are often different
> to what is in linux-next (my scipt says that it has ~1400 outstanding
> commits).

vfs tree in next should be empty now (for-next == for-linus, which is
merged).
