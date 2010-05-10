From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging-next tree with the rr
 tree
Date: Mon, 10 May 2010 09:41:05 -0700
Message-ID: <20100510164105.GA15945@kroah.com>
References: <20100510151537.6e987af4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38015 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755695Ab0EJQyE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 May 2010 12:54:04 -0400
Content-Disposition: inline
In-Reply-To: <20100510151537.6e987af4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, John Church <j.church@ymail.com>, Larry Finger <Larry.Finger@lwfinger.net>

On Mon, May 10, 2010 at 03:15:37PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging-next tree got a conflict in
> drivers/staging/rtl8187se/r8180_core.c between commit
> db8b06bcf94dbd02fba2601bee81ac4d9a626095
> ("param:remove-useless-writable-charp") from the rr tree and commit
> 3992db8fcb2ead240f311fc3e212443c5e1c43b9 ("Staging: rtl8187se: fix coding
> style issues in r8180_core.c") from the staging-next tree.
> 
> I fixed it up (see below) and can carry the fixes as necessary.

Thanks, the fix looks great.

greg k-h
