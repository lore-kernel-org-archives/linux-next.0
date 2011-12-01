From: Jiri Kosina <jkosina@suse.cz>
Subject: RE: linux-next: manual merge of the staging tree with the hid tree
Date: Thu, 1 Dec 2011 20:46:24 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1112012045540.18207@pobox.suse.cz>
References: <20111201143952.9aea929b16c7212570fc1bd2@canb.auug.org.au> <20111201035113.GA7647@kroah.com> <6E21E5352C11B742B20C142EB499E0481AA7B139@TK5EX14MBXC126.redmond.corp.microsoft.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59958 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752466Ab1LATq0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Dec 2011 14:46:26 -0500
In-Reply-To: <6E21E5352C11B742B20C142EB499E0481AA7B139@TK5EX14MBXC126.redmond.corp.microsoft.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KY Srinivasan <kys@microsoft.com>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Meyer <thomas@m3y3r.de>

On Thu, 1 Dec 2011, KY Srinivasan wrote:

> > Ok, that's fine, Jiri, want me to just delete the driver from my tree
> > now to remove any of these conflicts?
> 
> Yesterday (Nov 30th, 2011) I had sent a patch for the mouse driver to 
> fix a bug that got introduced during the recent cleanup to exit staging. 
> This patch was against the staging tree that Greg is planning to delete. 
> It is a trivial patch; can you pick this up for the hid tree. If you 
> prefer, I could rebase the patch against your tree. Let me know.

I will pick the one you have sent against staging tree, no need for you to 
respin.

Thanks,

-- 
Jiri Kosina
SUSE Labs
