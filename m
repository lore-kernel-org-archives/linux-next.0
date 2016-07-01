From: Krzysztof =?UTF-8?Q?B=C5=82aszkowski?= <kb@sysmikro.com.pl>
Subject: Re: Please add the freevxfs tree to linux-next
Date: Fri, 01 Jul 2016 11:36:18 +0200
Message-ID: <1467365778.13525.28.camel@linux-q3cb.site>
References: <20160630090918.GA8701@lst.de>
	 <20160701093603.2d94cb81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20160701093603.2d94cb81@canb.auug.org.au>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen, Christoph,

On Fri, 2016-07-01 at 09:36 +1000, Stephen Rothwell wrote:
> Hi Christoph,
> 
> On Thu, 30 Jun 2016 11:09:18 +0200 Christoph Hellwig <hch@lst.de> wrote:
> >
> > the good old freevxfs driver finally got some updates again,
> > can you please add
> > 
> >     git://git.infradead.org/users/hch/freevxfs.git for-next
> > 
> > to linux-next?
> 
> Added from today.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's

I didn't say it explicitly but all changes I have made were voluntary
thus feel free to apply GPL v2 or that one which you think that fits
better.
Moreover I didn't add to original code any proprietary, confidential IP.
It seems that various web links to vxfs internals are no longer valid
nowadays. (I was not able to find any technical documentation on vxfs
design on the web)

I was lucky in that I gave blind try and it turned out that filesystem
on-disk structures defined already in the original source matched image
of HP-UX's vxfs. The important difference was on-disk endianess. I also
fixed several things which should have been fixed long time ago.
No doubt, I'm the only one who noticed them before others.

>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 

I reckon that I verified correctness of bi-endian vxfs implementation to
the extent it was possible. I own logic analyzer which is built on top
of HP mainframe and runs HP-UX 10.20 thus I was able to do backup of its
system disk and then give a try to Linux vxfs.

The tests are based on reading files and comparing cksums with these
evaluated under HP-UX. More precisely cksums of cksums sorted according
to file names are compared. So the tests utilize various directories
which differ in amount of files. E.g. "man" directory holds abt 2900
rather short files while other directories have several tenths or
hundreds of large and mid-large files.
As current Linux vxfs supports only RO no more advanced tests are
possible although I wouldn't mind to design R/W part. Unfortunately I
have no technical documentation for vxfs except current Linux vxfs code.

I can't verify if SCO Unixware works and original vxfs module was meant
for. However I put effort on making SCO Unixware and HP-UX (pa-risc
version) working both.
I believe this effort is successful because of induction.

>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 

-- 
Krzysztof Blaszkowski

