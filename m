From: Mark Fasheh <mfasheh@suse.com>
Subject: Re: linux-next: ocfs2 tree build failure
Date: Thu, 8 Jan 2009 18:05:47 -0800
Message-ID: <20090109020547.GC17410@wotan.suse.de>
References: <20090108130158.d222ceea.sfr@canb.auug.org.au>
Reply-To: Mark Fasheh <mfasheh@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53173 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752965AbZAICFt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Jan 2009 21:05:49 -0500
Content-Disposition: inline
In-Reply-To: <20090108130158.d222ceea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Sunil Mushran <sunil.mushran@oracle.com>

On Thu, Jan 08, 2009 at 01:01:58PM +1100, Stephen Rothwell wrote:
> Hi Mark,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> fs/ocfs2/super.c: In function 'ocfs2_osb_dump':
> fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:256: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:259: error: dereferencing pointer to incomplete type
> fs/ocfs2/super.c:261: error: dereferencing pointer to incomplete type

This should be fixed now. Thanks for letting me know.
	--Mark

--
Mark Fasheh
