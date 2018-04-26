From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: linux-next: build failure after merge of the clk-samsung tree
Date: Thu, 26 Apr 2018 12:26:09 +0200
Message-ID: <1a16ef47-ad28-5fc3-a06f-7bd21fd463ea@samsung.com>
References: <CGME20180425232126epcas2p1e5673f9dfc42c5e8c5e05acb70a6e352@epcas2p1.samsung.com>
        <20180426091940.16bb1faf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180426091940.16bb1faf@canb.auug.org.au>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 04/26/2018 01:19 AM, Stephen Rothwell wrote:
> After merging the clk-samsung tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from arch/arm/boot/dts/exynos5440-sd5v1.dts:10:0:
> arch/arm/boot/dts/exynos5440.dtsi:9:10: fatal error: dt-bindings/clock/exynos5440.h: No such file or directory
>  #include <dt-bindings/clock/exynos5440.h>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> Caused by commit
> 
>   f986c0e40ff5 ("clk: samsung: Remove support for Exynos5440")
> 
> I used the version of the clk-samsung tree from next-20180424 for today.

My apologies, somehow I didn't notice the build break earlier.
I drop the above mentioned commit from the for-next branch for now.

-- 
Regards,
Sylwester
