From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the devicetree
 tree
Date: Tue, 31 Jul 2018 09:32:48 +0200
Message-ID: <b9b4d0ae-e022-6d2e-5fdc-97ed49664eb7@st.com>
References: <20180731154243.203068c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731154243.203068c5@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 07/31/2018 07:42 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pinctrl tree got a conflict in:
> 
>    Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
> 
> between commit:
> 
>    791d3ef2e111 ("dt-bindings: remove 'interrupt-parent' from bindings")
> 
> from the devicetree tree and commit:
> 
>    de1d08b22974 ("dt-bindings: pinctrl: add syscfg mask parameter")
> 
> from the pinctrl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

hi Stephen

thanks for the fix conflict, and the fix is OK for me.

BR
Ludo
