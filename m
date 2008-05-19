From: corbet@lwn.net (Jonathan Corbet)
Subject: Re: linux-next: bkl-removal build failure
Date: Mon, 19 May 2008 11:12:45 -0600
Message-ID: <4642.1211217165@vena.lwn.net>
References: <20080519163203.89a54b82.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:37807 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756050AbYESRTs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 13:19:48 -0400
In-reply-to: Your message of "Mon, 19 May 2008 16:32:03 +1000."
             <20080519163203.89a54b82.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/char/viotape.c: In function 'viotap_open':
> /scratch/sfr/next/drivers/char/viotape.c:692: error: expected ';' before 'get_dev_info'

Well, that's embarrassing.  There are limits to what can be done with
"make allyesconfig" when you only have one architecture at hand...:)
I've put your fix into my tree, thanks and sorry for the trouble.

jon
