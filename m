From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: creds tree build failure
Date: Fri, 17 Oct 2008 12:34:47 +0100
Message-ID: <6672.1224243287@redhat.com>
References: <alpine.LFD.2.00.0810171925220.10714@raven.themaw.net> <20081017172546.ee699528.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:59366 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752238AbYJQLe7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 07:34:59 -0400
In-Reply-To: <alpine.LFD.2.00.0810171925220.10714@raven.themaw.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ian Kent <raven@themaw.net>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Ian Kent <raven@themaw.net> wrote:

> btw, I believe that in Andrews tree a NULL has been added to dentry_open.

That should really be current_cred(), not NULL, lest SELinux fall over.

David
