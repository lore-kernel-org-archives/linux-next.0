From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: build warning after merge of the final tree (in
 Linus' tree)
Date: Fri, 17 May 2013 15:08:59 -0400
Message-ID: <1368817739.1372.5.camel@localhost>
References: <20130515132001.6cc824ba42106db973f90991@canb.auug.org.au>
	 <1368624762.27262.1.camel@localhost>
	 <CAOh2x=nNNdgndfXCAQ7-oXDcuiNwAbNSb3_DgYuGsO8cPC__5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:31876 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756599Ab3EQTJF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 May 2013 15:09:05 -0400
In-Reply-To: <CAOh2x=nNNdgndfXCAQ7-oXDcuiNwAbNSb3_DgYuGsO8cPC__5g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Richard Guy Briggs <rgb@redhat.com>

On Fri, 2013-05-17 at 10:47 +0530, Viresh Kumar wrote:
> On Wed, May 15, 2013 at 7:02 PM, Eric Paris <eparis@redhat.com> wrote:
> > On Wed, 2013-05-15 at 13:20 +1000, Stephen Rothwell wrote:
> >> Hi ,
> >>
> >> After merging the final tree, today's linux-next build (i386 defconfig)
> >> produced this warning:
> >>
> >> kernel/auditfilter.c: In function 'audit_data_to_entry':
> >> kernel/auditfilter.c:426:3: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
> >>
> >> Introduced by commit 780a7654cee8 ("audit: Make testing for a valid
> >> loginuid explicit") from Linus' tree.
> >
> > Thank you, I'll fix it up.  What am I likely missing that I don't see it
> > on my builds?  I'm using gcc 4.8.  Is there a config option that enables
> > additional warnings?
> 
> Is  this fixed? I couldn't find a relevant patch in linux-next/master for it.

Something should be posted by the end of the day.  Sorry for the delay.
