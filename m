From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (sound-asoc tree related)
Date: Thu, 22 Sep 2011 11:23:59 +0100
Message-ID: <20110922102358.GA5173@opensource.wolfsonmicro.com>
References: <20110922184418.63db26a381abe00d73eb9c36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51843 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752710Ab1IVKYA (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Sep 2011 06:24:00 -0400
Content-Disposition: inline
In-Reply-To: <20110922184418.63db26a381abe00d73eb9c36@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bas Vermeulen <bas.vermeulen@novero.com>

On Thu, Sep 22, 2011 at 06:44:18PM +1000, Stephen Rothwell wrote:

> sound/soc/codecs/88pm860x-codec.c: In function 'pm860x_set_bias_level':
> sound/soc/codecs/88pm860x-codec.c:1184:4: error: implicit declaration of function 'udelay'

> Caused by commit 548aae8cc497 ("ASoC: 88pm860x-codec - reset the codec
> correctly") from the sound-asoc tree.  Forgot an include file.

Well, arguably that's all the header file reorganizations causing things
to break when merged.  But anyway it's fixed now.
