From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the arm-soc tree
Date: Fri, 21 Apr 2017 23:31:25 +0200
Message-ID: <1721375.qoxY63CZOC@aspire.rjw.lan>
References: <20170421105405.6a690b35@canb.auug.org.au> <CAK8P3a0cVMt3y_oYH70V-ekPvUMeeBApSvybpRftSupzYy1FWQ@mail.gmail.com> <e2f9efab-291f-1436-2176-0fff3f2aae3f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:49361 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1162784AbdDUVhk (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Apr 2017 17:37:40 -0400
In-Reply-To: <e2f9efab-291f-1436-2176-0fff3f2aae3f@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon <nm@ti.com>

On Friday, April 21, 2017 02:02:35 PM santosh.shilimkar@oracle.com wrote:
> 
> On 4/21/17 2:31 AM, Arnd Bergmann wrote:
> > On Fri, Apr 21, 2017 at 8:39 AM, santosh.shilimkar@oracle.com
> > <santosh.shilimkar@oracle.com> wrote:
> >> On 4/20/17 10:53 PM, Arnd Bergmann wrote:
> >>>
> >>> On Fri, Apr 21, 2017 at 2:54 AM, Stephen Rothwell <sfr@canb.auug.org.au>
> >>> wrote:
> >>>>
> >>>> Hi all,
> >>>>
> >>>> Today's linux-next merge of the pm tree got a conflict in:
> >>>>
> >>>>   include/dt-bindings/genpd/k2g.h
> >>>>
> >>>> between commit:
> >>>>
> >>>>   7cc119f29b19 ("dt-bindings: Add TI SCI PM Domains")
> >>>>
> >>>> from the arm-soc tree and commit:
> >>>>
> >>>>   45da8edd1741 ("dt-bindings: Add TI SCI PM Domains")
> >>>>
> >>>> from the pm tree.
> >>>>
> >>>> I fixed it up (I just used the pm tree version) and can carry the fix as
> >>>> necessary. This is now fixed as far as linux-next is concerned, but any
> >>>> non trivial conflicts should be mentioned to your upstream maintainer
> >>>> when your tree is submitted for merging.  You may also want to consider
> >>>> cooperating with the maintainer of the conflicting tree to minimise any
> >>>> particularly complex conflicts.
> >>>
> >>>
> >>> Dave, Santosh,
> >>>
> >>> any idea what happened here? It seems that we picked up the wrong
> >>> version of the tree, do we need to drop this from arm-soc?
> >>>
> >> Nope. Its because this series was in my 'next' branch for a week or
> >> so and now it made it via arm-soc tree next as well.
> >>
> >> I just cleaned up my next head so it linux-next next tag should have
> >> only arm-soc copy.
> >
> > I still see two conflicting trees in linux-next as of today, neither of
> > them is your keystone tree:
> >
> In the list it was agreed that the patchset goes via arm-soc tree.

OK, I missed that when I looked at it again a couple of days ago, sorry.

I'll drop it from the pm-domains branch.

Thanks,
Rafael
