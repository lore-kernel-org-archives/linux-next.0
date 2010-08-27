From: Tony Breeds <tony@bakeyournoodle.com>
Subject: Re: Power machines fail to boot after build being successful
Date: Fri, 27 Aug 2010 10:46:26 +1000
Message-ID: <20100827004626.GU24591@ozlabs.org>
References: <4C764F52.5050707@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:37041 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341Ab0H0Aq1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Aug 2010 20:46:27 -0400
Content-Disposition: inline
In-Reply-To: <4C764F52.5050707@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: divya <dipraksh@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, benh@kernel.crashing.org, LinuxPPC-dev <linuxppc-dev@lists.ozlabs.org>, linux-next@vger.kernel.org

On Thu, Aug 26, 2010 at 04:56:10PM +0530, divya wrote:
> Hi,
> 
> After successfully building the kernel version 2.6.36-rc2-git4(commitid
> d4348c678977c) with the config file attached(used make oldconfig),
> P5 and P6 power machines fails to reboot with the following logs

<snip>

> Preparing to boot Linux version 2.6.36-rc2-autotest-next-20100826 (root@llm62) (gcc version 4.3.2 [gcc-4_3-branch revision 141291] (SUSE Linux) ) #1 SMP Thu Aug 26 10:55:01 IST 2010

You say you're booting -git4 but you're running kernel is Linux next from Aug.
26th  Can you confirm you see this boot failure with Linus's tree NOT linux
next?

Adding linux-ppc and linux-next lists.

Yours Tony
