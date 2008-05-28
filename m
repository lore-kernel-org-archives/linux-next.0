From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci merge conflict
Date: Tue, 27 May 2008 21:04:28 -0700
Message-ID: <200805272104.28178.jbarnes@virtuousgeek.org>
References: <20080528122758.70c4bec9.sfr@canb.auug.org.au> <483CC873.5000300@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-22.bluehost.com ([69.89.21.17]:57727 "HELO
	outbound-mail-22.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751021AbYE1ELQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2008 00:11:16 -0400
In-Reply-To: <483CC873.5000300@jp.fujitsu.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tuesday, May 27, 2008 7:50 pm Kenji Kaneshige wrote:
> Hi Stephen-san, Jesse-san,
>
> I have already have updated patches. I'll send them if necessary.
>
> Thanks,
> Kenji Kaneshige
>
> Stephen Rothwell wrote:
> > Hi Jesse,
> >
> > Today's linux-next mege of the pci tree got conflicts in
> > drivers/pci/hotplug/pciehp_hpc.c between commits
> > 5808639bfa98d69f77a481d759570d85f164fea0 ("pciehp: fix slow probing") and
> > 6592e02ae4bd7b277230aa0c5821588a13b9d8e3 ("pciehp: poll cmd completion if
> > hotplug interrupt is disabled") from the pci-current tree and commit
> > 2b26196717939221ccc06073780b73d0f4ee3203 ("pciehp: fix waiting
> > command").  I fixed it up as best I can, but please have a look.


