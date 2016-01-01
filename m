From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the security tree with the vfs tree
Date: Fri, 1 Jan 2016 04:34:16 +0000
Message-ID: <20160101043416.GE9938@ZenIV.linux.org.uk>
References: <20151231152453.08cfae79@canb.auug.org.au>
 <20151231043019.GD9938@ZenIV.linux.org.uk>
 <20151231104535.GA5555@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:35363 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbcAAEea (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Dec 2015 23:34:30 -0500
Content-Disposition: inline
In-Reply-To: <20151231104535.GA5555@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Petko Manolov <petkan@mip-labs.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Thu, Dec 31, 2015 at 12:45:35PM +0200, Petko Manolov wrote:

> I introduced the write mutex when ima_write_policy() stopped being serialized by 
> other means.  Come to think about it the semaphore could be taken right before 
> copy_from_user() so it is my fault, not Stephen's.

s/before/after/, surely?
