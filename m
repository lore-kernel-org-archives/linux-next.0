From: James Morris <jmorris@namei.org>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Sat, 9 Aug 2008 07:48:05 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808090747150.29079@tundra.namei.org>
References: <1218214935.3146.5.camel@dhcppc0>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:42268 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753282AbYHHVsp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 17:48:45 -0400
In-Reply-To: <1218214935.3146.5.camel@dhcppc0>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, David Howells <dhowells@redhat.com>

On Fri, 8 Aug 2008, Thomas Meyer wrote:

> Hi.
> 
> Beginning with next-20080808 after letting the system run for 5 minutes
> or so, I get an error from the fork call, e.g.:
> 
> "bash: fork: Resource temporarily unavailable"
> 
> Doing an "echo c > /proc/sysrq-trigger" I was able to get an vmcore dump
> of the running kernel using the kdump mechanism.
> 
> what should i do next?

Which distro and version are you using?  Please post your .config file.


-- 
James Morris
<jmorris@namei.org>
