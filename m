From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci merge conflict
Date: Wed, 28 May 2008 10:57:36 -0700
Message-ID: <200805281057.36379.jbarnes@virtuousgeek.org>
References: <20080528122758.70c4bec9.sfr@canb.auug.org.au> <200805272108.32974.jbarnes@virtuousgeek.org> <483CF356.1010807@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-151.bluehost.com ([67.222.39.31]:42999 "HELO
	outbound-mail-151.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752025AbYE1R5o (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2008 13:57:44 -0400
In-Reply-To: <483CF356.1010807@jp.fujitsu.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tuesday, May 27, 2008 10:53 pm Kenji Kaneshige wrote:
> Jesse Barnes wrote:
> > On Tuesday, May 27, 2008 7:50 pm Kenji Kaneshige wrote:
> >> Hi Stephen-san, Jesse-san,
> >>
> >> I have already have updated patches. I'll send them if necessary.
> >
> > Oops, meant to actually write a message. :)
> >
> > I'll merge the Linus tree into linux-next tomorrow.  Kenji-san, I'll
> > probably ask for updated patches then for anything that's in linux-next
> > but not in Linus' tree yet.
>
> Ok, just in case, I send patches related to pciehp now. I'll send the
> flowing patches followed by this e-mail.
>
> - [PATCH 1/4] Updated version of 72c4928058175e889b2f83d1a62ac6f2eb0498a0
> - [PATCH 2/4] Updated version of 4c8cc2d54b1d35cf24ede6057e05f103cfa28852
> - [PATCH 3/4] Updated version of 2b26196717939221ccc06073780b73d0f4ee3203
> - [PATCH 4/4] Updated version of 9d06d9963852e7818157994c645c640239cb5137
>
> I made these patches against 2.6.24-rc4 with recent pciehp regression fixes
> applied.

Great, thanks a lot.  I just pushed these into linux-next, please verify 
things when you get a chance.

Thanks,
Jesse
