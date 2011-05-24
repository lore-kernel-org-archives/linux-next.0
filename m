From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: error fetching the apm tree
Date: Tue, 24 May 2011 11:38:13 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1105241137560.28291@pobox.suse.cz>
References: <20110524142147.369dd3ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:37868 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753957Ab1EXJiP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 May 2011 05:38:15 -0400
In-Reply-To: <20110524142147.369dd3ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, 24 May 2011, Stephen Rothwell wrote:

> $ git fetch apm
> fatal: Couldn't find remote ref refs/heads/for-next
> 
> Looks like the apm tree lost its for-next branch

Sorry, my fault. It's fixed now.

-- 
Jiri Kosina
SUSE Labs
