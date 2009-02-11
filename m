From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for February 10 (security/audit/ima)
Date: Wed, 11 Feb 2009 01:29:25 +0000
Message-ID: <20090211012925.GC28946@ZenIV.linux.org.uk>
References: <20090210194121.80256b72.sfr@canb.auug.org.au> <4991DBA0.1000008@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:47687 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754629AbZBKB3b (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Feb 2009 20:29:31 -0500
Content-Disposition: inline
In-Reply-To: <4991DBA0.1000008@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>, Mimi Zohar <zohar@us.ibm.com>

On Tue, Feb 10, 2009 at 11:55:12AM -0800, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090209:
> > 
> > Dropped trees (temporarily):
> > 	audit (difficult conflicts)
> 
> 
> Maybe this is fixed by the dropped audit tree?

Everything in the public audit tree is applied, AFAICT (and for-{linus,next}
is reset to current mainline HEAD to avoid the conflicts; sorry about
that).
