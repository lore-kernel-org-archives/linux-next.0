From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of the acpi tree with Linus' tree
Date: Thu, 24 Dec 2009 00:02:21 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0912240000530.6541@localhost.localdomain>
References: <20091224091141.fa1cea64.sfr@canb.auug.org.au>
 <20091224093913.4f29f37b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173013pub.verizon.net ([206.46.173.13]:64293 "EHLO
	vms173013pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbZLXFCi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Dec 2009 00:02:38 -0500
In-reply-to: <20091224093913.4f29f37b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefani Seibold <stefani@seibold.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mattia Dongili <malattia@linux.it>

Stephen,

Simpler to just drop the offending patch:

a287e9f941cf4bb8c167802c0f1cf04a93bc4e4c
sony-laptop: remove private workqueue, use keventd instead

and get a properly refreshed version of that from Dmitry/Mattia later.

thanks,
Len Brown, Intel Open Source Technology Center
