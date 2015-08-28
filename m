From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: manual merge of the rtc tree with the arm-soc tree
Date: Fri, 28 Aug 2015 10:08:09 +0200
Message-ID: <20150828080809.GU13155@piout.net>
References: <20150827162229.10fe7255@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150827162229.10fe7255@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 27/08/2015 at 16:22:29 +1000, Stephen Rothwell wrote :
>   		clock-frequency = <12000000>;
>   	};
>   
>  +	sound0: sound@0 {
>  +		compatible = "simple-audio-card";
>  +		simple-audio-card,name = "AM437x-GP-EVM";
>  +		simple-audio-card,widgets =
>  +			"Headphone", "Headphone Jack",
>  +			"Line", "Line In";
>  +		simple-audio-card,routing =
>  +			"Headphone Jack",	"HPLOUT",
>  +			"Headphone Jack",	"HPROUT",
>  +			"LINE1L",		"Line In",
>  +			"LINE1R",		"Line In";
>  +		simple-audio-card,format = "dsp_b";
>  +		simple-audio-card,bitclock-master = <&sound0_master>;
>  +		simple-audio-card,frame-master = <&sound0_master>;
>  +		simple-audio-card,bitclock-inversion;
>  +
>  +		simple-audio-card,cpu {
>  +			sound-dai = <&mcasp1>;
>  +			system-clock-frequency = <12000000>;
>  +		};
>  +
>  +		sound0_master: simple-audio-card,codec {
>  +			sound-dai = <&tlv320aic3106>;
>  +			system-clock-frequency = <12000000>;
>  +		};
>  +	};
> ++
> + 	/* fixed 32k external oscillator clock */
> + 	clk_32k_rtc: clk_32k_rtc {
> + 		#clock-cells = <0>;
> + 		compatible = "fixed-clock";
> + 		clock-frequency = <32768>;
> + 	};

It is just a matter of taste but maybe both oscillators/clocks can be
grouped.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
