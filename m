From: "Keller, Jacob E" <jacob.e.keller@intel.com>
Subject: RE: linux-next: build failure after merge of the net-next tree
Date: Fri, 7 Sep 2018 22:03:13 +0000
Message-ID: <02874ECE860811409154E81DA85FBB5884C7B9A6@ORSMSX115.amr.corp.intel.com>
References: <20180903094702.3e32d8f5@canb.auug.org.au>
        <20180907102055.001777b8@canb.auug.org.au>
        <02874ECE860811409154E81DA85FBB5884C7B651@ORSMSX115.amr.corp.intel.com>
 <20180907.103112.1943018536705670414.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907.103112.1943018536705670414.davem@davemloft.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "Bowers, AndrewX" <andrewx.bowers@intel.com>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: David Miller [mailto:davem@davemloft.net]
> Sent: Friday, September 07, 2018 10:31 AM
> To: Keller, Jacob E <jacob.e.keller@intel.com>
> Cc: sfr@canb.auug.org.au; netdev@vger.kernel.org; linux-next@vger.kernel.org;
> linux-kernel@vger.kernel.org; Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>;
> Bowers, AndrewX <andrewx.bowers@intel.com>
> Subject: Re: linux-next: build failure after merge of the net-next tree
> 
> From: "Keller, Jacob E" <jacob.e.keller@intel.com>
> Date: Fri, 7 Sep 2018 15:30:42 +0000
> 
> > There's some discussion about this going on in the intel-wired-lan
> > mailing list.
> 
> I really want to see a pull request in my inbox fixing this by the end
> of today or I'll apply a fix directly at my discretion.

Jeff is out, so I just opted to email a fix to netdev. I hope this is acceptable.

I opted to essentially revert the patch that moved code to i40e_ethtool_stats.h, rather than anything fancier, since it was fast, and correct.

There was a suggestion to only move the one offending function, but I felt that it was better to move everything back into the .c files.

Thanks,
Jake
