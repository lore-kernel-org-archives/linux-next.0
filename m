From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the
 sound-current tree
Date: Fri, 25 Aug 2017 12:37:29 +0300
Message-ID: <1503653849.25945.96.camel@linux.intel.com>
References: <20170825125705.44de0444@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170825125705.44de0444@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Rini <trini@konsulko.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2017-08-25 at 12:57 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the sound-asoc tree got a conflict in:
> 
>   sound/soc/codecs/rt5677.c
> 
> between commit:
> 
>   9ce76511b67b ("ASoC: rt5677: Reintroduce I2C device IDs")

This one AFAIU is a quick fix solely for v4.13.

Thus, the correct fix is to remove all 3 IDs from that table to get:

 static const struct i2c_device_id rt5677_i2c_id[] = {

        { }
 };
 MODULE_DEVICE_TABLE(i2c, rt5677_i2c_id);

at the end.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
