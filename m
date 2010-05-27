From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: build warnings after merge of the acpi tree
Date: Thu, 27 May 2010 01:14:21 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1005270113170.4039@localhost.localdomain>
References: <20100527144111.84b2e651.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:60936 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932190Ab0E0FO0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2010 01:14:26 -0400
In-reply-to: <20100527144111.84b2e651.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> drivers/idle/intel_idle.c:324: warning: unused variable 'cstate'

fixed in the latest version.

thanks,
Len Brown, Intel Open Source Technology Center
