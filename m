From: "Keller, Jacob E" <jacob.e.keller@intel.com>
Subject: RE: linux-next: build failure after merge of the net-next tree
Date: Fri, 7 Sep 2018 15:30:42 +0000
Message-ID: <02874ECE860811409154E81DA85FBB5884C7B651@ORSMSX115.amr.corp.intel.com>
References: <20180903094702.3e32d8f5@canb.auug.org.au>
 <20180907102055.001777b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907102055.001777b8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "Bowers, AndrewX" <andrewx.bowers@intel.com>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: netdev-owner@vger.kernel.org [mailto:netdev-owner@vger.kernel.org]
> On Behalf Of Stephen Rothwell
> Sent: Thursday, September 06, 2018 5:21 PM
> To: David Miller <davem@davemloft.net>; Networking
> <netdev@vger.kernel.org>
> Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mailing
> List <linux-kernel@vger.kernel.org>; Keller, Jacob E <jacob.e.keller@intel.com>;
> Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; Bowers, AndrewX
> <andrewx.bowers@intel.com>
> Subject: Re: linux-next: build failure after merge of the net-next tree
> 
> Hi all,
> 
> On Mon, 3 Sep 2018 09:47:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au>
> wrote:
> >
> > After merging the net-next tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > In file included from drivers/net/ethernet/intel/i40e/i40e_ethtool.c:9:
> > drivers/net/ethernet/intel/i40e/i40e_ethtool.c: In function
> '__i40e_add_stat_strings':
> > drivers/net/ethernet/intel/i40e/i40e_ethtool_stats.h:193:20: error: function
> '__i40e_add_stat_strings' can never be inlined because it uses variable argument
> lists
> >  static inline void __i40e_add_stat_strings(u8 **p, const struct i40e_stats
> stats[],
> >                     ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > Caused by commit
> >
> >   8fd75c58a09a ("i40e: move ethtool stats boiler plate code to
> i40e_ethtool_stats.h")
> >
> > It is not clear this patch has any value anyway as the moved functions
> > are only used in the file they were moved from.
> >
> > I reverted that commit for today.
> >
> > The same problem would exist in drivers/net/ethernet/intel/i40evf (where
> > a lot of code is duplicated from drivers/net/ethernet/intel/i40e) except
> > that this function is not declared inline there.
> > Luckily, i40e_ethtool_stats.h is only included my one file
> > drivers/net/ethernet/intel/i40evf/i40evf_ethtool.c, otherwise there
> > would be multiple copies of __i40e_add_stat_strings().
> >
> > Surely there is some scope for factoring out some common code between
> > these two drivers?
> 
> Ping?
> 
> --
> Cheers,
> Stephen Rothwell

There's some discussion about this going on in the intel-wired-lan mailing list.

Thanks,
Jake
