From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next:  rr series import failure
Date: Wed, 17 Dec 2008 16:27:25 -0800
Message-ID: <494998ED.6080206@sgi.com>
References: <20081218105019.6f564a38.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:39092 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752558AbYLRA12 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 19:27:28 -0500
In-Reply-To: <20081218105019.6f564a38.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@redhat.com>

...
> cpumask:add_sysfs_displays_for_configured_and_disabled_cpu_maps.patch
> error: patch failed: arch/x86/kernel/smpboot.c:1293
> error: arch/x86/kernel/smpboot.c: patch does not apply
> 
> So I have dropped it for today.

Hi Stephen,

This is my fault.  I should have pulled the x86 only file
to a patch for tip/cpus4096.  Rusty - do you want to do this
in your rr queue?

(Ingo - this will be another "dependency" patch needed by tips/cpus4096.)

Thanks,
Mike
