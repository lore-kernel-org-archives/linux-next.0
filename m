From: Robert Richter <rric@kernel.org>
Subject: Re: Please add my tree to linux-next
Date: Fri, 1 Nov 2013 00:44:16 +0100
Message-ID: <20131031234416.GK7429@rric.localhost>
References: <20131031193944.GJ7429@rric.localhost>
 <20131101093516.95affe68161b2761ec5edee8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:49808 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951Ab3JaXoV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 19:44:21 -0400
Received: by mail-bk0-f51.google.com with SMTP id e11so1282991bkh.10
        for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 16:44:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20131101093516.95affe68161b2761ec5edee8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On 01.11.13 09:35:16, Stephen Rothwell wrote:
> Hi Robert,
> 
> On Thu, 31 Oct 2013 20:39:44 +0100 Robert Richter <rric@kernel.org> wrote:
> >
> > please add my tree to linux-next:
> > 
> >  git://git.kernel.org/pub/scm/linux/kernel/git/rric/linux.git for-next
> > 
> > Preferable after the oprofile tree.
> > 
> > This is a more general tree with stuff not related to oprofile.
> 
> It would be good to know what you intent to put into that tree.  Since it
> is currently empty, I have not added it today - and since the merge
> window will open before I do another linux-next release (after today's),
> I will not add it until after v3.13-rc1 is released (unless you tell me
> it will contain urgent stuff like bug fixes for v3.13).

I added this tree for hosting patches unrelated to oprofile, currently
these are edac and perf patches. At the moment I am using my oprofile
tree for this. But to not confuse people I want to use a repo with a
more generic name for this purpose in future.

There should be patches in for a couple of hours already. And the
contents is the same as in oprofile/for-next that hosts the same for a
couple of days already.  Anyway, since this is more a transition from
one tree to another I can also wait.

Thanks,

-Robert
