From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the final tree
	(devicetree tree related)
Date: Tue, 18 May 2010 05:52:53 -0600
Message-ID: <AANLkTil4MIKUrzK-SOS9satdcL34F5B_3D6ddFn6lThL@mail.gmail.com>
References: <20100518174750.cc965d84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:50178 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755102Ab0ERLxO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 May 2010 07:53:14 -0400
In-Reply-To: <20100518174750.cc965d84.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 18, 2010 at 1:47 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> After merging the final tree, yesterday's linux-next build (powerpc
> mpc85xx_defconfig) failed like this:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/2615202/
>
> I suspect that is something to do with the devicetree tree.

Ah, yes.  I'll push out fixes for those this morning.

g.
