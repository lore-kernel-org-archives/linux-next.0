From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: i2c tree build failure
Date: Mon, 31 Aug 2009 14:15:46 +0200
Message-ID: <20090831141546.6c52c7fb@hyperion.delvare>
References: <20090831111935.5059565b.sfr@canb.auug.org.au>
	<20090831120449.3f64aa74@hyperion.delvare>
	<20090831210335.f382d7ff.sfr@canb.auug.org.au>
	<20090831131647.3f609ad4@hyperion.delvare>
	<20090831215905.caadce2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752740AbZHaMPv@vger.kernel.org>
In-Reply-To: <20090831215905.caadce2f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

On Mon, 31 Aug 2009 21:59:05 +1000, Stephen Rothwell wrote:
> On Mon, 31 Aug 2009 13:16:47 +0200 Jean Delvare <khali@linux-fr.org> wrote:
> > I am also surprised that I would have to tell you. What is the purpose
> > of the NEXT_BASE tag if you do not check for dependencies automatically?
> 
> I use the tag to choose the base when I import the quilt series into git.
> So far I have not needed to automate the ordering of the imports.
> 
> > Anyway, if you say git can deal with duplicate patches OK, then I think
> > I'll simply re-add the patch on my end. But I do not have a strong
> > opinion on this either, so if you prefer clean dependencies and
> > ordering without duplicate patches, it is just as easy for me to leave
> > the redundant patch out and restore the NEXT_BASE tag.
> 
> I prefer less dependencies (so you could put the patch back in), however,
> that means if Greg changes the patch, then we will have two slightly
> different versions to merge.  I can cope with that as well.

I've made sure my patch has the same name as Greg's, to make it easier
for you to spot duplicates.

> Just readd the patch :-)

OK, done. Hopefully the next merge window is coming soon now anyway, and
then the trouble with this specific patch will be solved.

-- 
Jean Delvare
