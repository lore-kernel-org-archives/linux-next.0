From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Sun, 17 Jul 2011 11:15:42 +0200
Message-ID: <20110717091542.GC25824@kroah.com>
References: <20110716230358.49ad03a289ee0881eb2c8821@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:52123 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754149Ab1GQJSY (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jul 2011 05:18:24 -0400
Content-Disposition: inline
In-Reply-To: <20110716230358.49ad03a289ee0881eb2c8821@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Curtis McEnroe <programble@gmail.com>, Mauro Carvalho Chehab <mchehab@redhat.com>

On Sat, Jul 16, 2011 at 11:03:58PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/tm6000/tm6000-alsa.c between commit 58d73afffaac
> ("[media] tm6000: remove a check for NO_PCM_LOCK") from the v4l-dvb tree
> and commit d684aee316ec ("tm6000: Cleaned up code style in
> tm6000-alsa.c") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

That fix looks fine, thanks for doing it.

greg k-h
