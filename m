From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Mon, 18 Mar 2019 11:08:06 +0100
Message-ID: <7d368c6e-3816-14fb-da32-2aeb9c076db6@samsung.com>
References: <CGME20190317012907epcas3p129240b3dcef7d974c2fea23c26a76f2a@epcas3p1.samsung.com>
        <20190317122851.2cf734bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190317122851.2cf734bf@canb.auug.org.au>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 3/17/19 02:28, Stephen Rothwell wrote:
> In commit
> 
>   2b13bee38849 ("ASoC: samsung: odroid: Fix clock configuration for 44100 sample rate")
> 
> Fixes tag
> 
>   Fixes: fbeec965b8d1c ("ASoC: samsung: odroid: Fix 32000 sample rate handling")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Did you mean:
> 
>   1d22c337dc8f ("ASoC: samsung: odroid: Fix 32000 sample rate handling"


Yes, I unfortunately used erroneously hash from this -stable commit:
 

commit fbeec965b8d1ca4005f2b63f70fd6ed54a147027
Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Wed Mar 14 17:41:13 2018 +0100

    ASoC: samsung: odroid: Fix 32000 sample rate handling
    
    [ Upstream commit 1d22c337dc8f3a25638f7262e7bcb5729a34d140 ]
    
    In case of sample rates lower than 44100 currently there is too low MCLK
    frequency set for the CODEC. Playback fails with following errors:
    
    $ speaker-test -c2 -t sine -f 1500 -l2 -r 32000
    
    Sine wave rate is 1500.0000Hz
    Rate set to 32000Hz (requested 32000Hz)
    Buffer size range from 128 to 131072
    Period size range from 64 to 65536
    Using max buffer size 131072
    Periods = 4
    Unable to set hw params for playback: Invalid argument
    Setting of hwparams failed: Invalid argument
    
    [  497.883700] max98090 1-0010: Invalid master clock frequency
    
    To fix this the I2S root clock's frequency is increased, depending
    on sampling rate.
    
    Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
    Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
    Signed-off-by: Mark Brown <broonie@kernel.org>
    Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


-- 
Thanks,
Sylwester
