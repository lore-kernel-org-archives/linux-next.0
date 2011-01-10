From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: Re: linux-next: manual merge of the hwmon-staging tree with the
 jdelvare-hwmon tree
Date: Mon, 10 Jan 2011 03:11:44 -0800
Message-ID: <20110110111144.GA29501@ericsson.com>
References: <20110110132057.bc5d54a0.sfr@canb.auug.org.au>
 <20110110034638.GA28007@ericsson.com>
 <20110110095743.7616b7b3@endymion.delvare>
 <20110110101623.GA29314@ericsson.com>
 <20110110114750.7e1849ea@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imr3.ericy.com ([198.24.6.13]:53988 "EHLO imr3.ericy.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752359Ab1AJLMA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Jan 2011 06:12:00 -0500
Content-Disposition: inline
In-Reply-To: <20110110114750.7e1849ea@endymion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Juerg Haefliger <juergh@gmail.com>

On Mon, Jan 10, 2011 at 05:47:50AM -0500, Jean Delvare wrote:
> On Mon, 10 Jan 2011 02:16:23 -0800, Guenter Roeck wrote:
> > On Mon, Jan 10, 2011 at 03:57:43AM -0500, Jean Delvare wrote:
> > > Let's be good citizens and sort out the conflict before sending the
> > > patches to Linus. I shall pick the pr_fmt change patch in my own tree.
> > > 
> > > But where do I pick it?
> > > ftp://pub.kernel.org/pub/linux/kernel/people/groeck/linux-staging/ is
> > > no longer relevant, right? Maybe you can delete it altogether to clear
> > > up the confusion. Care to point me to somewhere I can download the
> > > pr_fmt change patch?
> > > 
> > Try again; I updated it.
> > 
> > hwmon-next/0007-hwmon-dme1737-Use-pr_fmt-and-pr_-level.patch
> 
> Hmm, apparently syncing is down or slow, I don't see it yet. Will look
> again later.
> 
> > In general, I keep my git tree up to date.
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/groeck/staging.git
> > 
> > You can get it from there as well.
> > 
> > > As for sending your patches to Linus for 2.6.38, yes, please send them
> > > as soon as possible. I am still not done processing all the mails I
> > > received during my vacation, and I must send my i2c patches too, so
> > > it's better if you don't wait for me and send your patches first.
> > > 
> > Ok. Do you want me to take out the dme1737 patch ?
> 
> If you send your patches to Linus today, it doesn't actually make a
> difference. So, whatever is easier for you.
> 
Ok, let's do it that way.

Sorry for the whole trouble. The patches you applied do not follow
Documentation/CodingStyle, and I did not want to apply them without your
approval. I thought I sent you a note, but looks like that got lost in my own
vacation.

Guenter
