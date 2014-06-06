From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-integrity
Date: Fri, 06 Jun 2014 07:43:41 -0400
Message-ID: <1402055021.5458.166.camel@dhcp-9-2-203-236.watson.ibm.com>
References: <1402026956.5458.130.camel@dhcp-9-2-203-236.watson.ibm.com>
	 <20140606142255.76bc38f1@canb.auug.org.au>
	 <1402031469.5458.162.camel@dhcp-9-2-203-236.watson.ibm.com>
	 <20140606175629.11d3b96d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20140606175629.11d3b96d@canb.auug.org.au>
Sender: linux-security-module-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Dmitry Kasatkin <d.kasatkin@samsung.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2014-06-06 at 17:56 +1000, Stephen Rothwell wrote: 
> Hi Mimi,
> 
> On Fri, 06 Jun 2014 01:11:09 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
> >
> > On Fri, 2014-06-06 at 14:22 +1000, Stephen Rothwell wrote: 
> > > 
> > > On Thu, 05 Jun 2014 23:55:56 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
> > > >
> > > > Please include
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
> > > > #next in linux-next.
> > > 
> > > OK, it would be good to know what that tree is about 
> > 
> > The linux-integrity measures, appraises and enforces local file
> > integrity, and audit logs file hashes based on policy.  The
> > linux-integrity subsystem is upstreamed and pulled into linux-next via
> > linux-security.  A suggestion was made to have the linux-integrity
> > subsystem pulled directly into linux-next.
> > 
> > > ... also it is
> > > really late for inclusion in v3.16 even - I generally do not add trees
> > > to linux-next during the merge window.  This does not mean I won't
> > > include it if you can convince me otherwise ...
> > 
> > 8 patches, mostly bugs fixes, are queued to be upstreamed
> > http://marc.info/?l=linux-security-module&m=140128032831578&w=2
> > Please add the linux-integrity subsystem at the next feasible
> > opportunity. 
> 
> Added from Tuesday.  I have just you listed as the contact in case of
> problems with the tree - let me know if anyone else should also be
> informed.

Thanks!  Yes, please add Dmitry Kasatkin (cc'ed).

Mimi

> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 


