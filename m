From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build warnings after merge of the regmap tree
Date: Wed, 10 Aug 2011 00:01:53 +0900
Message-ID: <20110809150152.GD15861@opensource.wolfsonmicro.com>
References: <20110809132111.af88776afc00f9e87e1bd6a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:36406 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752035Ab1HIPB5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Aug 2011 11:01:57 -0400
Content-Disposition: inline
In-Reply-To: <20110809132111.af88776afc00f9e87e1bd6a1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 09, 2011 at 01:21:11PM +1000, Stephen Rothwell wrote:

> After merging the regmap tree, today's linux-next build (x86_64
> allmodconfig) produced these warning:

Well, if you will go and test with minority architectures with strange
choices for standard types :)

Should be fixed in -next tomorrow.
