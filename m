From: Peter Hsiang <Peter.Hsiang@maxim-ic.com>
Subject: RE: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 18 Oct 2010 13:25:12 -0700
Message-ID: <B2150E1E4418E1438554A300EA5040E40D47140D97@ITSVLEX06.it.maxim-ic.internal>
References: <20101018142934.65f5d0fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101018142934.65f5d0fa.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Oct 17, 2010, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/soc/codecs/max98088.c:28:28: error: sound/max98088.h: No such file or
> directory
> 

Mark, 

This message seems to be saying that this header file is missing.
However, this header file was included in the patch that was submitted,
and it did compile fine here before the submit.
I don't understand why it's not there after it was applied?

Thanks,

Peter
