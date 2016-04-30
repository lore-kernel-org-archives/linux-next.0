From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Sat, 30 Apr 2016 15:52:34 +1000
Message-ID: <20160430155234.292dcb4a@canb.auug.org.au>
References: <20160429164543.039df436@canb.auug.org.au>
	<20160429133219.bhu3picl6jwxdedj@treble>
	<20160429140342.ygb477u36ajmcoax@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35669 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751357AbcD3Fwj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 30 Apr 2016 01:52:39 -0400
In-Reply-To: <20160429140342.ygb477u36ajmcoax@treble>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Quinn Tran <quinn.tran@qlogic.com>

Hi Josh,

On Fri, 29 Apr 2016 09:03:42 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Fri, Apr 29, 2016 at 08:32:19AM -0500, Josh Poimboeuf wrote:
> > On Fri, Apr 29, 2016 at 04:45:43PM +1000, Stephen Rothwell wrote:  
> > > Hi Andrew,
> > > 
> > > After merging the akpm-current tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > > 
> > > drivers/scsi/ipr.c: In function 'ipr_show_device_id':
> > > drivers/scsi/ipr.c:4462:34: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
> > >    len = snprintf(buf, PAGE_SIZE, "0x%llx\n", be64_to_cpu(res->dev_id));
> > >                                   ^
> > > 
> > > Lots and lots like this :-(
> > > 
> > > Probably introduced by commit
> > > 
> > >   eef17fb79096 ("byteswap: try to avoid __builtin_constant_p gcc bug")
> > > 
> > > I guess __builtin_bswap64() has type "unsigned long int" :-(  
> > 
> > Hm, I suppose this is cross-compiled on a powerpc host?
> > 
> > We probably need to add a (__u64) cast to the return value of
> > __builtin_bswap64(), like:
> > 
> > diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
> > index de56fd5..d737804 100644
> > --- a/include/uapi/linux/swab.h
> > +++ b/include/uapi/linux/swab.h
> > @@ -123,7 +123,7 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
> >   * @x: value to byteswap
> >   */
> >  #ifdef __HAVE_BUILTIN_BSWAP64__
> > -#define __swab64(x) __builtin_bswap64((__u64)(x))
> > +#define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
> >  #else
> >  #define __swab64(x)				\
> >  	(__builtin_constant_p((__u64)(x)) ?	\  
> 
> 
> Never mind about cross-compiling on powerpc, this has nothing to do with
> that.  But the above patch does seem to fix it.

Thanks.  I have added Andrew's tidied up version to linux-next to
replace the revert.

-- 
Cheers,
Stephen Rothwell
