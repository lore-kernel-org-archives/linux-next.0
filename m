From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of the acpi tree with Linus' tree
Date: Wed, 20 Jan 2010 01:12:08 -0500 (EST)
Message-ID: <alpine.LFD.2.00.1001200111250.4265@localhost.localdomain>
References: <20100118135624.011ee13b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173001pub.verizon.net ([206.46.173.1]:64469 "EHLO
	vms173001pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416Ab0ATGMq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2010 01:12:46 -0500
In-reply-to: <20100118135624.011ee13b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhao Yakui <yakui.zhao@intel.com>, Eric Anholt <eric@anholt.net>

Thanks Stephen,
I was carrying it because it was originally filed against ACPI,
but now that Eric has it, I can drop my version.

cheers,
Len Brown, Intel Open Source Technology Center

On Mon, 18 Jan 2010, Stephen Rothwell wrote:

> Hi Len,
> 
> Today's linux-next merge of the acpi tree got a conflict in
> drivers/gpu/drm/i915/intel_lvds.c between commit
> 40f33a92100f4d9b6e85ad642100cfe42d7ff57d ("drm/i915: Add HP
> nx9020/SamsungSX20S to ACPI LID quirk list") from Linus' tree and commit
> 25fbdd0b66c193607ed058662e06d29345766c17 ("drm/i915: Add HP
> nx9020/Samsung SX20S to ACPI LID quirk list") from the acpi tree.
> 
> Clearly two (slightly different) versions of the same change.  I used the
> version from the drm tree.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
