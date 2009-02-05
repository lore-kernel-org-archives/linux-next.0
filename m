From: Thomas Renninger <trenn@suse.de>
Subject: On top fixes for my last patches
Date: Thu,  5 Feb 2009 11:18:27 +0100
Message-ID: <1233829109-23358-1-git-send-email-trenn@suse.de>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35520 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754234AbZBEKSf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 05:18:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org

Hi,

I was a bit too quick... Adding Andrew's suggestions let
two bugs slip in.

The missing statics make the kernel not compile if ondemand
and conservative are compiled with =y.

The "replace WARN_ONCE with printk" I simply overlooked and
is just to avoid the stack_dump in the message.

Both could be fixed by replacing things in the patches themselves
(without a newline),
but as they were already committed, on top patches are probably
better?

Sorry and thanks,

   Thomas
