From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: Tree for Dec 19
Date: Tue, 20 Dec 2011 01:52:35 +0000
Message-ID: <20111220015235.GB8290@sirena.org.uk>
References: <20111219185556.f07c1f43e28cfd594aaa5fe0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50855 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753203Ab1LTBwi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Dec 2011 20:52:38 -0500
Content-Disposition: inline
In-Reply-To: <20111219185556.f07c1f43e28cfd594aaa5fe0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Dec 19, 2011 at 06:55:56PM +1100, Stephen Rothwell wrote:

> The regmap tree still has one build failure so I used the version of the
> tree from next-20111214.

Please tell maintainers if you're doing this.  What is the issue here?
The only thing I can think of is the broken GPIO driver that got merged
some time ago without its dependencies which you were (much more sanely)
flagging as broken.
