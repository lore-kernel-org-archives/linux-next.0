From: Matt Mackall <mpm@selenic.com>
Subject: Re: next-20081117: kernel freezes with netconsole enabled
Date: Wed, 19 Nov 2008 12:27:31 -0600
Message-ID: <1227119251.3149.57.camel@calx>
References: <20081119175740.GE12456@orion>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from waste.org ([66.93.16.53]:55996 "EHLO waste.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754606AbYKSS1j (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 13:27:39 -0500
In-Reply-To: <20081119175740.GE12456@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, satyam.sharma@gmail.com

On Wed, 2008-11-19 at 20:57 +0300, Alexander Beregalov wrote:
> Hi 
> 
> It is x86_64 SMP
> The kernel freezes while transferring kernel log through netconsole,
> SysRq does not work at that moment.

Does it survive if you boot with 'quiet'? Is this new behavior or have
you successfully used netconsole before?

-- 
Mathematics is the supreme nostalgia of our time.
