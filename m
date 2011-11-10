From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] [PATCH] MIPS/sound: DB1200 audio support depends
 on MIPS arch.
Date: Thu, 10 Nov 2011 11:34:48 +0000
Message-ID: <20111110113448.GF21630@sirena.org.uk>
References: <20111110122241.eed1e785e4c015a51b9ef585@canb.auug.org.au>
 <1320924059-4142-1-git-send-email-manuel.lauss@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:41482 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219Ab1KJLew (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2011 06:34:52 -0500
Content-Disposition: inline
In-Reply-To: <1320924059-4142-1-git-send-email-manuel.lauss@googlemail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: alsa-devel@alsa-project.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, alsa-devel@vger.kernel.org

On Thu, Nov 10, 2011 at 12:20:59PM +0100, Manuel Lauss wrote:
> DB1200 audio support should only be visible if MIPS/Alchemy arch is
> selected.  Fixes an x86-allmodconfig build failure in linux-next.

Applied but *always* CC maintainers on patches.
