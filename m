From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: linux-next: manual merge of the samsung-krzk tree with the arm-soc
 tree
Date: Fri, 16 Sep 2016 10:50:52 +0200
Message-ID: <531f80d6-4cf6-ae83-7cb6-e002a6e8f63f@kernel.org>
References: <20160905111948.553487be@canb.auug.org.au>
 <CGME20160916085054eucas1p261bf6f0fb00e860fb819139557ffe5bb@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160905111948.553487be@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

On 09/05/2016 03:19 AM, Stephen Rothwell wrote:
> Hi Krzysztof,
> 
> Today's linux-next merge of the samsung-krzk tree got a conflict in:
> 
>   arch/arm64/boot/dts/exynos/exynos7.dtsi
> 
> between commit:
> 
>   585dcacac6bb ("arm64: dts: Fix broken architected timer interrupt trigger")
> 
> from the arm-soc tree and commit:
> 
>   36d1c9cd07cd ("arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags")
> 
> from the samsung-krzk tree.
> 
> I fixed it up (I *think* - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

The fix is correct, for the record:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Merge conflict was (unfortunately) expected. In general, the
multiple-platform-at-once patches are conflict prone. Especially in this
case, Marc's patch ("arm64: dts: Fix broken architected...") could be
split per architecture.

Best regards,
Krzysztof
