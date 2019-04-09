From: Annaliese McDermond <nh6z@nh6z.net>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Mon, 8 Apr 2019 21:04:48 -0700
Message-ID: <22BB74F1-60F2-4880-B91E-E36E57F1FBC8@nh6z.net>
References: <20190326100145.3ee50933@canb.auug.org.au>
 <20190409091231.57cf760a@canb.auug.org.au>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.100.42\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409091231.57cf760a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen --

I’m testing a potential solution now and I’ll be submitting something in the next couple of days.  Thanks for the heads up.

--
Annaliese McDermond
nh6z@nh6z.net

> On Apr 8, 2019, at 4:12 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Hi all,
> 
> On Tue, 26 Mar 2019 10:01:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> 
>> After merging the sound-asoc tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>> 
>> sound/soc/codecs/tlv320aic32x4-clk.c: In function 'clk_aic32x4_pll_recalc_rate':
>> sound/soc/codecs/tlv320aic32x4-clk.c:149:38: warning: 'settings.d' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>     ((settings->j * 10000) + settings->d);
>>                              ~~~~~~~~^~~
>> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.d' was declared here
>>  struct clk_aic32x4_pll_muldiv settings;
>>                                ^~~~~~~~
>> sound/soc/codecs/tlv320aic32x4-clk.c:149:15: warning: 'settings.j' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>     ((settings->j * 10000) + settings->d);
>>       ~~~~~~~~^~~
>> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.j' was declared here
>>  struct clk_aic32x4_pll_muldiv settings;
>>                                ^~~~~~~~
>> sound/soc/codecs/tlv320aic32x4-clk.c:148:37: warning: 'settings.r' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>  rate = (u64) parent_rate * settings->r *
>>                             ~~~~~~~~^~~
>> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.r' was declared here
>>  struct clk_aic32x4_pll_muldiv settings;
>>                                ^~~~~~~~
>> sound/soc/codecs/tlv320aic32x4-clk.c:151:56: warning: 'settings.p' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>  return (unsigned long) DIV_ROUND_UP_ULL(rate, settings->p * 10000);
>>                                                        ^~
>> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.p' was declared here
>>  struct clk_aic32x4_pll_muldiv settings;
>>                                ^~~~~~~~
>> 
>> Introduced by commit
>> 
>>  514b044cba66 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> 
> I am still getting these warnings.
> 
> -- 
> Cheers,
> Stephen Rothwell
