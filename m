From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the jc_docs
 tree
Date: Tue, 9 Jun 2015 08:06:07 -0700
Message-ID: <20150609150607.GA17805@kroah.com>
References: <20150609212649.7517567c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55848 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751075AbbFIPGK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2015 11:06:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1561621BA3
	for <linux-next@vger.kernel.org>; Tue,  9 Jun 2015 11:06:10 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150609212649.7517567c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roberta Dobrescu <roberta.dobrescu@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Tue, Jun 09, 2015 at 09:26:49PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> tools/Makefile between commit b3fd7368f8f6 ("Move freefall program from
> Documentation/ to tools/") from the jc_docs tree and commit
> 53375103eae8 ("tools: iio: Add iio targets in tools Makefile") from the
> staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc tools/Makefile
> index b113078fb7ad,79463b00b81e..000000000000
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@@ -129,11 -113,8 +130,12 @@@ turbostat_clean x86_energy_perf_policy_
>   tmon_clean:
>   	$(call descend,thermal/tmon,clean)
>   
>  +freefall_clean:
>  +	$(call descend,laptop/freefall,clean)
>  +
>   clean: acpi_clean cgroup_clean cpupower_clean hv_clean firewire_clean lguest_clean \
>   		perf_clean selftests_clean turbostat_clean usb_clean virtio_clean \
> - 		vm_clean net_clean x86_energy_perf_policy_clean tmon_clean freefall_clean
>  -		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean
> ++		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
> ++		freefall_clean
>   
>   .PHONY: FORCE

Looks good to me, thanks.

greg k-h
