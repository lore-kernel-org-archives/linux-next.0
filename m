From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the rr tree
Date: Thu, 30 Jul 2009 08:23:09 +0200
Message-ID: <20090730062309.GA15057@liondog.tnic>
References: <20090730154150.d4c326b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:37108 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550AbZG3GXO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2009 02:23:14 -0400
Content-Disposition: inline
In-Reply-To: <20090730154150.d4c326b5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Andreas Herrmann <andreas.herrmann3@amd.com>

On Thu, Jul 30, 2009 at 03:41:50PM +1000, Stephen Rothwell wrote:
> Hi Borislav,
> 
> Today's linux-next merge of the edac-amd tree got a conflict in
> include/linux/topology.h between commit
> 11c0109a8c24b27fd6eff8c2c0ddca598675212d
> ("cpumask:remove-topology_core_siblings-and-topology_thread_siblings-core")
> from the rr tree and commit 86aebc88b40884510c914ad71e81c8536a15052e
> ("topology: introduce cpu_node information for multi-node processors")
> from the edac-amd tree.
> 
> The latter adds topology_cpu_node_siblings() which is not needed (the
> former makes it clear that the _cpumask versions of these should be used
> instead).  I fixed it up and can carry the fix as necessary.

Hi Stephen,

thanks for fixing that. Yep, the topology patches in the edac tree are
not final yet, I've added them to the mix only because edac depends on
the node_id functionality. I'll fix them up later against the rr stuff.

-- 
Regards/Gruss,
    Boris.
