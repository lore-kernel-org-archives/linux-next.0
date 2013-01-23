From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the tegra tree with the pm tree
Date: Wed, 23 Jan 2013 14:50:19 +0100
Message-ID: <1439364.TRor6Xo8mg@vostro.rjw.lan>
References: <20130123163303.1a8de2f38e78a20d6cb1d0a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hydra.sisk.pl ([212.160.235.94]:51792 "EHLO hydra.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753934Ab3AWNoT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jan 2013 08:44:19 -0500
In-Reply-To: <20130123163303.1a8de2f38e78a20d6cb1d0a6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Prashant Gaikwad <pgaikwad@nvidia.com>

On Wednesday, January 23, 2013 04:33:03 PM Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tegra tree got a conflict in
> drivers/clk/Makefile between commit bd3bffb544b1 ("clk: x86: add support
> for Lynxpoint LPSS clocks") from the pm tree and commit 82f6b0926514
> ("clk: tegra: add Tegra specific clocks") from the tegra tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for the notice and please carry the fix.

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
