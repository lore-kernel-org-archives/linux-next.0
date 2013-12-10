From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: Request inclusion of ARM v7 cache optimization patch into
 linux-next
Date: Tue, 10 Dec 2013 11:34:01 +0000
Message-ID: <20131210113401.GA15543@e102568-lin.cambridge.arm.com>
References: <20131125112318.GA4179@e102568-lin.cambridge.arm.com>
 <20131126103343.bb5990829d3c0f2c0fc0723d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:52793 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752086Ab3LJLeH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2013 06:34:07 -0500
In-Reply-To: <20131126103343.bb5990829d3c0f2c0fc0723d@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>

Hi Stephen,

On Mon, Nov 25, 2013 at 11:33:43PM +0000, Stephen Rothwell wrote:
> Hi Lorenzo,
> 
> On Mon, 25 Nov 2013 11:23:18 +0000 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote:
> >
> > can I ask you please to include the following branch into linux-next:
> > 
> > git://linux-arm.org/linux-2.6-lp.git v7-cache-opt
> > 
> > It contains a patch implementing cache optimizations for ARM 32-bit v7
> > architectures, it was reviewed and tested but -next would give it wider
> > test coverage before it gets merged in the coming cycle, so please
> > include it as soon as you deem fit.
> 
> Included from today.  Please remember to ask me to remove it when it has
> been merged upstream (since I assume it will no longer be necessary).

You can remove the branch now, since the patch has been queued through
the ARM tree and will reappear shortly as such.

Thank you very much for your help,
Lorenzo
