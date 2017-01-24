From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the mfd tree with the arm-soc tree
Date: Tue, 24 Jan 2017 08:16:15 +0000
Message-ID: <20170124081615.GQ16020@dell>
References: <20170124134319.2a6ba85d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170124134319.2a6ba85d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Fabrice GASNIER <fabrice.gasnier@st.com>
List-Id: linux-next.vger.kernel.org

On Tue, 24 Jan 2017, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the mfd tree got a conflict in:
> 
>   arch/arm/boot/dts/stm32f429.dtsi
> 
> between commits:
> 
>   3604ef9c8154 ("ARM: dts: stm32: Add ADC support to stm32f429")
>   dd3feb755a4a ("ARM: dts: stm32: Add RTC support for STM32F429 MCU")
> 
> from the arm-soc tree and commit:
> 
>   9072b6b2ba83 ("ARM: dts: stm32: add Timers driver for stm32f429 MCU")
> 
> from the mfd tree.

An immutable branch as already been posted for this.

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
