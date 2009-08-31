From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: i2c tree build failure
Date: Mon, 31 Aug 2009 13:16:47 +0200
Message-ID: <20090831131647.3f609ad4@hyperion.delvare>
References: <20090831111935.5059565b.sfr@canb.auug.org.au>
	<20090831120449.3f64aa74@hyperion.delvare>
	<20090831210335.f382d7ff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:53066 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751072AbZHaLQr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2009 07:16:47 -0400
In-Reply-To: <20090831210335.f382d7ff.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Stephen,

On Mon, 31 Aug 2009 21:03:35 +1000, Stephen Rothwell wrote:
> On Mon, 31 Aug 2009 12:04:49 +0200 Jean Delvare <khali@linux-fr.org> wrote:
> > 
> > These are caused by the fact that I moved the patch adding
> > class_compat_create_link() and friends out of the NEXT_PATCHES section.
> > I did so because Greg KH (Cc'd) added this patch to his driver-core
> > patch set, which I thought was part of linux-next. I simply didn't want
> > to apply the same patch twice.
> 
> It doesn't really matter if the same patch appears twice - git usually
> copes quite well.  Also I can tell and I (usually) don't bother
> commenting on it.
> 
> > To clarify the dependency, I added the following to my series.conf:
> > 
> > # NEXT_BASE driver-core.current
> > 
> > but apparently it didn't work as intended.
> > 
> > Greg, please clarify whether the patch in question
> > (driver-core-add-support-for-compatibility-classes.patch) is pushed to
> > linux-next or not.
> > 
> > Stephen, if my dependency tag is not correct, please tell me how to fix
> > it.
> 
> It was fine, except that Greg has that patch in the driver-core series
> (not driver-core.current).

OK, thanks for the clarification. I did not notice Greg had split some
of his trees that way. Makes sense.

> It you decide to leave that patch out and
> change the dependency, please let me know as I will then have to merge
> your tree after Greg's (it is currently earlier.

Regardless of what I do, I think it would make sense to merge
driver-core before driver subsystem trees. I would insert if before pci.

I am also surprised that I would have to tell you. What is the purpose
of the NEXT_BASE tag if you do not check for dependencies automatically?

Anyway, if you say git can deal with duplicate patches OK, then I think
I'll simply re-add the patch on my end. But I do not have a strong
opinion on this either, so if you prefer clean dependencies and
ordering without duplicate patches, it is just as easy for me to leave
the redundant patch out and restore the NEXT_BASE tag.

Thanks,
-- 
Jean Delvare
