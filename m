From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the final tree (in
 Linus' tree)
Date: Thu, 16 May 2013 08:25:27 +1000
Message-ID: <20130515222527.GA10117@members.tip.net.au>
References: <20130515132001.6cc824ba42106db973f90991@canb.auug.org.au>
 <1368624762.27262.1.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:56928 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221Ab3EOWZc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 May 2013 18:25:32 -0400
Content-Disposition: inline
In-Reply-To: <1368624762.27262.1.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Richard Guy Briggs <rgb@redhat.com>

Hi Eric,

On Wed, May 15, 2013 at 09:32:42AM -0400, Eric Paris wrote:
> On Wed, 2013-05-15 at 13:20 +1000, Stephen Rothwell wrote:
> > 
> > After merging the final tree, today's linux-next build (i386 defconfig)
> > produced this warning:
> > 
> > kernel/auditfilter.c: In function 'audit_data_to_entry':
> > kernel/auditfilter.c:426:3: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
> > 
> > Introduced by commit 780a7654cee8 ("audit: Make testing for a valid
> > loginuid explicit") from Linus' tree.
> 
> Thank you, I'll fix it up.  What am I likely missing that I don't see it
> on my builds?  I'm using gcc 4.8.  Is there a config option that enables
> additional warnings?

I don't think so, I am still using gcc 4.6 for this build but it is a
32 bit build ...

-- 
Cheers,
Stephen Rothwell
