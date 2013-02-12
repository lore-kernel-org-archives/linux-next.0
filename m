From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the metag tree
Date: Tue, 12 Feb 2013 13:31:10 +0000
Message-ID: <201302121331.10646.arnd@arndb.de>
References: <20130212145601.09b536bef18ae4f3c8d3b3cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:63420 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933044Ab3BLNbO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Feb 2013 08:31:14 -0500
In-Reply-To: <20130212145601.09b536bef18ae4f3c8d3b3cc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Mark Rutland <mark.rutland@arm.com>

On Tuesday 12 February 2013, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-soc tree got conflicts in
> drivers/clocksource/Makefile and drivers/clocksource/Kconfig between
> commit 3fedb0674fbc ("metag: Time keeping") from the metag tree and
> commits 8a4da6e36c58 ("arm: arch_timer: move core to
> drivers/clocksource") and  ("arm64: move from arm_generic to
> arm_arch_timer") from the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

Thanks, looks good.

	Arnd
