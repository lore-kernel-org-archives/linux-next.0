From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: Tree for July 26 (xen)
Date: Mon, 26 Jul 2010 17:38:40 -0700
Message-ID: <4C4E2A90.3040902@goop.org>
References: <20100726154809.7f42c137.sfr@canb.auug.org.au> <20100726091651.f4ed28b8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:38308 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752245Ab0G0Ail (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jul 2010 20:38:41 -0400
In-Reply-To: <20100726091651.f4ed28b8.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

  On 07/26/2010 09:16 AM, Randy Dunlap wrote:
> On Mon, 26 Jul 2010 15:48:09 +1000 Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20100723:
>>
>> Undropped tree: xen
>>
>> The xen tree lost its build problems but gained a couple more for which I
>> reverted a commit and a subtreee.
>
> when CONFIG_SMP is not enabled:
>
> arch/x86/xen/enlighten.c:112: error: 'setup_max_cpus' undeclared (first use in this function)

Thanks, I've fixed it up.

     J
