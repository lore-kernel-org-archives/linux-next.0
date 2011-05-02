From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Date: Sun, 1 May 2011 22:24:18 -0400
Message-ID: <20110502022417.GA11804@redhat.com>
References: <20110502121817.645d544e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:27097 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754384Ab1EBCY3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 May 2011 22:24:29 -0400
Content-Disposition: inline
In-Reply-To: <20110502121817.645d544e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Mon, May 02, 2011 at 12:18:17PM +1000, Stephen Rothwell wrote:
 > Hi Michal,
 > 
 > After merging the kbuild tree, today's linux-next build (x86_64
 > allmodconfig) produced this warning:
 > 
 > At top level:
 > cc1: warning: unrecognized command line option "-Wno-unused-but-set-variable"
 > 
 > Presumably caused by commit af0e5d565d2f ("kbuild: Disable
 > -Wunused-but-set-variable for gcc 4.6.0") though I don't see why.  I am
 > using gcc version 4.4.5.

Which version of the patch got merged ? This should be guarded by cc-option checks.

	Dave
