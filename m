From: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Subject: Re: linux-next: pci merge conflict
Date: Wed, 28 May 2008 11:50:27 +0900
Message-ID: <483CC873.5000300@jp.fujitsu.com>
References: <20080528122758.70c4bec9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:55728 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751303AbYE1CvO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2008 22:51:14 -0400
In-Reply-To: <20080528122758.70c4bec9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org

Hi Stephen-san, Jesse-san,

I have already have updated patches. I'll send them if necessary.

Thanks,
Kenji Kaneshige


Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next mege of the pci tree got conflicts in
> drivers/pci/hotplug/pciehp_hpc.c between commits
> 5808639bfa98d69f77a481d759570d85f164fea0 ("pciehp: fix slow probing") and 6592e02ae4bd7b277230aa0c5821588a13b9d8e3 ("pciehp: poll cmd completion if
> hotplug interrupt is disabled") from the pci-current tree and commit
> 2b26196717939221ccc06073780b73d0f4ee3203 ("pciehp: fix waiting
> command").  I fixed it up as best I can, but please have a look.
> 


