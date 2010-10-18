From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 18 Oct 2010 06:03:49 +0100
Message-ID: <20101018050348.GA23975@opensource.wolfsonmicro.com>
References: <20101018142934.65f5d0fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:40192 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750718Ab0JRFDf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Oct 2010 01:03:35 -0400
Content-Disposition: inline
In-Reply-To: <20101018142934.65f5d0fa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Hsiang <Peter.Hsiang@maxim-ic.com>

On Mon, Oct 18, 2010 at 02:29:34PM +1100, Stephen Rothwell wrote:

> Please, please build test what you are submitting.

> I have used the sound-asoc tree from next-20101015 for today.

Pushed a reversion of the MAX98088 driver so this will be fixed
tomorrow.
