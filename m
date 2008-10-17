From: Ian Kent <raven@themaw.net>
Subject: Re: linux-next: creds tree build failure
Date: Fri, 17 Oct 2008 19:38:50 +0800 (WST)
Message-ID: <alpine.LFD.2.00.0810171937040.11344@raven.themaw.net>
References: <alpine.LFD.2.00.0810171925220.10714@raven.themaw.net> <20081017172546.ee699528.sfr@canb.auug.org.au> <6672.1224243287@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:58959 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753174AbYJQLi5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 07:38:57 -0400
In-Reply-To: <6672.1224243287@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, 17 Oct 2008, David Howells wrote:

> Ian Kent <raven@themaw.net> wrote:
> 
> > btw, I believe that in Andrews tree a NULL has been added to dentry_open.
> 
> That should really be current_cred(), not NULL, lest SELinux fall over.

Right, I've got some updates to send to Andrew.
Would it be best for me to add this in those or would it be best for 
someone else here to do it?

Ian
