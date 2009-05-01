From: Alex Williamson <alex.williamson@hp.com>
Subject: Re: [PATCH] virtio_net: Cleanup command queue scatterlist usage
Date: Fri, 01 May 2009 16:43:14 -0600
Message-ID: <1241217794.9646.588.camel@2710p.home>
References: <20090426.233014.216353908.davem@davemloft.net>
	 <20090427154925.4771.63651.stgit@debian.lart>
	 <20090501.153301.42015656.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0029.austin.hp.com ([15.216.28.36]:40322 "EHLO
	g1t0029.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753013AbZEAWnU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 18:43:20 -0400
In-Reply-To: <20090501.153301.42015656.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: rusty@rustcorp.com.au, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-next@vger.kernel.org

On Fri, 2009-05-01 at 15:33 -0700, David Miller wrote:
> From: Alex Williamson <alex.williamson@hp.com>
> Date: Mon, 27 Apr 2009 09:50:03 -0600
> 
> > We were avoiding calling sg_init* on scatterlists passed
> > into virtnet_send_command to prevent extraneous end markers.
> > This caused build warnings for uninitialized variables.
> > Cleanup the code to create proper scatterlists.
> > 
> > Signed-off-by: Alex Williamson <alex.williamson@hp.com>
> 
> This patch does not apply even to Linus's current tree.

It was against net-next-2.6.git, I'll update it for linux-2.6.git.
IIRC, it applied with some fuzz.

Alex
