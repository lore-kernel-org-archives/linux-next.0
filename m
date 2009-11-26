From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: workqueues tree build failure
Date: Thu, 26 Nov 2009 17:04:07 +0900
Message-ID: <4B0E3677.6000603@kernel.org>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759411AbZKZIEU@vger.kernel.org>
In-Reply-To: <20091126190050.3f9d7fef.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

11/26/2009 05:00 PM, Stephen Rothwell wrote:
> Hi Tejun,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> sound/soc/codecs/tlv320dac33.c: In function 'dac33_i2c_probe':
> sound/soc/codecs/tlv320dac33.c:1121: error: implicit declaration of function 'create_rt_workqueue'
> sound/soc/codecs/tlv320dac33.c:1121: warning: assignment makes pointer from integer without a cast
> 
> Caused by commit 1b2d88bf4c63ed3a8c9033c358905d3463aa8bc2 ("stop_machine:
> reimplement without using workqueue") (which removed create_rt_workqueue
> ()) interacting with commit c8bf93f0fe8c5a509a29e30f3bac823fa0f6d96e
> ("ASoC: Codec driver for Texas Instruments tlv320dac33 codec") from the
> sound tree.
> 
> I have no idea how to fix this, so I have used the workqueues tree from
> next-20091125 until someone can suggest a solution.

Takashi, RT workqueue is going away.  Do you really need it?

Thanks.

-- 
tejun
