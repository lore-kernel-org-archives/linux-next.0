From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 23 Jan 2012 00:25:55 -0200
Message-ID: <4F1CC533.1050903@freescale.com>
References: <20120123121422.f3e41d97bae580544abfab63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]:10573
	"EHLO AM1EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752606Ab2AWC0P (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Jan 2012 21:26:15 -0500
In-Reply-To: <20120123121422.f3e41d97bae580544abfab63@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 1/22/2012 11:14 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/soc/codecs/sgtl5000.c:1398:18: error: 'sgtl500_dapm_widgets' undeclared here (not in a function)
> sound/soc/codecs/sgtl5000.c:1399:22: error: negative width in bit-field '<anonymous>'
> sound/soc/codecs/sgtl5000.c:1400:17: error: 'sgtl500_dapm_routes' undeclared here (not in a function)
> sound/soc/codecs/sgtl5000.c:1401:21: error: negative width in bit-field '<anonymous>'

My apologies. I have just sent the corrected patch to the alsa-devel list.

Regards,

Fabio Estevam
