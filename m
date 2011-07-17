From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the trivial
 tree
Date: Sun, 17 Jul 2011 11:16:00 +0200
Message-ID: <20110717091600.GD25824@kroah.com>
References: <20110716225343.4a0a0472fb944c9ba79f9590@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:46763 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754149Ab1GQJS3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jul 2011 05:18:29 -0400
Content-Disposition: inline
In-Reply-To: <20110716225343.4a0a0472fb944c9ba79f9590@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Jiri Kosina <jkosina@suse.cz>

On Sat, Jul 16, 2011 at 10:53:43PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/generic_serial/ser_a2232.c between commit 28f65c11f2ff
> ("treewide: Convert uses of struct resource to resource_size(ptr)") from
> the trivial tree and commit bb2a97e9ccd5 ("Staging: delete generic_serial
> drivers") from the staging tree.
> 
> The latter removes the file, so I did that.

Thank you, that is the correct fix :)
