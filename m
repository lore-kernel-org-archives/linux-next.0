From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the samsung tree with the arm-soc tree
Date: Wed, 16 Jan 2013 21:02:37 -0800
Message-ID: <0c9001cdf46f$e0a4db20$a1ee9160$@samsung.com>
References: <20130111153206.e075edb9b1e4a38d90f23ab6@canb.auug.org.au>
 <20130117145324.3f1f27fb5902b5a03135bf06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: 
Content-language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Stephen Warren' <swarren@nvidia.com>, 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, cpgs@samsung.com
List-Id: linux-next.vger.kernel.org

Kukjin Kim wrote:
> 
> Stephen Rothwell wrote:
> >
> > Hi Kukjin,
> >
> Hi,
> 
> > On Fri, 11 Jan 2013 15:32:06 +1100 Stephen Rothwell
> <sfr@canb.auug.org.au>
> > wrote:
> > >
> > > Today's linux-next merge of the samsung tree got conflicts in
> > > many files with the arm-soc tree.
> > >
> > > I just dropped the samsung tree for today.  Please have a look and try
to
> > > fix this mess up, thanks.
> >
> > Ping?
> 
> Oops, I missed above e-mail. Anyway, really?
> 
> Let me look at it soon and I will fix.
> 
> Thanks for your information.
> 
Hmm, updating timer patches in Samsung tree cause the merge conflicts with
arm-soc, so for now I dropped them in my tree just now.
And note that regarding topic branch which are including it will be
re-worked soon :-)

Now to merge Samsung tree for linux-next should be fine.

Thanks again.

- Kukjin
